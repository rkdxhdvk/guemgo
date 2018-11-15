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
	public ModelAndView survey(HttpServletRequest request){//������ �ۼ� â���� �����ֱ�
		String area=request.getParameter("area");
		CatemVo vo=surveyservice.selectcatem(area);
		String mname=vo.getMname();
		List<CatesVo> list=surveyservice.selectcates(mname);
		System.out.println(area+mname);
		//���� ã�Ƽ� ���
		List<QuestionVo> quelist=surveyservice.quelist();
		//���� ã�Ƽ� ���
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
		
		String area=request.getParameter("selectarea");//�ϰ���� ����
		String[] ans= new String[10];//�亯���� ���� ��Ʈ���迭
		ans[0]=request.getParameter("purpose"); //����(���,�Խ�...)
		ans[1]=request.getParameter("experience"); //���(�Թ�,1��..)
		ans[2]=request.getParameter("age");//�л�����
		String[] days=request.getParameterValues("day"); //������ ����
		ans[3]="";//����
		ans[4]=request.getParameter("time"); //��ô�?
		ans[5]=request.getParameter("times"); //�ָ��?
		ans[6]=request.getParameter("hour"); //��ð�?
		ans[7]=request.getParameter("start"); //������
		String addr1=request.getParameter("addr1"); 
		String region[] = addr1.split(" ");
		ans[8]=region[0]+region[1]; //ex)���ֵ� ��������
		String addr2=request.getParameter("addr2"); 
		String region2=""; //�������ּ� 
		for(int i=2; i<region.length; i++){ 
			region2+=(region[i]+" ");
		}
		region2+=addr2;	
		ans[9]=request.getParameter("anything"); //�ϰ������
		for(int i=0; i<days.length; i++	) {
			ans[3]+=("/"+days[i]);
		}
		ans[3].substring(2,ans[3].length());
		
		String email=request.getParameter("email");//�α��� ����� email
		//��û�� �����
				CatemVo mvo=surveyservice.selectcatem(area);
				RequireVo vo=new RequireVo(0, email , mvo.mnum, 0 , null);
				int n=surveyservice.insert(vo);//require���̺� insert

		//�亯 ���̺� �� �ֱ�
			int n1=0;
			for(int i=2; i<12; i++) {
			AnswerVo vo2 = new AnswerVo(0, 0, i, ans[i-2]);
			n1=surveyservice.ansinsert(vo2);
			}
		
		//�亯�� gosu_area���̺��� �÷��̶� ���ؼ� ���� ���̺��� ���ǳѹ��� ���������ͼ� ���ϱ�
			/*List<E>surveyservice.anslist(email);*/
			
			List<GosuareaVo> arealist =surveyservice.gosuarealist();//arealist�� �޾ƿ�
			ArrayList<Integer> matchlec= new ArrayList<>();
			for(int i=0; i<arealist.size(); i++) {//���� ��û���� ���� area�� ���� �ѹ��� �޾ƿ�.
				System.out.println("�ٱ�"+arealist.get(i).getLectureNum());
				if(area.equals(arealist.get(i).getArea())) {
					matchlec.add(arealist.get(i).getLectureNum());
				}
				
			}
			
		//area�� ���� ���ǳѹ��� ã������ �������̺����� �ش� ���� �ѹ����� �ٸ� �������� ��������
			
			ArrayList<LectureVo> leclist= new ArrayList<>();
			for(int i=0; i<matchlec.size(); i++) {
				System.out.println("�̰ų�����???"+matchlec.get(i));
				LectureVo lvo = surveyservice.selectlec(matchlec.get(i));
				System.out.println("�̰ų�����"+lvo.getLectureName());
				leclist.add(lvo);
			}
			
		//�ش� ���� �ѹ����� �ٸ� �������� �����Դ�. ���� �ϳ��� ������ ���غ���
			ArrayList<LectureVo> matching=new ArrayList<>();
			
			
			////////1. day ���� �񱳴�. ans[3]
			String day[] =ans[3].split("/"); //������ �迭�� ���.
			int a=0;
			int b=0;
			boolean d=false;
		for (int i = 0; i < leclist.size(); i++) {
			System.out.println(leclist.get(i).getLectureName()); 
			System.out.println(leclist.get(i).getLectureNum());
			System.out.println(leclist.get(i).getGo_num());
			System.out.println("for������");
			String lecday = leclist.get(i).getDay();
			System.out.println("���ǿ���" + lecday);
			
			for (int j = 1; j < day.length; j++) {
				System.out.println("�л��� ������ ����:" + day[j]);
				if (lecday.contains(day[j])) {// ������ ���Ͽ� ��û�� ������ �ִ��� üũ�ϱ�
					System.out.println("a" + day[j] + "�������");
					a++;
				} else if (!lecday.contains(day[j])) {
					b++;
					System.out.println("b");
				}
			}
			
			if (a >= b) {// �´� ������ ���̻��̸� ���� ���� �˻�
				System.out.println("a>b");
				//////////// 2. time �ð��� ��
				System.out.println(ans[4]);
				System.out.println(leclist.get(i).getTime());
				if (ans[4].equals(leclist.get(i).getTime())) {// �ð��� �˻� ������ �������ǽ���
					System.out.println("�ð����Ī����");
					//////////// 3. region1 ������
					if (ans[8].equals(leclist.get(i).getRegion1())) {
						LectureVo lvo2 = leclist.get(i);
						matching.add(lvo2); // �´� ����� matching�� �ӽ÷� �����صα�
						break;
					}
				}
			}
		}
		//System.out.println(ans[1]+ans[2]+ans[3]+ans[4]+ans[5]);
		for (int i = 0; i < matching.size(); i++) {
			 //�������� ����ֳ� Ȯ���ϱ�
			System.out.println(matching.get(i).getLectureName() + matching.get(i).getGo_num());
			//matching�� �ִ� gosunum�� �����ͼ� email�� �̾Ƴ���
			int gosunum=matching.get(i).getGo_num();
			GosuVo gosu=surveyservice.selectgosu(gosunum);
			System.out.println("�������"+gosu.getEmail());
			/*
			try {
				sender.sendMail(title, content, "92eunbyul@naver.com", "92eunbyul@naver.com");
			}catch(Exception e) {
			System.out.println(e.getMessage());
			}*/
			
			SimpleMailSender sendMail = new SimpleMailSender(mailSender);
			sendMail.setSubject(area +" ���� ��û���� �����߽��ϴ�.");
			sendMail.setText(new StringBuffer().append("<link rel=\"stylesheet\" href=\"/go/resources/css/custom.css\">")
					.append("<section class='container'>")
					.append("<div class=\"modal-dialog\">")
					.append("<div class=\"modal-content\">")
					.append("<div class=\"modal-header\">")
					.append("<h5 class=\"modal-title\" id=\"modal\">���������� �ִ� �� �ֺ����� ���ο� ��û�� ���Ծ��.</h5>")
					.append("</div>")
					.append("<div class=\"modal-body\">")
					.append("<h2>��û�� ����</h2>")
					.append("<form>")
					.append("<div class=\"form-row\">")
					.append("<div class=\"form-group col-sm-12\">")
					.append("<h3>������ ���� �����Ű���?</h3>")
					.append(area)
					.append("</div>")
					.append("</div>")
					.append("<h3>������ �޴� ������ �����ΰ���?</h3>")
					.append(ans[0])
					.append("<h3>����� �ֳ���?</h3>")
					.append(ans[1])
					.append("<h3>�л��� �� �� �Դϱ�?</h3>")
					.append(ans[2])
					.append("<h3>������ ������ �����ΰ���?</h3>")
					.append(ans[3])
					.append("<h3>���� ������ �ޱ⸦ ���Ͻó���?</h3>")
					.append(ans[4])
					.append("<h3>��� ���� Ƚ���� ��� �ǽó���?</h3>")
					.append(ans[5])
					.append("<h3>�� �ð� ���� ������ �ޱ� ���Ͻó���?</h3>")
					.append(ans[6])
					.append("<h3>������ �����ϰ� ���� ���� �ֳ���?</h3>")
					.append(ans[7])
					.append("<h3>������ ���ϴ� ������ �������ּ���.</h3>")
					.append(ans[8])
					.append("<h3>����� �˾ƾ� �� �ٸ� ������ �ֳ���?</h3>")
					.append(ans[9]+"<br><br>")
					.append("</form>")
					.append("</div>")
					.append("<a href='http://localhost:9090/go'>��û�� �ڼ��� ����</a>")
				.append("</div>")
				.append("</div>")
				
				.append("</section>").toString());
			
			sendMail.setFrom("92eunbyul@naver.com", "�ݰ�");
			sendMail.setTo("92eunbyul@naver.com");
			sendMail.send();
			
		}

		
		//email�� ã�ƿͼ� ��û�� �������� �ش� ���̵𿡰� email������

		ModelAndView mv = new ModelAndView(); 
		mv.addObject("n", n);
		mv.addObject("n1", n1);
		mv.setViewName("eunbyul/surveyOk");
		 return mv;
		
	}
}
