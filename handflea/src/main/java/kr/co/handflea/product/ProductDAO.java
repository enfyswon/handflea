package kr.co.handflea.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.SearchDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ProductDTO detail( String prdt_no ) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("ProductMapper.detail", prdt_no);
		return dto;
	}//detail
	
	public List<ProductDTO> main() {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.main");
		return list;
	}
	
	public void incrementViewCnt( String prdt_no ) {
		sqlSession.update("ProductMapper.incrementViewCnt", prdt_no);
	}//incrementViewCnt

	public List<ProductDTO> searchList( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("ProductMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	public int option_insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.option_insert", dto);
		return successCount;
	}//option_insert
	
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
