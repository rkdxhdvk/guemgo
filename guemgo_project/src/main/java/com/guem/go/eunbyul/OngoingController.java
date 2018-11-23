package com.guem.go.eunbyul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OngoingController {
	@Autowired private OngoingService onservice;
	@Autowired private ClassService classsurvice;
	@RequestMapping(value="/ongoingClass", method=RequestMethod.GET)
	public ModelAndView ongoingClass(String email) {
		ModelAndView mv=new ModelAndView();
		ArrayList<OngoingVo> list= new ArrayList<>();
		//1.�̸��Ϸ� ��û�����̺�(require)���� req_start�� 1�̰ų� 2�� ��û���� ã�ƿ´�
		List<RequireVo> reqlist=onservice.select_ongoing(email);
		mv.setViewName("eunbyul/ongoingClass");
		for(int i=0; i<reqlist.size(); i++) {
		//2. 1���� ��û����ȣ�� ������ ������û���� ���̺����� �̸����� ã�ƿ´�.
			System.out.println("��������"+reqlist.get(i).getReq_num());
		//�ش� ��û��ȣ�� ���°� 1�ΰ͸� �������� ������û��������.
			RequirelistVo vo=onservice.select_email(reqlist.get(i).getReq_num());
			HashMap<String, Object> map=new HashMap<>();
			map.put("reqnum", reqlist.get(i).getReq_num());
			map.put("lecturenum", vo.getLecturenum());
		//���ǹ�ȣ�� �������̺����� ���Ǹ�������
			LectureVo lecvo=classsurvice.classSelect(vo.getLecturenum());
			int lecturenum=reqlist.get(i).getReq_num();
			String lecturename=lecvo.getLectureName();
			String gosuemail=vo.getEmail();
			int ongoing=50;
			int state=vo.getState();
			OngoingVo onlist=new OngoingVo(lecturenum, lecturename, gosuemail , ongoing, state);
			list.add(onlist);
			
		}
		mv.addObject("list", list);
		//3. 2���� �̸����� ������ ������̺��� �����ȣ�� ã�ƿ´�
		//�ϴ� ������û ������ ���ǹ�ȣ�� �־�߰ٴ�..!
/*		ArrayList<LectureVo> leclist=new ArrayList<>();
		for(int i=0; i<requlist2.size(); i++) {
			leclist.add(onservice.select_lec(requlist2.get(i).getLecturenum()));
			System.out.println(leclist.get(i).getLectureName());
		}
		*/
		
		/*		select gosu_num from gosu where email=#{email}
		
		select * from lecture where go_num=
		(select go_num from gosu where email=(select email from requirelist where req_num=170))
		
		//4. 3���� �����ȣ�� ������ �������̺��� ���� ��� ���ǹ�ȣ�� ã�ƿ´�
		select * from lecture where gosu_num=#{gosu_num}
		
		//5. 4���� ���� ��ȣ�� ������ �󼼺о����̺��� ��Ī�� �����´�.--�̰� �ʿ���� �� �� �ְڴ°�?
		select * from gosu_area where lec_num=#{lec_num}
		
		
		select * from gosu_area a,
		(select * from lecture where gosu_num=
		(select gosu_num from gosu where email=(select email from requirelist where req_num=#{req_num}))) b
		where lec_num=b.lec_num;
		
		�������� ���� ���������� �ʿ��� ����:
		���Ǹ�, ���ǹ�ȣ, ���ǽ�����, ����̸���, ���������, �����Ȳ
		*/
		return mv;
	}
}
