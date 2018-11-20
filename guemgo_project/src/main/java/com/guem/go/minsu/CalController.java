package com.guem.go.minsu;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guem.go.kidong.ChatService;
import com.guem.go.kidong.ChatVo;

@Controller
public class CalController {
	@Autowired
	private ScheService scheService;
	@Autowired
	private Sche_detailService sche_detailService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private MatchingService matService;
	
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public String select() {
		return "kidong/select";
	}
	
	@RequestMapping(value="/calaaa", method=RequestMethod.GET)
	public String sche(HttpServletRequest request, Model model) {
		String email = (String)request.getSession().getAttribute("email");
		String other = "min"; // 채팅방에서 받아오기
		String lecture = request.getParameter("lecture");
		System.out.println(lecture);
		String[] lss = lecture.split("/");
		String lecturename = lss[1]; // select에서
		int lectureNum = Integer.parseInt(lss[0]); // select에서
		System.out.println("lectureNum: " + lectureNum );
		int matchNum = 1; // 요청서에서 시작해서 받아오기
		int scheduleNum = scheService.scheduleNum() + 1;
		System.out.println("스케줄넘 " + scheduleNum);
		int sche_detailNum = sche_detailService.sche_detailNum();
		//먼저 스케줄 테이블 insert
		/*ScheduleVo vo = new ScheduleVo(scheduleNum, email, other, lectureNum, matchNum, lecturename);
		scheService.insert(vo);*/
		
		//매칭성공 테이블 
		MatchingVo mvo = new MatchingVo(0, matchNum, lectureNum, email, other, null);
		matService.insert(mvo);
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//String email = request.getSession().getAttribute("email");
		int count = Integer.parseInt(request.getParameter("count"));
		String[] day = request.getParameterValues("day");
		int time = Integer.parseInt(request.getParameter("time"));
		String startDate = request.getParameter("startDate");
		String[] ss = startDate.split("-");
		cal.set(Integer.parseInt(ss[0]), Integer.parseInt(ss[1])-1, Integer.parseInt(ss[2]));
		int room = Integer.parseInt(request.getParameter("room"));
		
		System.out.println("startDate" + startDate);
		System.out.println("count" + count);
		System.out.println("day" + day.length);
		System.out.println(cal.get(Calendar.DAY_OF_WEEK)); // 요일
		int currDay = cal.get(Calendar.DAY_OF_WEEK);
		int index = -1;
		int[] addDay = new int[day.length];
		for(int i=0;i<day.length;i++) {
			if(currDay==Integer.parseInt(day[i])) {
				index = i;
			}
			if(i==day.length-1) {
				addDay[i] = (Integer.parseInt(day[0]) - Integer.parseInt(day[i])) + 7;
			}else {
				addDay[i] = Integer.parseInt(day[i+1]) - Integer.parseInt(day[i]);
			}
			System.out.println(addDay[i]);
		}
		String[] start = new String[count];
		String[] end = new String[count];
		int[] array_schedetailNum = new int[count];
		if(index>=0) {
			for(int i=0,j=index;i<count;i++,j++) {
				array_schedetailNum[i] = sche_detailNum + i; 
				if(j>=day.length) j =0;
				start[i] = sdf.format(cal.getTime()) + "T" + time + ":00:00";
				end[i] = sdf.format(cal.getTime()) + "T" + (time+2) + ":00:00";
				cal.add(Calendar.DATE, addDay[j]);
				System.out.println(start[i] + " " + end[i]);
			}
		}else {
			model.addAttribute("msg", "선택한 요일 중 시작날짜를 골라주세여");
			model.addAttribute("room", room);
			//return "minsu/click";
			return ".kidong.chat";
		}
		
		List<ChatVo> list = chatService.list(room);
		model.addAttribute("list", list);
		model.addAttribute("room", room);
		
		model.addAttribute("ar_sche_detailNum", array_schedetailNum);
		model.addAttribute("sche_detailNum", sche_detailNum);
		model.addAttribute("email", email);
		model.addAttribute("lecturename", lecturename);
		model.addAttribute("scheduleNum", scheduleNum);
		model.addAttribute("other", other);
		model.addAttribute("lectureNum", lectureNum);
		model.addAttribute("matchNum", matchNum);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("scheselect", "ok");
		//return "minsu/click";
		return ".kidong.chat";
	}
}
