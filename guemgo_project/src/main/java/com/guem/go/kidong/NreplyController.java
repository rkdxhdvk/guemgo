package com.guem.go.kidong;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class NreplyController {
	@Autowired
	private NreplyService service1;

	@Autowired
	private NcommentService service;

	@RequestMapping(value = "/nreply/insert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(int cnum, String content, String email) {
		NreplyVo vo = new NreplyVo(0, cnum, email, content, null);
		int n = service1.insert(vo);

		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}

	@RequestMapping(value = "/nreply/delete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String delete1(int num) {
		int n = service.delete(num);
		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}

	@RequestMapping(value = "/ncomment/inser", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert1(int num, String content, String email) {
		NcommentVo vo = new NcommentVo(0, num, email, content, null);
		int n = service.insert(vo);

		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}

//		@RequestMapping(value = "/ncomment/list", produces = "application/json;charset=utf-8")
//		@ResponseBody
//		public String list(int num) {
//			List<CommentsVo> list = service.list(num);
//			JsonArray arr = new JsonArray();
//			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			for (CommentsVo vo : list) {
//				vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
//						.replaceAll("\n", "<br>"));
//				JsonObject json = new JsonObject(); 
//				json.addProperty("cnum", vo.getCnum());
//				json.addProperty("content", vo.getContent());
//				String regdate = transFormat.format(vo.getRegdate());
//				json.addProperty("regdate", regdate);
//				json.addProperty("email", vo.getEmail());
//				List<NreplyVo> list2 = service.replys(vo.getCnum());
//				for(NreplyVo vo2 : list2) {
//					JsonObject reply = new JsonObject();
//					reply.addProperty("email", vo2.getEmail());
//					reply.addProperty("content", vo2.getContent());
//					arr.add(reply);
//				}
//				arr.add(json);
//			}
//			return arr.toString();
//		}
	//
	@RequestMapping(value = "/ncomment/lis")
	@ResponseBody
	public HashMap<String, Object> list(int num) {
		HashMap<String, Object> map = new HashMap<>();
		List<CommentsVo> list = service.list(num);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (CommentsVo vo : list) {
			vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>"));
			map.put("cnum", vo.getCnum());
			map.put("content", vo.getContent());
			String regdate = transFormat.format(vo.getRegdate());
			map.put("regdate", regdate);
			map.put("email", vo.getEmail());
			List<NreplyVo> list2 = service.replys(vo.getCnum());
			map.put("reply", list2);
		}
		return map;
	}

	@RequestMapping(value = "/nreply/lis", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String listReply(int num) {
		JsonArray arr = new JsonArray();
		CommentsVo vo = service.getInfo(num);
		List<NreplyVo> list2 = service.replys(vo.getCnum());
		for (NreplyVo vo2 : list2) {
			JsonObject reply = new JsonObject();
			reply.addProperty("email", vo2.getEmail());
			reply.addProperty("content", vo2.getContent());
			arr.add(reply);
		}
		return arr.toString();
	}

	@RequestMapping(value = "/ncomment/delet", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String delete(int cnum) {
		int n = service.delete(cnum);
		JsonObject obj = new JsonObject();
		if (n > 0) {
			obj.addProperty("code", true);
		} else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}
}
