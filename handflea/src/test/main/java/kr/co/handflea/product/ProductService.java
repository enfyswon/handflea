package kr.co.handflea.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.SearchDTO;


@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;
	
	public List<ProductDTO> option_contents(String prdt_no) {
		List<ProductDTO> list = null;
		list = dao.option_contents(prdt_no);
		return list;
	}//option_contents
	
	public ProductDTO detail( String prdt_no ) {
		dao.incrementViewCnt( prdt_no );

		ProductDTO dto = null;
		dto = dao.detail( prdt_no );
		return dto;
	}//detail
	
	public List<ProductDTO> smallcatelist(String smallcate_no) {
		List<ProductDTO> list = null;
		list = dao.smallcatelist( smallcate_no );
		return list;
	}//smallcatelist
	
	public List<ProductDTO> bigcatelist(String bigcate_no) {
		List<ProductDTO> list = null;
		list = dao.bigcatelist( bigcate_no );
		return list;
	}//bigcatelist
	
	public List<ProductDTO> main( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = dao.main( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
	public int option_insert(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.option_insert(dto);
		return successCount;
	}//option_insert
	
	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.insert(dto);
		if(successCount < 1) return successCount;
		if (dto.getArr_option() != null && dto.getArr_option().length > 0) {
			successCount = dao.option_insert(dto);
		}
		return successCount;
	}//insert

	public List<ProductDTO> smallcateSelect(String bigcate_no) {
		List<ProductDTO> list = null;
		list = dao.smallcateSelect( bigcate_no );
		return list;
	}//smallcateSelect
	
	public List<ProductDTO> bigcateSelect() {
		List<ProductDTO> list = null;
		list = dao.bigcateSelect();
		return list;
	}//bigcateSelect

}//class
