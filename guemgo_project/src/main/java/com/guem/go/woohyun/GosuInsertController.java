package com.guem.go.woohyun;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/*
---------------------------------------------
	2018-11-02	윤우현 파일 생성
---------------------------------------------
*/
@Controller
public class GosuInsertController {
	@Autowired private GosuService gosuService;
	
	@RequestMapping(value="/GosuInsertForm",method=RequestMethod.GET)
	public String insert() {
		return ".gosuInsertForm";
	}
	
	@RequestMapping(value="/GosuInsert",method=RequestMethod.POST)
	public ModelAndView insert(GosuVo vo, MultipartFile g_img, MultipartFile l_img, HttpSession session, HttpServletRequest request) {
		
		if (g_img != null) {
			
			String uploadPath=session.getServletContext().getRealPath("/resources/upload/gosuImg");
			String orgfilename = g_img.getOriginalFilename();
			String savefilename=UUID.randomUUID() + "_" + orgfilename;	
			
			
			try {
				// 업로드 대상 폴더가 없으면 생성
				if (!new File(uploadPath).exists()) {
					FileUtils.forceMkdir(new File(uploadPath));
				}
				
				InputStream is=g_img.getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath +"\\" + savefilename);
				FileCopyUtils.copy(is,fos);
				is.close();
				fos.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			vo.setG_image(savefilename);	//?

		}

		if (l_img != null) {	// 자격증 이미지 추가
			
			String uploadPath=session.getServletContext().getRealPath("/resources/upload/gosuCareerImg");
			String orgfilename = l_img.getOriginalFilename();
			String savefilename=UUID.randomUUID() + "_" + orgfilename;	
			
			
			try {
				// 업로드 대상 폴더가 없으면 생성
				if (!new File(uploadPath).exists()) {
					FileUtils.forceMkdir(new File(uploadPath));
				}
				
				InputStream is=l_img.getInputStream();
				FileOutputStream fos=new FileOutputStream(uploadPath +"\\" + savefilename);
				FileCopyUtils.copy(is,fos);
				is.close();
				fos.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			vo.setLicense(savefilename);
		
		}
			
//		HttpSession session=request.getSession();
		vo.setEmail((String)session.getAttribute("email"));
		vo.setGrade("초수");
		vo.setEmploy(0);
		int n=gosuService.insert(vo);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			session.setAttribute("gosuYN", vo.getEmail());	// 고수 등록하면서 바로 세션에 고수로 등록 함
			session.setAttribute("flag", 2);	// 고수 등록하면서 바로 세션에 flag 2:고수 등록 함
			mv.addObject("code","success");
		}else {
			mv.addObject("code","fail");
		}
		return mv;
	}
}

