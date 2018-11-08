package com.guem.go.minsu;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalController {
	@Autowired
	private ScheService scheService;
	@Autowired
	private Sche_detailService sche_detailService;
	
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public String select() {
		return "minsu/select";
	}
	@RequestMapping(value="/calaaa", method=RequestMethod.GET)
	public String sche(HttpServletRequest request, Model model) {
		/*String email = (String)request.getSession().getAttribute("email");*/
		String email = "dd"; // 로그인 세션
		String other = "min"; // 채팅방
		String lecturename = "drawing"; // select에서
		int lectureNum = 1; // select에서
		int matchNum = 1; // 요청서에서 시작
		ScheduleVo vo = new ScheduleVo(0, email, other, lectureNum, matchNum, lecturename);
		scheService.insert(vo);
		int scheduleNum = scheService.scheduleNum();
		int sche_detailNum = sche_detailService.sche_detailNum();
		
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
			return "kidong/chat";
		}

		model.addAttribute("room", room);
		model.addAttribute("ar_sche_detailNum", array_schedetailNum);
		model.addAttribute("sche_detailNum", sche_detailNum);
		//model.addAttribute("email", email);
		model.addAttribute("lecturename", lecturename);
		model.addAttribute("scheduleNum", scheduleNum);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("scheselect", "ok");
		//return "minsu/click";
		return "kidong/chat";
	}
}
