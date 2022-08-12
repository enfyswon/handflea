package kr.co.handflea.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductDTO> list() {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.list");
		return list;
	}
	
	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.insert", dto);
		return successCount;
	}//insert

	public List<ProductDTO> smallcateSelect(String bigcate_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.smallcateSelect", bigcate_no);
		return list;
	}//smallcateSelect
	
	public List<ProductDTO> bigcateSelect() {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.bigcateSelect");
		return list;
	}//bigcateSelect

}//class