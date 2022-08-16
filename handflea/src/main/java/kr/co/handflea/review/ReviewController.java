package kr.co.handflea.review;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
	
@Controller
@RequestMapping( value = "/review" )
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService service;

	
	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String getList() {
		
		return "/review/review_list";
	}
	
	@RequestMapping(value = "/write_form", method = RequestMethod.GET)
	public String write_form() {
		return "/review/review_write";
	}
	
	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( ReviewDTO dto, HttpSession session, PrintWriter out ) {
		int successCount = 0;
		successCount = service.write(dto);
		out.print(successCount);
		out.close();
	}//write
	
}//class
