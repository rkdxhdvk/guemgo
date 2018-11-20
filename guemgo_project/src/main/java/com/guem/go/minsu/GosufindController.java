package com.guem.go.minsu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guem.go.eunbyul.CateService;
import com.guem.go.eunbyul.CatelVo;
import com.guem.go.eunbyul.CatemVo;
import com.guem.go.eunbyul.CatesVo;

@Controller
public class GosufindController {
	@Autowired
	private CateService cService;
	/*@RequestMapping(value="/findgosu", method=RequestMethod.GET)
	public String select() {
		return ".minsu.findgosu";
	}
	*/
	@RequestMapping(value="/findgosu", method=RequestMethod.GET)
	public String select(Model model) {
		List<CatelVo> catelList = cService.catellist();
		model.addAttribute("catelList", catelList);
		return "minsu/findgosu";
	}
	
	@RequestMapping(value="/large", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String insert(int lnum, Model model) {
		List<CatemVo> catemList = cService.medium(lnum);
		int len = catemList.size();
		model.addAttribute("len", len);
		org.json.JSONArray arr = new org.json.JSONArray();
		for(CatemVo vo: catemList) {
			org.json.JSONObject json=new org.json.JSONObject();
			json.put("mnum",vo.mnum);
			json.put("mname",vo.mname);
			arr.put(json);
		}
		return arr.toString();
	}
	
	@RequestMapping(value="/medium", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String medium(int mnum, Model model) {
		List<CatesVo> catesList = cService.small(mnum);
		int len = catesList.size();
		model.addAttribute("len", len);
		org.json.JSONArray arr = new org.json.JSONArray();
		for(CatesVo vo: catesList) {
			org.json.JSONObject json=new org.json.JSONObject();
			json.put("snum",vo.snum);
			json.put("sname",vo.sname);
			arr.put(json);
		}
		return arr.toString();
	}
}
