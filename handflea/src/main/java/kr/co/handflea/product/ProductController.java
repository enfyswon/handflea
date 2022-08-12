package kr.co.handflea.product;

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

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.SearchDTO;


@Controller
@RequestMapping(value = "/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService service;
	
	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String list( Model model, String userWantPage, SearchDTO dto ) {
	
		List<ProductDTO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	return "/product/list";//jsp file name
}//list
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST)
	public void insert(ProductDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		String mid = "hw";
		File newFolder = new File("C:/upload/product/" + mid + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		
		MultipartFile product_photo = dto.getProduct_photo();
		InputStream is = product_photo.getInputStream();
		FileOutputStream fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
													+ todaySigan + "_" + product_photo.getOriginalFilename() );
		
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setPhoto_name(todayNalja + "_" + todaySigan + "_" + product_photo.getOriginalFilename());
		dto.setPhoto_path("/upload/product/" + mid + "/" + todayNalja + "_"
								+ todaySigan + "_" + product_photo.getOriginalFilename());
			
		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );//로그인 구현 안됨 아직
		
		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form() {
		return "product2/form";//jsp file name
	}//form
	
	@RequestMapping( value = "/smallcate", method = RequestMethod.GET )
	public void smallcateSelect( String bigcate_no, PrintWriter out ) {
		List<ProductDTO> list = null;
		list = service.smallcateSelect( bigcate_no );

		out.print( new Gson().toJson( list ) );
		out.close();
	}//smallcateSelect
	
	@RequestMapping( value = "/bigcate", method = RequestMethod.GET )
	public void bigcateSelect( PrintWriter out ) {
		List<ProductDTO> list = null;
		list = service.bigcateSelect();

		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		
		out.print(jsonString);
		out.close();
	}//bigcateSelect
	
}//class
