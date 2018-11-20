package com.guem.go.eunbyul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ongoingController {
	@RequestMapping(value="/ongoingClass", method=RequestMethod.GET)
	public String ongoingClass(String email) {
		
		//1.이메일로 요청서테이블에서 req_start가 1이거나 2인 요청서를 찾아온다
		//2. 1번의 요청서번호를 가지고 받은요청내역 테이블에가서 이메일을 찾아온다.
		//3. 2번의 이메일을 가지고 고수테이블에서 고수번호를 찾아온다
		//4. 3번의 고수번호를 가지고 강의테이블에서 강의 명과 강의번호를 찾아온다
		//5. 4번의 강의 번호를 가지고 상세분야테이블에서 명칭을 가져온다.
		
		return "eunbyul/ongoingClass";
	}
}
