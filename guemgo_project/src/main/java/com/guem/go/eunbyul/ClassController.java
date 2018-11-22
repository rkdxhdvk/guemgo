
package com.guem.go.eunbyul;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.woohyun.GosuVo;


@Controller
public class ClassController {
	@Autowired
	private ClassService classService;
	@Autowired
	private CateService cateservice;

	
	@RequestMapping(value = "/classinsert", method = RequestMethod.GET)
	public ModelAndView classinsert(String email){
		System.out.println("jmjmjmjmjmjmjmjmjmjmjmjmjmjmjmjm");
		//���⼭ area�� ī�װ�(��)���̺� ��Ī�� ���ؼ� �ش� ��Ī�� �߳ѹ��� ã�´�
		//�߳ѹ��� ã�Ƽ� ī�װ� ������ ����
		List<CatemVo> list=cateservice.catemlist();
		ModelAndView mv= new ModelAndView(".eunbyul.classinsert");
/*		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).m_name);
		}*/
		GosuVo vo=classService.gosuselect(email);
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		System.out.println("hhhhhhhhhhhhhhhhhhhhh");
        return mv;
	}
	@RequestMapping(value="/classinsertOk", method=RequestMethod.POST)
	public String insertOk(HttpServletRequest request) {
		
		////////////////////��Ī ��û �������� insert/////////////////
		
		//1.�Ķ���ͷ� �ۼ��� �� �޾ƿ���
		String classname=request.getParameter("classname"); //���Ǹ�
		String explanation=request.getParameter("explanation"); //���Ǽ���
		String gonum=request.getParameter("gonum"); //�����ȣ
		int num=Integer.parseInt(gonum); //int�κ�ȯ
		String area=request.getParameter("area2"); //������ �о�
		String[] days=request.getParameterValues("days"); //������ ����
		String time=request.getParameter("time"); //������ �ð���
		String addr1=request.getParameter("addr1"); 
		String region[] = addr1.split(" ");
		String region1=region[0]+region[1]; //ex)���ֵ� ��������
		String addr2=request.getParameter("addr2"); 
		String region2=""; //�������ּ�
		String day=""; //���� '/'�� ����
		
		//2.�迭�� �� ���� �����ϱ�
		for(int i=0; i<days.length; i++	) {
			day+=("/"+days[i]);
		}
		day.substring(2,day.length());
		for(int i=2; i<region.length; i++){ 
			region2+=(region[i]+" ");
		}
		region2+=addr2;
		
		//3.lecture ���̺� insert�ϱ�
		LectureVo vo=new LectureVo(0,classname,region1,region2,day,time,num,explanation,0);
		classService.classinsert(vo);
		
		//4.gosu_area���̺� insert
		/*for(int i=0; i<area.length; i++	) { ����� ������ ����������� gosu_area���̺� �߰��ȴ�.
			GosuareaVo vo2=new GosuareaVo(area[i], 0);
			classService.areainsert(vo2);
		}*/
		GosuareaVo vo2=new GosuareaVo(area, 0);
		classService.areainsert(vo2);
		
		
		/////////////////////�������̺�� ���ؼ� ��Ī�ϱ�///////////////////////
		
		
		//1.area(����)�� ���Ѵ�
		
		//2.region1(����)�� ���Ѵ� (region1�� ������ '����'�̸� ��������� ���ϰ� �ѷ��ְ� �װ� �ƴϸ� �ٺ����ش�.)
		
		//3.day ������ ���Ѵ�
		
		//4.time �ð��븦 ���Ѵ�
		
		//5.gender ������ ���Ѵ�


		
		
		return "eunbyul/classinsertOk";
		
	}
	@RequestMapping(value="/select/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getArea2(String val) {
		System.out.println("val:"+val);
		
		List<CatesVo> list = cateservice.selectcates(val);

		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<myarea>");
		for(CatesVo vo:list) {
			System.out.println(vo.getSname());
			sb.append("<area>");
			sb.append("<snum>"+ vo.getSnum() +"</snum>");
			sb.append("<sname>"+ vo.getSname()+"</sname>");
			sb.append("<mnum>"+ vo.getMnum() +"</mnum>");
			sb.append("</area>");
		}
		sb.append("</myarea>");
		return sb.toString();
	}
	
	
	@RequestMapping(value="/classlistOk",method=RequestMethod.GET)
	public void  classlist() {
		
	}
	


	
}
