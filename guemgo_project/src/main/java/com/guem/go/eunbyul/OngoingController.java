package com.guem.go.eunbyul;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OngoingController {
	private OngoingService onservice;
	@RequestMapping(value="/ongoingClass", method=RequestMethod.GET)
	public String ongoingClass(String email) {
		System.out.println(email);
		ArrayList<Integer> list=null;//�������̰ų� �Ϸ�� ��û����ȣ ���� list
		//1.�̸��Ϸ� ��û�����̺�(require)���� req_start�� 1�̰ų� 2�� ��û���� ã�ƿ´�
		List<RequireVo> reqlist=onservice.select_ongoing(email);
		for(int i=0; i<reqlist.size(); i++) {
		list.add(reqlist.get(i).getReq_num());
		}
		//2. 1���� ��û����ȣ�� ������ ������û���� ���̺����� �̸����� ã�ƿ´�.
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
			//onservice.select_email(list.get(i));
		}
		
		
		
		
		
/*		//3. 2���� �̸����� ������ ������̺��� �����ȣ�� ã�ƿ´�
		select gosu_num from gosu where email=#{email}
		
		select * from lecture where go_num=
		(select go_num from gosu where email=(select email from requirelist where req_num=170))
		
		//4. 3���� �����ȣ�� ������ �������̺��� ���� ��� ���ǹ�ȣ�� ã�ƿ´�
		select * from lecture where gosu_num=#{gosu_num}
		
		//5. 4���� ���� ��ȣ�� ������ �󼼺о����̺��� ��Ī�� �����´�.--�̰� �ʿ���� �� �� �ְڴ°�?
		select * from gosu_area where lec_num=#{lec_num}
		
		
		select * from gosu_area a,
		(select * from lecture where gosu_num=
		(select gosu_num from gosu where email=(select email from requirelist where req_num=#{req_num}))) b
		where lec_num=b.lec_num;
		
		�������� ���� ���������� �ʿ��� ����:
		���Ǹ�, ���ǹ�ȣ, ���ǽ�����, ����̸���, ���������, �����Ȳ
		*/
		return "eunbyul/ongoingClass";
	}
}
