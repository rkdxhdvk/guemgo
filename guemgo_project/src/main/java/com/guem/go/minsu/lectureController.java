package com.guem.go.minsu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guem.go.eunbyul.ClassService;
import com.guem.go.eunbyul.LectureVo;
import com.guem.go.woohyun.GosuService;

@Controller
public class lectureController {
	@Autowired
	private GosuService goService;
	@Autowired
	private ClassService classService;
	
	@RequestMapping(value="/lectureName", method=RequestMethod.GET)
	public String lecturename(String email, Model model) {
		int gonum = goService.gosuNum(email);
		List<LectureVo> list = classService.classlist(gonum);
		model.addAttribute("list", list);
		return "minsu/select";
	}
}
