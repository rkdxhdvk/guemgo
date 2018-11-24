package com.guem.go.eunbyul;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.minsu.MatchingVo;
import com.guem.go.minsu.ScheService;
import com.guem.go.minsu.ScheduleVo;

@Controller
public class OngoingController {
	@Autowired private OngoingService onservice;
	@Autowired private ClassService classsurvice;
	@Autowired private ScheService scheservice;
	@RequestMapping(value="/ongoingClass", method=RequestMethod.GET)
	public ModelAndView ongoingClass(String email) {
		ModelAndView mv=new ModelAndView();
		ArrayList<OngoingVo> list= new ArrayList<>();
		mv.setViewName(".eunbyul.ongoingClass");
		
		//��Ī���̺�ΰ��� �ش� �̸��Ͽ� ��Ī�Ǿ��ִ°� ��������
		List<MatchingVo> macthlist=onservice.matchselect(email);
		for(int i=0; i<macthlist.size(); i++) {
			int matchingnum=macthlist.get(i).getMatchingNum();
			String gosuemail=macthlist.get(i).getGosu();
			Date startday=macthlist.get(i).getMatchDate();
			//���ǹ�ȣ�� �����̸���������
			LectureVo vo=classsurvice.classSelect(macthlist.get(i).getLectureNum());
			String lecturename=vo.getLectureName();
			int lectureNum=vo.getLectureNum();
			int state=1;
			System.out.println("dkdk");
			HashMap<String, Object> map=new HashMap<>();
			map.put("email", gosuemail);
			map.put("other", email);
			map.put("lectureNum", lectureNum);
			System.out.println("dddd"+gosuemail+gosuemail+lectureNum);
			ScheduleVo svo=scheservice.isschedule(map);
			mv.addObject("lecturenum", svo.getLectureNum());
			
			if(svo != null) {
			System.out.println("��������?"+matchingnum+lecturename+gosuemail+startday+ state+svo.getScheduleNum());
			
			OngoingVo onvo=new OngoingVo(matchingnum, lecturename, gosuemail, startday, state,svo.getScheduleNum(),lectureNum);
			list.add(onvo);
			}else {
				OngoingVo onvo=new OngoingVo(matchingnum, lecturename, gosuemail, startday, state,0,lectureNum);
				list.add(onvo);
			}
			
		}
		/*//1.�̸��Ϸ� ��û�����̺�(require)���� req_start�� 1�̰ų� 2�� ��û���� ã�ƿ´�
		List<RequireVo> reqlist=onservice.select_ongoing(email);
		System.out.println("dd"+reqlist.get(0).getReq_num());
		
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
			System.out.println(onlist.getLecturenum()+onlist.getLecturename());
			list.add(onlist);
			
		}*/
		
		
		
		
		mv.addObject("list", list);
		mv.addObject("email", email);
		return mv;
	}
}


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
