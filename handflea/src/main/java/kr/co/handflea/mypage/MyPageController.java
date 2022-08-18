package kr.co.handflea.mypage;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	MyPageService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String myPage() {
		
		return "/mypage/mypage";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String seller_regist(PrintWriter out) {
		
		return "/mypage/seller_regist";
	}
	
	@RequestMapping(value = "/bank", method = RequestMethod.GET)
	public void bankSelect(PrintWriter out) {
		List<BankDTO> list = null;
		list = service.bankSelect();
		
		out.print( new Gson().toJson( list ) );
		out.close();		
	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myInfo() {
		return "/mypage/myinfo";
	}
}
