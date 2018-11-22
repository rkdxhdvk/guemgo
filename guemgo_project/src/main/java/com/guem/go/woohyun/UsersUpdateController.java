package com.guem.go.woohyun;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
//import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.minsu.ReviewVo;
/*
	2018-10-29	윤우현 파일 생성
*/
@Controller
public class UsersUpdateController {
	@Autowired private UsersService service;
	
	//request로 전달된 데이터를 파라미터 변수에 담기전에 수행됨
	//(String 타입을 Date타입으로 변환하기)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		CustomDateEditor dateEditor=
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"),true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	public void setService(UsersService service) {
		this.service = service;
	}
	@RequestMapping(value="/UserUpdate",method=RequestMethod.GET)
	public ModelAndView updateForm(String email) {
		UsersVo vo=service.detail(email);
		ModelAndView mv=new ModelAndView(".userUpdate");
		mv.addObject("vo",vo);
//		System.out.println("업데이트콘트롤러GET 완료");
		return mv;
	}
	@RequestMapping(value="/UserUpdate",method=RequestMethod.POST)
	public ModelAndView update(UsersVo vo, MultipartFile img, HttpSession session) {
		
		if (img != null) {
			
			String uploadPath=session.getServletContext().getRealPath("/resources/upload/userImg");
			String orgfilename = img.getOriginalFilename();
			String savefilename=UUID.randomUUID() + "_" + orgfilename;	
			
			
			try {
				// 업로드 대상 폴더가 없으면 생성
				if (!new File(uploadPath).exists()) {
					FileUtils.forceMkdir(new File(uploadPath));
				}
				
				InputStream is=img.getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath +"\\" + savefilename);
				FileCopyUtils.copy(is,fos);
				is.close();
				fos.close();
				System.out.println(uploadPath);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			vo.setImage(savefilename);
		}
		
		int n=service.update(vo);
		
		//System.out.println(vo.getMnum);

		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","success");
//			System.out.println("업데이트콘트롤러POST-성공");
		}else {
			mv.addObject("code","fail");
//			System.out.println("업데이트콘트롤러POST-실패");
		}
//		System.out.println("업데이트콘트롤러POST-완료");
		
		return mv;
	}
}











