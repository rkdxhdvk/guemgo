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
			// 1.users테이블의 총 갯수
			long user = statservice.countusers();
			// 2.gosu테이블의 총 갯수
			long gosu = statservice.countgosu();
			// 1-2의 수
			long other = user - gosu;
			mv.addObject("B", gosu);
			mv.addObject("C", other);
			mv.addObject("b", "고수이용자");
			mv.addObject("c", "일반이용자");
		} else {
			int aa = Integer.parseInt(sort.trim());
			if (aa == 1) {
				// 1.users테이블의 총 갯수
				long user = statservice.countusers();
				// 2.gosu테이블의 총 갯수
				long gosu = statservice.countgosu();
				// 1-2의 수
				long other = user - gosu;
/*				mv.addObject("A", user);*/
				mv.addObject("B", gosu);
				mv.addObject("C", other);
/*				mv.addObject("a", "총이용자수");*/
				mv.addObject("b", "고수이용자");
				mv.addObject("c", "일반이용자");
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
				// 총요청서 갯수
				long require = statservice.countrequ();
				// 매칭테이블 총갯수
				long match = statservice.countmatch();
				
				mv.addObject("A", require);
				mv.addObject("B", match);
				mv.addObject("a", "매칭 전 요청서");
				mv.addObject("b", "매칭완료");


			}
		}

		return mv;
	}
}
