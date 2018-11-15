package com.guem.go.kidong;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		return ".kidong.gboard";
	}

	@RequestMapping(value = "/gboard/insert", method = RequestMethod.POST)
	public String insert(GboardVo vo, MultipartFile file1, HttpSession session) {
		String uploadpath = session.getServletContext().getRealPath("/resources/upload");
		String orgfilename = file1.getOriginalFilename();
		String savefilename = UUID.randomUUID() + "_" + orgfilename;

		try {
			if (orgfilename != null && orgfilename != "") {
				InputStream is = file1.getInputStream();
				FileOutputStream fos = new FileOutputStream(uploadpath + "\\" + savefilename);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				System.out.println(uploadpath + "경로에 파일업로드 성공!");
				long filesize = file1.getSize();
				GboardVo gboardVo = new GboardVo(0, vo.getEmail(), vo.getTitle(), vo.getContent(), 0, 0, 0, null,
						orgfilename, savefilename, filesize);
				service.insert(gboardVo);
			} else {
				orgfilename = "";
				savefilename = "";
				GboardVo gboardVo = new GboardVo(0, vo.getEmail(), vo.getTitle(), vo.getContent(), 0, 0, 0, null,
						orgfilename, savefilename, 0);
				service.insert(gboardVo);
			}
			return "redirect:/gboard/list";
		} catch (Exception ie) {
			System.out.println(ie.getMessage());
			return "error";
		}
	}

	@RequestMapping(value = "/gboard/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		int bnum = num;
		service.hitUp(num);
		GboardVo vo = service.detail(num);
		GboardVo prev = service.prev(num);
		GboardVo next = service.next(num);

		String retFormat = "0";
		long filesize = vo.getFilesize();

		String[] s = { "bytes", "KB", "MB", "GB", "TB", "PB" };

		if (filesize != 0) {
			int idx = (int) Math.floor(Math.log(filesize) / Math.log(1024));
			DecimalFormat df = new DecimalFormat("#,###.##");
			double ret = ((filesize / Math.pow(1024, Math.floor(idx))));
			retFormat = df.format(ret) + " " + s[idx];
		} else {
			retFormat += " " + s[0];
		}

		List<GcommentVo> list = service3.list(num);
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
		model.addAttribute("retFormat", retFormat);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		return ".kidong.gboard_detail";
	}

	@RequestMapping(value = "/gboard/delete", method = RequestMethod.GET)
	public String delete(int num) {
		service.delete(num);
		return "redirect:/gboard/list";
	}

	@RequestMapping(value = "/gboard/update", method = RequestMethod.POST)
	public String update(GboardVo vo, HttpSession session, MultipartFile file1) {
		try {
			if (!file1.isEmpty()) {
				String path = session.getServletContext().getRealPath("/resources/upload");
				String fname = service.detail(vo.getNum()).getSavefilename();
				File f = new File(path + "/" + fname);
				f.delete();
				String orgfilename = file1.getOriginalFilename();
				String savefilename = UUID.randomUUID() + "_" + orgfilename;
				InputStream is = file1.getInputStream();
				FileOutputStream fos = new FileOutputStream(path + "/" + savefilename);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				long filesize = file1.getSize();
				vo.setOrgfilename(orgfilename);
				vo.setSavefilename(savefilename);
				vo.setFilesize(filesize);
			} else {
				if (service.detail(vo.getNum()).getOrgfilename() == null) {
					vo.setOrgfilename("");
					vo.setSavefilename("");
				} else {
					vo.setOrgfilename(service.detail(vo.getNum()).getOrgfilename());
					vo.setSavefilename(service.detail(vo.getNum()).getSavefilename());
				}
				vo.setFilesize(service.detail(vo.getNum()).getFilesize());
			}
			service.update(vo);

			return "redirect:/gboard/list";

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value = "/commentInsert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(int num, String comment, String email) {
		GcommentVo vo = new GcommentVo(0, comment, num, null, email);
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
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (GcommentVo vo : list) {
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
