package com.guem.go.kidong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class GboardController {
	@Autowired
	private GboardService service;

	@Autowired
	private GrecommService service2;

	@Autowired
	private GcommentService service3;

	@RequestMapping("/gboard/list")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String sort, String field,
			String keyword, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("sort", sort);

		int totalRowCount = service.getCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<GboardVo> list = service.list(map);

		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return "kidong/gboard";
	}

	@RequestMapping(value = "/gboard/insert", method = RequestMethod.GET)
	public String insert() {
		return "kidong/gboard_insert";
	}

	@RequestMapping(value = "/gboard/insert", method = RequestMethod.POST)
	public String insert(GboardVo vo) {
		service.insert(vo);
		return "redirect:/gboard/list";
	}

	@RequestMapping(value = "/gboard/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		int bnum = num;
		service.hitUp(num);
		GboardVo vo = service.detail(num);
		List<GcommentVo> list = service.commentList(num);
		for (GcommentVo vo2 : list) {
			vo2.setContent(vo2.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
		}
		GrecommVo vo1 = new GrecommVo(0, vo.getEmail(), bnum);

		if (service2.isRecomm(vo1) == null) {
			model.addAttribute("isRecomm", "false");
		} else {
			model.addAttribute("isRecomm", "true");
		}

		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "kidong/gboard_detail";
	}

	@RequestMapping(value = "/gboard/delete", method = RequestMethod.GET)
	public String delete(int num) {
		service.delete(num);
		return "redirect:/gboard/list";
	}

	@RequestMapping(value = "/commentInsert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(int num, String comment) {
		GcommentVo vo = new GcommentVo(0, comment, num, null);
		int n = service3.insert(vo);
		int comments = service3.getCount(num);
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("comments", comments);
		service.commentUp(map);

		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}

	@RequestMapping(value = "/comment", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String list(int num) {
		List<GcommentVo> list = service3.list(num);
		JsonArray arr = new JsonArray();
		for (GcommentVo vo : list) {
			vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
			JsonObject json = new JsonObject();
			json.addProperty("cnum", vo.getCnum());
			json.addProperty("content", vo.getContent());
			arr.add(json);
		}
		return arr.toString();
	}

	@RequestMapping(value = "/commentDelete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String delete(int cnum, int num) {
		int n = service3.delete(cnum);
		int comments = service3.getCount(num);
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("comments", comments);
		service.commentUp(map);
		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}

	@RequestMapping(value = "/recommUp", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert1(String email, int num, Model model) {
		int bnum = num;
		int n = 0;
		int recomm = 0;
		GrecommVo vo = new GrecommVo(0, email, bnum);
		if (service2.isRecomm(vo) == null) {
			n = service2.insert(vo);
			recomm = service2.getRecommCount(bnum);
			System.out.println(recomm);
			Map<String, Object> map = new HashMap<>();
			map.put("num", num);
			map.put("recomm", recomm);
			service.recommUp(map);
		}
		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
			obj.addProperty("recomm", recomm);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}

	@RequestMapping(value = "/recommDown", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(String email, int num, Model model) {
		int bnum = num;
		int n = 0;
		int recomm = 0;
		GrecommVo vo = new GrecommVo(0, email, bnum);
		if (service2.isRecomm(vo) != null) {
			service2.delete(vo);
			recomm = service2.getRecommCount(bnum);
			System.out.println(recomm);
			Map<String, Object> map = new HashMap<>();
			map.put("num", num);
			map.put("recomm", recomm);
			service.recommUp(map);
		}
		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
			obj.addProperty("recomm1", recomm);
		} else {
			obj.addProperty("code", false);
		}

		return obj.toString();
	}
}
