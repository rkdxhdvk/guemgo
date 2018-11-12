package com.guem.go.eunbyul;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.woohyun.GosuVo;



@Controller
public class SurveyController {
	@Autowired private SimpleMailSender sender;
	@Autowired
	private SurveyService surveyservice;
	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public String survey(HttpServletRequest request, Model model){
		String area=request.getParameter("area");
		CatemVo vo=surveyservice.selectcatem(area);
		String mname=vo.getM_name();
		List<CatesVo> list=surveyservice.selectcates(mname);
		System.out.println(area+mname);
		//질문 찾아서 담기
		List<QuestionVo> quelist=surveyservice.quelist();
		//보기 찾아서 담기
		List<ExampleVo> exlist=surveyservice.exlist();
		String email=(String)request.getSession().getAttribute("email");
		if(email == null || email == "") {
			return "login";
		}
		model.addAttribute("list", list);
		model.addAttribute("quelist", quelist);
		model.addAttribute("exlist", exlist);
		model.addAttribute("area", area);
	
        return "eunbyul/survey";
	}

	@RequestMapping(value = "/survey", method = RequestMethod.POST)
	public ModelAndView surveyOk(HttpServletRequest request) {
		
		
		String area=request.getParameter("selectarea");//하고싶은 과목
		String[] ans= new String[10];
		ans[0]=request.getParameter("purpose"); //목적(취미,입시...)
		ans[1]=request.getParameter("experience"); //경력(입문,1년..)
		ans[2]=request.getParameter("age"); 
		//int age=Integer.parseInt(age1); //학생나이
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
				RequireVo vo=new RequireVo(0, email , mvo.m_num, 0 , null);
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
				if(area.equals(arealist.get(i).getArea())) {
					matchlec.add(arealist.get(i).getLectureNum());
				}
			}
			
		//area가 같은 강의넘버를 찾았으니 강의테이블에가서 해당 강의 넘버들의 다른 정보들을 가져오자
			
			ArrayList<LectureVo> leclist= new ArrayList<>();
			for(int i=0; i<matchlec.size(); i++) {
				LectureVo lvo = surveyservice.selectlec(matchlec.get(i));
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
		
		for (int i = 0; i < matching.size(); i++) {
			 //누가누가 담겨있나 확인하기
			System.out.println(matching.get(i).getLectureName() + matching.get(i).getGo_num());
			//matching에 있는 gosunum을 가져와서 email을 뽑아내기
			int gosunum=matching.get(i).getGo_num();
			GosuVo gosu=surveyservice.selectgosu(gosunum);
			String title=area +" 레슨 요청서가 도착했습니다.";
			System.out.println(gosu.getEmail());
			try {
				sender.sendMail(title, "안\n녕2", "92eunbyul@naver.com", "92eunbyul@naver.com");
	
			}catch(Exception e) {
			System.out.println(e.getMessage());
			}
		}
			
			
		
		
		
		
		
		//email을 찾아와서 요청서 정보들을 해당 아이디에게 email보내기
			

		
		ModelAndView mv = new ModelAndView(); 
		mv.addObject("n", n);
		mv.addObject("n1", n1);
		mv.setViewName("eunbyul/surveyOk");
		 return mv;
		
	}
}
