package kr.co.handflea.product;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.handflea.product.ProductDTO;


@Controller
@RequestMapping(value = "/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService service;
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST)
	public void insert(ProductDTO dto) {
		
	}
	
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
		System.out.println(jsonString);
		
		out.print(jsonString);
		out.close();
	}//bigcateSelect
	
}//class
