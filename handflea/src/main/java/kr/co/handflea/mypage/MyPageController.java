package kr.co.handflea.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String myPage() {
		
		return "/mypage/mypage";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String seller_regist() {
		return "/mypage/seller_regist";
	}
}
