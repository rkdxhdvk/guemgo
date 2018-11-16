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
		return "/kidong/nboard";
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
	public String detail(int num, Model model,@RequestParam(value = "sort", defaultValue = "0") int sort) {
		if(sort != 1) {
			service.hitUp(num);
		}
		NboardVo vo = service.detail(num);
		NboardVo prev = service.prev(num);
		NboardVo next = service.next(num);

		List<CommentsVo> list = service2.list(num);
		for (CommentsVo vo2 : list) {
			vo2.setContent(vo2.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
		}

		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		return "/kidong/nboard_detail";
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
}
