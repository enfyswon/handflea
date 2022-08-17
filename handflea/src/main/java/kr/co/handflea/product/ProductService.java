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
	
	public List<ProductDTO> searchList( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = dao.searchList( dto );
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
