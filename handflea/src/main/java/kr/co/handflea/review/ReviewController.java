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

import kr.co.handflea.util.dto.MemberDTO;
	
@Controller
@RequestMapping( value = "/review" )
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService service;

	
	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public void getList(Model model) {
	}
	
	@RequestMapping(value = "/write_form", method = RequestMethod.GET)
	public String write_form() {
		return "/review/review_write";
	}
	
	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( ReviewDTO dto, HttpSession session, PrintWriter out ) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		dto.setMem_no(mem_no);
		dto.setOrder_no("1");
		int successCount = 0;
		successCount = service.write(dto);
		out.print(successCount);
		out.close();
	}//write
	
}//class
