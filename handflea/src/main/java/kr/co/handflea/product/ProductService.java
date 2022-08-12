package kr.co.handflea.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.product.ProductDTO;


@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;
	
	public List<ProductDTO> list() {
		List<ProductDTO> list = null;
		list = dao.list();
		return list;
	}
	
	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.insert(dto);
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