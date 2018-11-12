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
public class QboardController {
	@Autowired
	private QboardService qboardService;

	@RequestMapping(value = "/qboard/list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		int totalRowCount = qboardService.getCount();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 15, 5);

		Map<String, Object> map = new HashMap<>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<QboardVo> list = qboardService.list(map);

		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return "kidong/qboard";
	}

	@RequestMapping(value = "/qboard/insert", method = RequestMethod.POST)
	public String insert(QboardVo qboardVo) {
		try {
			int boardNum = qboardService.getMaxNum() + 1;
			int num = 0;
			int grp = 0;
			int lev = 0;
			int step = 0;

			if (qboardVo.getNum() != 0) {
				num = qboardVo.getNum();
				grp = qboardVo.getGrp();
				lev = qboardVo.getLev();
				step = qboardVo.getStep();
			}

			if (num == 0) {
				grp = boardNum;
			} else {
				Map<String, Object> map = new HashMap<>();
				map.put("grp", grp);
				map.put("step", step);
				qboardService.insertReply(map);

				lev += 1;
				step += 1;
			}
			QboardVo vo = new QboardVo(boardNum, qboardVo.getTitle(), qboardVo.getContent(), null, qboardVo.getEmail(),
					grp, lev, step,0);
			qboardService.insert(vo);
			return "redirect:/qboard/list";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	@RequestMapping(value="/qboard/detail",method=RequestMethod.GET)
	public String detail(int num,Model model) {
		QboardVo vo = qboardService.detail(num);
		qboardService.addHit(num);
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
	public String delete(int num,int grp,int lev) {
		try {
			if(lev != 0) {
				qboardService.delete(num);
			}else {
				qboardService.deleteGrp(grp);
			}
			return "redirect:/qboard/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}










