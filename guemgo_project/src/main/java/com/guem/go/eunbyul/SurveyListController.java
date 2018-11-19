package com.guem.go.eunbyul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyListController {
	@Autowired
	private SurveyService surveyservice;
	@RequestMapping(value="/receiveList",method=RequestMethod.GET)
	public ModelAndView receiveList(String email) {
		ModelAndView mv=new ModelAndView(".eunbyul.receivelist");
		
	
		//�̸��Ϸ� ������û�����޾ƿ���
		List<RequirelistVo> list=surveyservice.requestlist(email);
		
		mv.addObject("email", email);
		mv.addObject("list", list);
		return mv;
		
	}
	@RequestMapping(value="/receivedetail",method=RequestMethod.GET)
	public ModelAndView receivedetail(int num, String email,String lecturename) {
		//���� ���� ���ǹ�ȣ
		
		ModelAndView mv=new ModelAndView(".eunbyul.receivedetail");
		//��û����ȣ�� �̸���ã�ƿ���
		RequireVo vo=surveyservice.requireselect(num);
		//���Ǹ����� ���ǹ�ȣã�ƿ���
		LectureVo vo2=surveyservice.lectureselect(lecturename);
		mv.addObject("lecturenum", vo2.getLectureNum());
		mv.addObject("other", vo.getEmail());
		mv.addObject("email", email);
		return mv;
	}
	@RequestMapping(value="/sendlist", method=RequestMethod.GET)
	public ModelAndView sendList(String email) {
		ModelAndView mv= new ModelAndView(".eunbyul.sendlist");
		//���� �̸��Ϸ� ��û�� ���̺��� ��û����ȣ �����ͼ� �亯���̺��� �亯�� ã�Ƽ� �����ֱ�
		List<RequireVo> list=surveyservice.requirelist(email);//�̸��Ϸ� ��û����������
/*		ArrayList<List<AnswerVo>> list3=new ArrayList<List<AnswerVo>>();
		for(int i=0; i<list.size(); i++) {
			List<AnswerVo> list2 =surveyservice.answer(list.get(i).getReq_num()); //��û���ѹ��� �����ͼ� �亯���� ������
			list3.add(list2);
		}*/
		mv.addObject("email", email);
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value="/senddetail",method=RequestMethod.GET)
	public ModelAndView sendDetail(int num) {
		List<QuestionVo> quelist=surveyservice.quelist();
		ModelAndView mv= new ModelAndView(".eunbyul.senddetail");
		List<AnswerVo> list=surveyservice.answer(num);
		mv.addObject("quelist", quelist);
		mv.addObject("list", list);
		return mv;
	}
}
