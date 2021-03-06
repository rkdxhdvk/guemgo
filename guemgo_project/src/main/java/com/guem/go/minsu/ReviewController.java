package com.guem.go.minsu;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
import com.guem.go.woohyun.PointService;
import com.guem.go.woohyun.PointVo;
import com.guem.go.woohyun.UsersService;
import com.guem.go.woohyun.UsersVo;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reService;
	@Autowired
	private Re_commentService coService;
	@Autowired
	private UsersService uService;
	@Autowired
	private PointService pService;
	
	@RequestMapping(value="/reInsert", method=RequestMethod.GET)
	public String insert() {
		return ".reviewInsert";
	}
	
	@RequestMapping(value = "/reInsert", method = RequestMethod.POST)
	public String insert(HttpServletRequest req, MultipartFile img, HttpSession session) {
		String uploadPath=session.getServletContext().getRealPath("/resources/upload");
		String orgfilename = img.getOriginalFilename();
		System.out.println("daw" + orgfilename);
		String savefilename = "";
		if(orgfilename=="") {
			savefilename = "non";
		}else {
			savefilename = UUID.randomUUID() + "_" + orgfilename;	
		}
		System.out.println("ddd");
		
		try {
			InputStream is=img.getInputStream();
			FileOutputStream fos=new FileOutputStream(uploadPath +"\\" + savefilename);
			FileCopyUtils.copy(is,fos);
			is.close();
			fos.close();
			System.out.println(uploadPath +"경로에 파일업로드 성공!");
		String email = req.getParameter("email");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int flag = Integer.parseInt(req.getParameter("lectureNum"));
		int star = Integer.parseInt(req.getParameter("star"));
		String other = req.getParameter("other");
		ReviewVo vo = new ReviewVo(0, email, title, content, 0, flag, star, other, null, 0, savefilename);
		reService.insert(vo);
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", vo.getOther());
		map.put("point", vo.getStar()*10);
		uService.poitnUpdate(map);
		
		UsersVo uvo = uService.detail(other);
		PointVo pvo = new PointVo(0, other, null, 1, "후기 리뷰 포인트", 10*star, uvo.getPoint());
		pService.insert(pvo);
		
		
		System.out.println("ddd");
		return "redirect:/reList";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/reInsert";
		}
	}
	
	@RequestMapping("/reList")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String sort, String field,
			String keyword, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("sort", sort);

		int totalRowCount = reService.getCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<ReviewVo> list = reService.list(map);

		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return ".reviewList";
	}
	
	@RequestMapping(value="/reDetail")
	public String detail(int reviewNum, Model model) {
		reService.hit(reviewNum);
		ReviewVo vo = reService.detail(reviewNum);
		List<Re_commentVo> list = reService.commentList(reviewNum);
		for (Re_commentVo rvo : list) {
			rvo.setContent(rvo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
		}

		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return ".reviewDetail";
	}
	
	@RequestMapping(value = "/reDelete", method = RequestMethod.GET)
	public String delete(int reviewNum) {
		reService.delete(reviewNum);
		return "redirect:/reList";
	}

	@RequestMapping(value="/reUpdate", method=RequestMethod.POST)
	public String update(ReviewVo vo,Model model) {
		model.addAttribute("vo", vo);
		return ".reviewUpdate";
	}
	
	@RequestMapping(value="/reUpdateOk", method=RequestMethod.POST)
	public String updateOk(ReviewVo vo,Model model) {
		reService.update(vo);
		return "redirect:/reList";
	}
	
	@RequestMapping(value = "/commInsert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String comminsert(int reviewNum, String comment, String writer) {
		System.out.println("commInsert");
		Re_commentVo vo = new Re_commentVo(0, reviewNum, comment, writer, null);
		int n = coService.insert(vo);
		int comments = coService.getCount(reviewNum);
		Map<String, Object> map = new HashMap<>();
		map.put("reviewNum", reviewNum);
		map.put("comments", comments);
		reService.commentUp(map);

		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}
	
	@RequestMapping(value = "/commList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String commlist(int reviewNum) {
		List<Re_commentVo> list = coService.list(reviewNum);
		JsonArray arr = new JsonArray();
		for (Re_commentVo vo : list) {
			vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
			JsonObject json = new JsonObject();
			json.addProperty("writer", vo.getWriter());
			json.addProperty("commentNum", vo.getCommentNum());
			json.addProperty("content", vo.getContent());
			arr.add(json);
		}
		return arr.toString();
	}

	@RequestMapping(value = "/commDelete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String commdelete(int commentNum, int reviewNum) {
		int n = coService.delete(commentNum);
		int comments = coService.getCount(reviewNum);
		Map<String, Object> map = new HashMap<>();
		map.put("reviewNum", reviewNum);
		map.put("comments", comments);
		reService.commentUp(map);
		JsonObject obj = new JsonObject();
		if(n>0) {
			obj.addProperty("code", true);
		}else {
			obj.addProperty("code", false);
		}
		return "";
	}
	
	@RequestMapping(value = "/commUpdate", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String commupdate(int commentNum, int reviewNum) {
		return "";
	}
}
