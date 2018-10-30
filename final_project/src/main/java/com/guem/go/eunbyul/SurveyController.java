package com.guem.go.eunbyul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SurveyController {
		@RequestMapping(value = "/survey", method = RequestMethod.GET)
		public String home() {	
			return "eunbyul/survey";
		}
}
