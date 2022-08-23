package kr.co.handflea.review;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.handflea.util.dto.MemberDTO;
	
@Controller
@RequestMapping( value = "/review" )
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService service;

	@RequestMapping(value = "/mylist", method = RequestMethod.GET)
	public String mylist() {
		return "/review/review_mylist";
	}

	@RequestMapping( value = "/getList", method = RequestMethod.GET )
	public void getList(Model model, int startNum, PrintWriter out) throws Exception {
		List<ReviewDTO> list = null;
		list = service.getList(startNum);
		out.print( new Gson().toJson(list) );
		out.close();
	}
	
	@RequestMapping(value = "/write_form", method = RequestMethod.GET)
	public String write_form(String detail_no, Model model) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> : " + detail_no);
		model.addAttribute("detail_no", detail_no);
		return "/review/review_write";
	}
	
	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write( ReviewDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		String mem_email = ( (MemberDTO) session.getAttribute("login_info") ).getMem_email();
		File newFolder = new File("C:/upload/review/" + mem_email + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();

		MultipartFile review_photo = dto.getReview_photo();
		InputStream is = review_photo.getInputStream();
		FileOutputStream fos = new FileOutputStream( "C:/upload/review/" + mem_email + "/" + todayNalja + "_"
													+ todaySigan + "_" + review_photo.getOriginalFilename() );
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setReview_photoname(todayNalja + "_" + todaySigan + "_" + review_photo.getOriginalFilename());
		dto.setReview_photopath("/upload/review/" + mem_email + "/" + todayNalja + "_"
								+ todaySigan + "_" + review_photo.getOriginalFilename());
		
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		int successCount = 0;
		successCount = service.write(dto);
		out.print(successCount);
		out.close();
	}//write
	
}//class









