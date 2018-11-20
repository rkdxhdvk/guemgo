package com.guem.go.eunbyul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StatisticsController {
	@RequestMapping(value="/Statistics",method=RequestMethod.GET)
	public String statistics() {
		return ".eunbyul.statistics";
	}
}
