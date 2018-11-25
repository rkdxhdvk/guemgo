package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StatisticsController {
	@Autowired
	private StatisticsService statservice;

	@RequestMapping(value = "/Statistics", method = RequestMethod.GET)
	public ModelAndView statistics(String sort) {
		ModelAndView mv = new ModelAndView(".eunbyul.statistics");
		System.out.println(sort);
		if (sort == null) {
			// 1.users���̺��� �� ����
			long user = statservice.countusers();
			// 2.gosu���̺��� �� ����
			long gosu = statservice.countgosu();
			// 1-2�� ��
			long other = user - gosu;
			mv.addObject("B", gosu);
			mv.addObject("C", other);
			mv.addObject("b", "����̿���");
			mv.addObject("c", "�Ϲ��̿���");
		} else {
			int aa = Integer.parseInt(sort.trim());
			if (aa == 1) {
				// 1.users���̺��� �� ����
				long user = statservice.countusers();
				// 2.gosu���̺��� �� ����
				long gosu = statservice.countgosu();
				// 1-2�� ��
				long other = user - gosu;
/*				mv.addObject("A", user);*/
				mv.addObject("B", gosu);
				mv.addObject("C", other);
/*				mv.addObject("a", "���̿��ڼ�");*/
				mv.addObject("b", "����̿���");
				mv.addObject("c", "�Ϲ��̿���");
			}else if( aa== 2 ) {
				List<PayVo> list=statservice.payselect();
				int total=0;
				for(int i=0;i<list.size(); i++) {
					total=total+list.get(i).getPaymoney();
				}
				mv.addObject("list", list);
				mv.addObject("total", total);
				mv.setViewName(".eunbyul.sales");
				
			}else if (aa == 3) {
				// �ѿ�û�� ����
				long require = statservice.countrequ();
				// ��Ī���̺� �Ѱ���
				long match = statservice.countmatch();
				
				mv.addObject("A", require);
				mv.addObject("B", match);
				mv.addObject("a", "��Ī �� ��û��");
				mv.addObject("b", "��Ī�Ϸ�");


			}
		}

		return mv;
	}
}
