package com.guem.go.eunbyul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SurveyListController {

	@RequestMapping(value="/receiveList",method=RequestMethod.GET)
	public void receiveList(String email) {
		
		
	}
}
