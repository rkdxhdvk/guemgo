package com.guem.go.kidong;

import java.text.SimpleDateFormat;
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
public class NboardController {
	@Autowired
	private NboardService service;

	@Autowired
	private NcommentService service2;

	@RequestMapping("/nboard/list")
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
		List<NboardVo> list = service.list(map);
		for (NboardVo vo : list) {
			vo.setComments(service2.getCount(vo.getNum()));
		}

		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return "kidong/nboard";
	}

	@RequestMapping(value = "/nboard/insert", method = RequestMethod.POST)
	public String insert(NboardVo vo) {
		try {
			service.insert(vo);
			return "redirect:/nboard/list";
		} catch (Exception ie) {
			System.out.println(ie.getMessage());
			return "error";
		}
	}

	@RequestMapping(value = "/nboard/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		service.hitUp(num);
		NboardVo vo = service.detail(num);
		NboardVo prev = service.prev(num);
		NboardVo next = service.next(num);

		List<NcommentVo> list = service2.list(num);
		for (NcommentVo vo2 : list) {
			vo2.setContent(vo2.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
		}

		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		return "kidong/nboard_detail";
	}

	@RequestMapping(value = "/nboard/delete", method = RequestMethod.GET)
	public String delete(int num) {
		try {
			service.delete(num);
			return "redirect:/nboard/list";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value = "/nboard/update", method = RequestMethod.POST)
	public String update(NboardVo vo) {
		try {
			service.update(vo);
			return "redirect:/nboard/list";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value = "/ncomment/insert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(int num, String content, String email) {
		NcommentVo vo = new NcommentVo(1, num, email, content, null, 0, 0, 0);
		int n = service2.insert(vo);

		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}

	@RequestMapping(value = "/ncomment/reply", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(NcommentVo vo) {
		JsonObject obj = new JsonObject();
		try {
			int boardNum = service2.getMaxNum(vo.getNum()) + 1;
			int cnum = 0;
			int ref = 0;
			int lev = 0;
			int step = 0;

			if (vo.getCnum() != 0) {
				cnum = vo.getCnum();
				ref = vo.getRef();
				lev = vo.getLev();
				step = vo.getStep();
			}

			if (cnum == 0) {
				ref = boardNum;
			} else {
				Map<String, Object> map = new HashMap<>();
				map.put("ref", ref);
				map.put("step", step);
				service2.insertReply(map);
				lev += 1;
				step += 1;
			}
			NcommentVo vo1 = new NcommentVo(boardNum, vo.getNum(), vo.getEmail(), vo.getContent(), null, ref, lev,
					step);
			service2.insert(vo1);
			obj.addProperty("code", true);
			return obj.toString();
		} catch (Exception e) {
			obj.addProperty("code", false);
			return obj.toString();
		}
	}

	@RequestMapping(value = "/ncomment/list", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String list(int num) {
		List<NcommentVo> list = service2.list(num);
		JsonArray arr = new JsonArray();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (NcommentVo vo : list) {
			vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
			JsonObject json = new JsonObject();
			json.addProperty("cnum", vo.getCnum());
			json.addProperty("content", vo.getContent());
			String regdate = transFormat.format(vo.getRegdate());
			json.addProperty("regdate", regdate);
			json.addProperty("email", vo.getEmail());
			arr.add(json);
		}
		return arr.toString();
	}

	@RequestMapping(value = "/ncomment/delete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String delete(int cnum, int num) {
		int n = service2.delete(cnum);
		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}
}
