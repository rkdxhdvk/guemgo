package com.guem.go.eunbyul;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.woohyun.GosuVo;
import com.sun.mail.util.logging.MailHandler;



@Controller
public class SurveyController {
	@Inject private JavaMailSender mailSender;
	@Autowired
	private SurveyService surveyservice;
	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public ModelAndView survey(HttpServletRequest request){//설문지 작성 창으로 보내주기
		String area=request.getParameter("area");
		CatemVo vo=surveyservice.selectcatem(area);
		String mname=vo.getMname();
		List<CatesVo> list=surveyservice.selectcates(mname);
		System.out.println(area+mname);
		//질문 찾아서 담기
		List<QuestionVo> quelist=surveyservice.quelist();
		//보기 찾아서 담기
		List<ExampleVo> exlist=surveyservice.exlist();
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("eunbyul/survey");
		mv.addObject("list", list);
		mv.addObject("quelist", quelist);
		mv.addObject("exlist", exlist);
		mv.addObject("area", area);
		String email=(String)request.getSession().getAttribute("email");
		if(email == null || email == "") {
			mv.setViewName("redirect:/login");
			return mv;
		}
        return mv;
	}

	@RequestMapping(value = "/survey", method = RequestMethod.POST)
	public ModelAndView surveyOk(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		
		String area=request.getParameter("selectarea");//하고싶은 과목
		String[] ans= new String[10];//답변들을 담을 스트링배열
		ans[0]=request.getParameter("purpose"); //목적(취미,입시...)
		ans[1]=request.getParameter("experience"); //경력(입문,1년..)
		ans[2]=request.getParameter("age");//학생나이
		String[] days=request.getParameterValues("day"); //가능한 요일
		ans[3]="";//요일
		ans[4]=request.getParameter("time"); //몇시대?
		ans[5]=request.getParameter("times"); //주몇번?
		ans[6]=request.getParameter("hour"); //몇시간?
		ans[7]=request.getParameter("start"); //시작일
		String addr1=request.getParameter("addr1"); 
		String region[] = addr1.split(" ");
		ans[8]=region[0]+region[1]; //ex)제주도 서귀포시
		String addr2=request.getParameter("addr2"); 
		String region2=""; //나머지주소 
		for(int i=2; i<region.length; i++){ 
			region2+=(region[i]+" ");
		}
		region2+=addr2;	
		ans[9]=request.getParameter("anything"); //하고싶은말
		for(int i=0; i<days.length; i++	) {
			ans[3]+=("/"+days[i]);
		}
		ans[3].substring(2,ans[3].length());
		
		String email=request.getParameter("email");//로그인 사용자 email
		//요청서 만들기
				CatemVo mvo=surveyservice.selectcatem(area);
				RequireVo vo=new RequireVo(0, email , mvo.mnum, 0 , null);
				int n=surveyservice.insert(vo);//require테이블에 insert

		//답변 테이블에 값 넣기
			int n1=0;
			for(int i=2; i<12; i++) {
			AnswerVo vo2 = new AnswerVo(0, 0, i, ans[i-2]);
			n1=surveyservice.ansinsert(vo2);
			}
		
		//답변을 gosu_area테이블의 컬럼이랑 비교해서 강의 테이블에서 강의넘버로 정보가져와서 비교하기
			/*List<E>surveyservice.anslist(email);*/
			
			List<GosuareaVo> arealist =surveyservice.gosuarealist();//arealist를 받아옴
			ArrayList<Integer> matchlec= new ArrayList<>();
			for(int i=0; i<arealist.size(); i++) {//들어온 요청서와 같은 area의 강의 넘버를 받아옴.
				System.out.println("바교"+arealist.get(i).getLectureNum());
				if(area.equals(arealist.get(i).getArea())) {
					matchlec.add(arealist.get(i).getLectureNum());
				}
				
			}
			
		//area가 같은 강의넘버를 찾았으니 강의테이블에가서 해당 강의 넘버들의 다른 정보들을 가져오자
			
			ArrayList<LectureVo> leclist= new ArrayList<>();
			for(int i=0; i<matchlec.size(); i++) {
				System.out.println("이거나오나???"+matchlec.get(i));
				LectureVo lvo = surveyservice.selectlec(matchlec.get(i));
				System.out.println("이거나오나"+lvo.getLectureName());
				leclist.add(lvo);
			}
			
		//해당 강의 넘버들의 다른 정보들을 가져왔다. 이제 하나씩 꺼내서 비교해보자
			ArrayList<LectureVo> matching=new ArrayList<>();
			
			
			////////1. day 요일 비교다. ans[3]
			String day[] =ans[3].split("/"); //요일이 배열로 담김.
			int a=0;
			int b=0;
			boolean d=false;
		for (int i = 0; i < leclist.size(); i++) {
			System.out.println(leclist.get(i).getLectureName()); 
			System.out.println(leclist.get(i).getLectureNum());
			System.out.println(leclist.get(i).getGo_num());
			System.out.println("for문시작");
			String lecday = leclist.get(i).getDay();
			System.out.println("강의요일" + lecday);
			
			for (int j = 1; j < day.length; j++) {
				System.out.println("학생이 가능한 요일:" + day[j]);
				if (lecday.contains(day[j])) {// 강의의 요일에 요청한 요일이 있는지 체크하기
					System.out.println("a" + day[j] + "가들었음");
					a++;
				} else if (!lecday.contains(day[j])) {
					b++;
					System.out.println("b");
				}
			}
			
			if (a >= b) {// 맞는 요일이 반이상이면 다음 조건 검사
				System.out.println("a>b");
				//////////// 2. time 시간대 비교
				System.out.println(ans[4]);
				System.out.println(leclist.get(i).getTime());
				if (ans[4].equals(leclist.get(i).getTime())) {// 시간대 검사 맞으면 다음조건실행
					System.out.println("시간대매칭성공");
					//////////// 3. region1 지역비교
					if (ans[8].equals(leclist.get(i).getRegion1())) {
						LectureVo lvo2 = leclist.get(i);
						matching.add(lvo2); // 맞는 사람들 matching에 임시로 저장해두기
						break;
					}
				}
			}
		}
		//System.out.println(ans[1]+ans[2]+ans[3]+ans[4]+ans[5]);
		for (int i = 0; i < matching.size(); i++) {
			 //누가누가 담겨있나 확인하기
			System.out.println(matching.get(i).getLectureName() + matching.get(i).getGo_num());
			//matching에 있는 gosunum을 가져와서 email을 뽑아내기
			int gosunum=matching.get(i).getGo_num();
			GosuVo gosu=surveyservice.selectgosu(gosunum);
			System.out.println("보낼고수"+gosu.getEmail());
			/*
			try {
				sender.sendMail(title, content, "92eunbyul@naver.com", "92eunbyul@naver.com");
			}catch(Exception e) {
			System.out.println(e.getMessage());
			}*/
			
			SimpleMailSender sendMail = new SimpleMailSender(mailSender);
			sendMail.setSubject(area +" 레슨 요청서가 도착했습니다.");
			sendMail.setText(new StringBuffer().append("<link rel=\"stylesheet\" href=\"/go/resources/css/custom.css\">")
					.append("<section class='container'>")
					.append("<div class=\"modal-dialog\">")
					.append("<div class=\"modal-content\">")
					.append("<div class=\"modal-header\">")
					.append("<h5 class=\"modal-title\" id=\"modal\">서은별님이 있는 곳 주변에서 새로운 요청이 들어왔어요.</h5>")
					.append("</div>")
					.append("<div class=\"modal-body\">")
					.append("<h2>요청서 내역</h2>")
					.append("<form>")
					.append("<div class=\"form-row\">")
					.append("<div class=\"form-group col-sm-12\">")
					.append("<h3>무엇을 배우고 싶으신가요?</h3>")
					.append(area)
					.append("</div>")
					.append("</div>")
					.append("<h3>레슨을 받는 목적이 무엇인가요?</h3>")
					.append(ans[0])
					.append("<h3>경력이 있나요?</h3>")
					.append(ans[1])
					.append("<h3>학생은 몇 살 입니까?</h3>")
					.append(ans[2])
					.append("<h3>가능한 요일은 언제인가요?</h3>")
					.append(ans[3])
					.append("<h3>언제 레슨을 받기를 원하시나요?</h3>")
					.append(ans[4])
					.append("<h3>희망 레슨 횟수는 어떻게 되시나요?</h3>")
					.append(ans[5])
					.append("<h3>몇 시간 동안 레슨을 받기 원하시나요?</h3>")
					.append(ans[6])
					.append("<h3>레슨을 시작하고 싶은 날이 있나요?</h3>")
					.append(ans[7])
					.append("<h3>레슨을 원하는 지역을 선택해주세요.</h3>")
					.append(ans[8])
					.append("<h3>고수가 알아야 할 다른 사항이 있나요?</h3>")
					.append(ans[9]+"<br><br>")
					.append("</form>")
					.append("</div>")
					.append("<a href='http://localhost:9090/go'>요청서 자세히 보기</a>")
				.append("</div>")
				.append("</div>")
				
				.append("</section>").toString());
			
			sendMail.setFrom("92eunbyul@naver.com", "금고");
			sendMail.setTo("92eunbyul@naver.com");
			sendMail.send();
			
		}

		
		//email을 찾아와서 요청서 정보들을 해당 아이디에게 email보내기

		ModelAndView mv = new ModelAndView(); 
		mv.addObject("n", n);
		mv.addObject("n1", n1);
		mv.setViewName("eunbyul/surveyOk");
		 return mv;
		
	}
}
