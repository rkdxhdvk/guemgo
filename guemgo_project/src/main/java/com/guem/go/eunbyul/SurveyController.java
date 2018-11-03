package com.guem.go.eunbyul;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SurveyController {
	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public String survey(HttpServletRequest request, Model model){
		String area=request.getParameter("area");
		System.out.println(area);
		//���⼭ area�� ī�װ�(��)���̺� ��Ī�� ���ؼ� �ش� ��Ī�� �߳ѹ��� ã�´�
		//�߳ѹ��� ã�Ƽ� ī�װ� ������ ����
		
		model.addAttribute("area", area);
        return "eunbyul/survey";
	}

	@RequestMapping(value = "/surveyOk", method = RequestMethod.POST)
	public String surveyOk() {
		return "eunbyul/surveyOk";
	}
}
