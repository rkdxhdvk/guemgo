package com.guem.go.eunbyul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ongoingController {
	@RequestMapping(value="/ongoingClass", method=RequestMethod.GET)
	public String ongoingClass(String email) {
		
		//1.�̸��Ϸ� ��û�����̺��� req_start�� 1�̰ų� 2�� ��û���� ã�ƿ´�
		//2. 1���� ��û����ȣ�� ������ ������û���� ���̺����� �̸����� ã�ƿ´�.
		//3. 2���� �̸����� ������ ������̺��� �����ȣ�� ã�ƿ´�
		//4. 3���� �����ȣ�� ������ �������̺��� ���� ��� ���ǹ�ȣ�� ã�ƿ´�
		//5. 4���� ���� ��ȣ�� ������ �󼼺о����̺��� ��Ī�� �����´�.
		
		return "eunbyul/ongoingClass";
	}
}
