package com.guem.go.minsu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalendarController {
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String home() {	
		return "minsu/calendar";
	}
	
}
