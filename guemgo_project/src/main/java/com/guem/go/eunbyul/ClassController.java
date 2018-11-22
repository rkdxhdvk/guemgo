
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
		//여기서 area랑 카테고리(소)테이블 명칭을 비교해서 해당 명칭의 중넘버를 찾는다
		//중넘버를 찾아서 카테고리 중으로 가고
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
		
		////////////////////매칭 신청 설문조사 insert/////////////////
		
		//1.파라미터로 작성한 값 받아오기
		String classname=request.getParameter("classname"); //강의명
		String explanation=request.getParameter("explanation"); //강의설명
		String gonum=request.getParameter("gonum"); //고수번호
		int num=Integer.parseInt(gonum); //int로변환
		String area=request.getParameter("area2"); //레슨할 분야
		String[] days=request.getParameterValues("days"); //가능한 요일
		String time=request.getParameter("time"); //가능한 시간대
		String addr1=request.getParameter("addr1"); 
		String region[] = addr1.split(" ");
		String region1=region[0]+region[1]; //ex)제주도 서귀포시
		String addr2=request.getParameter("addr2"); 
		String region2=""; //나머지주소
		String day=""; //요일 '/'로 담음
		
		//2.배열로 된 값들 정리하기
		for(int i=0; i<days.length; i++	) {
			day+=("/"+days[i]);
		}
		day.substring(2,day.length());
		for(int i=2; i<region.length; i++){ 
			region2+=(region[i]+" ");
		}
		region2+=addr2;
		
		//3.lecture 테이블에 insert하기
		LectureVo vo=new LectureVo(0,classname,region1,region2,day,time,num,explanation,0);
		classService.classinsert(vo);
		
		//4.gosu_area테이블에 insert
		/*for(int i=0; i<area.length; i++	) { 고수가 선택한 수업과목들이 gosu_area테이블에 추가된다.
			GosuareaVo vo2=new GosuareaVo(area[i], 0);
			classService.areainsert(vo2);
		}*/
		GosuareaVo vo2=new GosuareaVo(area, 0);
		classService.areainsert(vo2);
		
		
		/////////////////////강의테이블과 비교해서 매칭하기///////////////////////
		
		
		//1.area(과목)을 비교한다
		
		//2.region1(지역)을 비교한다 (region1의 시작이 '서울'이면 서울까지만 비교하고 뿌려주고 그게 아니면 다비교해준다.)
		
		//3.day 요일을 비교한다
		
		//4.time 시간대를 비교한다
		
		//5.gender 성별을 비교한다


		
		
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
