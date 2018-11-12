package com.guem.go.kidong;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
/*
 *  Ŀ���Һ丸���(����ڰ� ���� ����� ��)
 *  - AbstractiView ��ӹ޾� ����
 */
public class FiledownloadView extends AbstractView{
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//1. �ٿ�ε�â�� ������ ���� ����(���ϸ��� �ѱ��� ��� ������ �ʵ���)
		//�ٿ�ε�â���� �����ϱ����� ������Ÿ�Լ���
		super.setContentType("application/octet-stream");
		File f = (File)model.get("file");
		String filename = (String)model.get("filename");
		long filesize = (Long)model.get("filesize");
		response.setContentType(getContentType());
		response.setContentLength((int)filesize);
		//�ѱ��� �������ʵ��� ���ڵ��ϱ�
		filename = URLEncoder.encode(filename, "utf-8");
		//������ +���ڷ� ��ȯ�Ȱ��� �ٽ� ���鹮�ڷ� ��ȯ�ϱ�
		filename = filename.replaceAll("\\+", "%20");
		//�ٿ�ε�â�� ������ ���ϸ� ����
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
		
		//2. �ٿ�ε��ϱ�(���Ϻ���)
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis,os);
		os.close();
		fis.close();
	}
}

















