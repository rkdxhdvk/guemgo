package com.guem.go.woohyun;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-11-12	������ ���� ����
*/
@Controller
public class GosuProfileUpdateController {
	@Autowired private GosuService service;
	
	//request�� ���޵� �����͸� �Ķ���� ������ ������� �����
	//(String Ÿ���� DateŸ������ ��ȯ�ϱ�)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		CustomDateEditor dateEditor=
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"),true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	@RequestMapping(value="/GosuProfileUpdate",method=RequestMethod.GET)
	public ModelAndView updateForm(String email) {
		GosuVo vo=service.gosuDetail(email);
		ModelAndView mv=new ModelAndView(".gosuProfileC");
		mv.addObject("vo",vo);
//		System.out.println("������Ʈ��Ʈ�ѷ�GET �Ϸ�");
		return mv;
	}
	
	@RequestMapping(value="/GosuProfileUpdate",method=RequestMethod.POST)
	@Transactional
	public ModelAndView update(GosuVo vo, MultipartFile g_img, MultipartFile l_img, HttpSession session) {
		
		if (g_img != null) {
			
			String uploadPath=session.getServletContext().getRealPath("/resources/upload/gosuImg");
			String orgfilename = g_img.getOriginalFilename();
			String savefilename=UUID.randomUUID() + "_" + orgfilename;	
			
			
			try {
				// ���ε� ��� ������ ������ ����
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
		
		if (l_img != null) {
			
			String uploadPath=session.getServletContext().getRealPath("/resources/upload/gosuCareerImg");
			String orgfilename = l_img.getOriginalFilename();
			String savefilename=UUID.randomUUID() + "_" + orgfilename;	
			
			
			try {
				// ���ε� ��� ������ ������ ����
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
			
			vo.setLicense(savefilename);	//?
			
			
		}		
		int n=service.update_profile1(vo);	// gosu ���̺�  ������Ʈ
		int j=service.update_profile2(vo);	// gosu_career ���̺� ������Ʈ
		int i=service.update_profile3(vo);	// gosu_image ���̺� ������Ʈ
		
		
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0 && j>0 && i>0) {
			mv.addObject("code","gosuProfileUpdate_success");
//			System.out.println("������Ʈ��Ʈ�ѷ�POST-����");
		}else {
			mv.addObject("code","gosuProfileUpdateu_fail");
//			System.out.println("������Ʈ��Ʈ�ѷ�POST-����");
		}
//		System.out.println("������Ʈ��Ʈ�ѷ�POST-�Ϸ�");
		mv.addObject("goUrl","/");
		return mv;
	}
}











