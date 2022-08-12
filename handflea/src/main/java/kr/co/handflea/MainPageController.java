package kr.co.handflea;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainPageController {

	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);
	
	@RequestMapping( value = "/main", method = RequestMethod.GET )
	public String mainPage() {
		return "main";//jsp file name
	}//mainPage
	
}//class
