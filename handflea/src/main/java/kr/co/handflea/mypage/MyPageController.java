package kr.co.handflea.mypage;

import java.io.File;
import java.io.FileNotFoundException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SellerDTO;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	MyPageService service;
	
	@RequestMapping( value = "/sellerjoin", method = RequestMethod.POST )
	public void sellerjoin(	SellerDTO dto , PrintWriter out, HttpSession session ) {
		
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		int successCount = 0;
		System.out.println(dto.toString());
		successCount = service.sellerjoin( dto );
		out.print(successCount);
		out.close();
	}//sellerjoin
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String seller_regist(PrintWriter out) {
		return "/mypage/seller_regist";
	}//seller_regist
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String myPage() {
		
		return "/mypage/mypage";
	}
	
	@RequestMapping(value = "/bank", method = RequestMethod.GET)
	public void bankSelect(PrintWriter out) {
		List<BankDTO> list = null;
		list = service.bankSelect();
		
		out.print( new Gson().toJson( list ) );
		out.close();		
	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myInfo(Model model, HttpSession session) {
		MemberDTO dto = null;
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		String seller_yn = ((MemberDTO)session.getAttribute("login_info")).getSeller_yn();
		
		if (seller_yn.equals("1")) {
			dto = service.sellerInfoSelect(mem_no);
		}else {
			dto = service.infoSelect(mem_no);
		}
		
		logger.info(dto.toString());
			
		model.addAttribute("myinfo", dto);
		
		return "/mypage/myinfo";
	}
	
	@RequestMapping(value = "/sellerinfo_update", method = RequestMethod.POST)
	
	public void sellerInfoUpdate( MemberDTO dto, HttpSession session, PrintWriter out) throws IOException {
		
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		
		int updateYn = 0;
		updateYn = service.sellerInfoUpdate(dto);
		out.print(updateYn);
		out.close();
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.POST)
	
	public void infoUpdate( MemberDTO dto, HttpSession session, PrintWriter out) throws IOException {
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMem_no();
		File newFolder = new File("C:/upload/user/" + mem_no + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		
		InputStream is = null;
		FileOutputStream fos = null;
		
		MultipartFile profile = dto.getProfile();
		if (profile != null && !profile.getOriginalFilename().equals("")) {
			
			is = profile.getInputStream();
			fos = new FileOutputStream("C:/upload/user/" + mem_no + "/" + todayNalja + "_" + todaySigan + "_" + profile.getOriginalFilename() );
			
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setMem_photo(todayNalja + "_" + todaySigan + "_" + profile.getOriginalFilename());
			dto.setMem_photopath("/upload/user/" + mem_no + "/" + todayNalja + "_" + todaySigan + "_" + profile.getOriginalFilename());
		}
		
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		
		int updateYn = 0;
		System.out.println(dto.toString());
		updateYn = service.infoUpdate(dto);
		out.print(updateYn);
		out.close();
	}
}
