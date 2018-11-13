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
public class QboardController {
	@Autowired
	private QboardService qboardService;

	@RequestMapping("/qboard/list")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model, String sort, String field, String keyword) {

		Map<String, Object> map = new HashMap<>();
		map.put("sort", sort);
		map.put("keyword", keyword);
		map.put("field", field);
		
		int totalRowCount = qboardService.getCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 15, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<QboardVo> list = qboardService.list(map);
		
//		List<QboardVo> list = qboardService.select(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("sort", sort);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return "kidong/qboard";
	}

	@RequestMapping(value = "/qboard/insert", method = RequestMethod.POST)
	public String insert(QboardVo qboardVo) {
		try {
			int boardNum = qboardService.getMaxNum() + 1;
			int qna_num = 0;
			int grp = 0;
			int lev = 0;
			int step = 0;

			if (qboardVo.getQna_num() != 0) {
				qna_num = qboardVo.getQna_num();
				grp = qboardVo.getGrp();
				lev = qboardVo.getLev();
				step = qboardVo.getStep();
			}

			if (qna_num == 0) {
				grp = boardNum;
			} else {
				Map<String, Object> map = new HashMap<>();
				map.put("grp", grp);
				map.put("step", step);
				qboardService.insertReply(map);
				qboardService.addFlag(grp);
				lev += 1;
				step += 1;
			}
			QboardVo vo = new QboardVo(boardNum, qboardVo.getTitle(), qboardVo.getContent(), null, qboardVo.getEmail(),
					grp, lev, step,0 , qboardVo.getSort(),0);
			qboardService.insert(vo);
			return "redirect:/qboard/list";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	@RequestMapping(value="/qboard/detail",method=RequestMethod.GET)
	public String detail(int qna_num,Model model) {
		qboardService.addHit(qna_num);
		QboardVo vo = qboardService.detail(qna_num);
		model.addAttribute("vo", vo);
		return "kidong/qboard_detail";
	}
	
	@RequestMapping(value="/qboard/update",method=RequestMethod.POST)
	public String update(QboardVo vo) {
		try {
			qboardService.update(vo);
			return "redirect:/qboard/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	@RequestMapping(value="/qboard/delete",method=RequestMethod.GET)
	public String delete(int qna_num,int grp,int lev) {
		try {
			if(lev != 0) {
				qboardService.delete(qna_num);
			}else {
				qboardService.deleteGrp(grp);
			}
			return "redirect:/qboard/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	@RequestMapping(value = "/qboard/select", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String select(int grp) {
		List<QboardVo> list = qboardService.select(grp);
		JsonArray arr = new JsonArray();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		for (QboardVo vo : list) {
			vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
			JsonObject json = new JsonObject();
			json.addProperty("qna_num", vo.getQna_num());
			json.addProperty("title", vo.getTitle());
			json.addProperty("content", vo.getContent());
			String regdate = transFormat.format(vo.getRegdate());
			json.addProperty("regdate", regdate);
			json.addProperty("email", vo.getEmail());
			json.addProperty("grp", vo.getGrp());
			json.addProperty("lev", vo.getLev());
			json.addProperty("step", vo.getStep());
			json.addProperty("sort", vo.getSort());
			json.addProperty("hit", vo.getHit());
			arr.add(json);
		}
		return arr.toString();
	}
	
//	@RequestMapping(value = "/qboard/moreList", produces = "application/json;charset=utf-8")
//	@ResponseBody
//	public String select() {
//		
//		Map<String, Object> map = new HashMap<>();
//		
//		map.put("startRow", 20);
//		map.put("endRow", 40);
//		
//		List<QboardVo> list = qboardService.select(map);
//		JsonArray arr = new JsonArray();
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		for (QboardVo vo : list) {
//			vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
//					.replaceAll("\n", "<br>"));
//			JsonObject json = new JsonObject();
//			json.addProperty("qna_num", vo.getQna_num());
//			json.addProperty("title", vo.getTitle());
//			json.addProperty("content", vo.getContent());
//			String regdate = transFormat.format(vo.getRegdate());
//			json.addProperty("regdate", regdate);
//			json.addProperty("email", vo.getEmail());
//			json.addProperty("grp", vo.getGrp());
//			json.addProperty("lev", vo.getLev());
//			json.addProperty("step", vo.getStep());
//			json.addProperty("sort", vo.getSort());
//			json.addProperty("hit", vo.getHit());
//			arr.add(json);
//		}
//		return arr.toString();
//	}
	
}










