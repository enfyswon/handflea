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
import kr.co.handflea.util.dto.MemberDTO;
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

		String mem_email = ( (MemberDTO) session.getAttribute("login_info") ).getMem_email();
		File newFolder = new File("C:/upload/product/" + mem_email + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();

		MultipartFile thumbnail = dto.getThumbnail();
		InputStream is = thumbnail.getInputStream();
		FileOutputStream fos = new FileOutputStream( "C:/upload/product/" + mem_email + "/" + todayNalja + "_"
													+ todaySigan + "_" + thumbnail.getOriginalFilename() );
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setThumbnail_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
		dto.setThumbnail_path("/upload/product/" + mem_email + "/" + todayNalja + "_"
								+ todaySigan + "_" + thumbnail.getOriginalFilename());

		MultipartFile prdt_img = dto.getPrdt_img();
		if(prdt_img != null && !prdt_img.getOriginalFilename().equals("")) {
			is = prdt_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/" + mem_email + "/" + todayNalja + "_"
										+ todaySigan + "_" + prdt_img.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setPrdt_img_name(todayNalja + "_" + todaySigan + "_" + prdt_img.getOriginalFilename());
			dto.setPrdt_img_path("/upload/product/" + mem_email + "/" + todayNalja + "_"
									+ todaySigan + "_" + prdt_img.getOriginalFilename());
		}

		MultipartFile desc_img = dto.getDesc_img();
		if(desc_img != null && !desc_img.getOriginalFilename().equals("")) {
			is = desc_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/" + mem_email + "/" + todayNalja + "_"
										+ todaySigan + "_" + desc_img.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setDesc_img_name(todayNalja + "_" + todaySigan + "_" + desc_img.getOriginalFilename());
			dto.setDesc_img_path("/upload/product/" + mem_email + "/" + todayNalja + "_"
									+ todaySigan + "_" + desc_img.getOriginalFilename());
		}

		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_email() );

		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form() {
		return "product/form";//jsp file name
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

/*
 create table product (
  prdt_no int not null auto_increment,
  prdt_name varchar(60) not null,
  mem_no int not null,
  price int not null,
  description varchar(1500) default null,
  view_cnt int default '0',
  reg_date datetime default null,
  del_yn int default '0',
  del_date datetime default null,
  thumbnail_name varchar(100) not null,
  thumbnail_path varchar(100) not null,
  prdt_img_name varchar(100) default null,
  prdt_img_path varchar(100) default null,
  desc_img_name varchar(100) default null,
  desc_img_path varchar(100) default null,
  primary key (prdt_no)
);
강사님꺼에서 뺸거 : 파일 업로드, 디스카운트, 재고
추가해야 할 것 : 옵션, 품절여부, 카테고리, 상품준비기간
*/
