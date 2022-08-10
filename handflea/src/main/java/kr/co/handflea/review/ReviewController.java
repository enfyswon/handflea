package kr.co.handflea.review;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
	
@Controller
@RequestMapping( value = "/board/free" )
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService service;

	
	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( ReviewDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.write(dto);
		out.print(successCount);
		out.close();
	}//write
	
}//class
