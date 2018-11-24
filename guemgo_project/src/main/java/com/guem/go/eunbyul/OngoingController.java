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
		
		//매칭테이블로가서 해당 이메일에 매칭되어있는거 가져오기
		List<MatchingVo> macthlist=onservice.matchselect(email);
		for(int i=0; i<macthlist.size(); i++) {
			int matchingnum=macthlist.get(i).getMatchingNum();
			String gosuemail=macthlist.get(i).getGosu();
			Date startday=macthlist.get(i).getMatchDate();
			//강의번호로 강의이름가져오기
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
			System.out.println("나오나요?"+matchingnum+lecturename+gosuemail+startday+ state+svo.getScheduleNum());
			
			OngoingVo onvo=new OngoingVo(matchingnum, lecturename, gosuemail, startday, state,svo.getScheduleNum(),lectureNum);
			list.add(onvo);
			}else {
				OngoingVo onvo=new OngoingVo(matchingnum, lecturename, gosuemail, startday, state,0,lectureNum);
				list.add(onvo);
			}
			
		}
		/*//1.이메일로 요청서테이블(require)에서 req_start가 1이거나 2인 요청서를 찾아온다
		List<RequireVo> reqlist=onservice.select_ongoing(email);
		System.out.println("dd"+reqlist.get(0).getReq_num());
		
		for(int i=0; i<reqlist.size(); i++) {
		//2. 1번의 요청서번호를 가지고 받은요청내역 테이블에가서 이메일을 찾아온다.
			System.out.println("나오나요"+reqlist.get(i).getReq_num());
		//해당 요청번호에 상태가 1인것만 가져오기 받은요청내역에서.
			RequirelistVo vo=onservice.select_email(reqlist.get(i).getReq_num());
			HashMap<String, Object> map=new HashMap<>();
			map.put("reqnum", reqlist.get(i).getReq_num());
			map.put("lecturenum", vo.getLecturenum());
		//강의번호로 강의테이블에가서 강의명가져오기
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


//3. 2번의 이메일을 가지고 고수테이블에서 고수번호를 찾아온다
		//일단 받은요청 내역에 강의번호를 넣어야겟다..!
/*		ArrayList<LectureVo> leclist=new ArrayList<>();
		for(int i=0; i<requlist2.size(); i++) {
			leclist.add(onservice.select_lec(requlist2.get(i).getLecturenum()));
			System.out.println(leclist.get(i).getLectureName());
		}
		*/
		
		/*		select gosu_num from gosu where email=#{email}
		
		select * from lecture where go_num=
		(select go_num from gosu where email=(select email from requirelist where req_num=170))
		
		//4. 3번의 고수번호를 가지고 강의테이블에서 강의 명과 강의번호를 찾아온다
		select * from lecture where gosu_num=#{gosu_num}
		
		//5. 4번의 강의 번호를 가지고 상세분야테이블에서 명칭을 가져온다.--이거 필요없을 수 도 있겠는걸?
		select * from gosu_area where lec_num=#{lec_num}
		
		
		select * from gosu_area a,
		(select * from lecture where gosu_num=
		(select gosu_num from gosu where email=(select email from requirelist where req_num=#{req_num}))) b
		where lec_num=b.lec_num;
		
		진행중인 강의 페이지에서 필요함 값들:
		강의명, 강의번호, 강의시작일, 고수이메일, 강의진행률, 진행상황
		*/
