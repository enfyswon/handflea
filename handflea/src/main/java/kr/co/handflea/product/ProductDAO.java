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
	
	public int option_update(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.option_update", dto);
		return successCount;
	}//option_insert
	
	public int update(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.update", dto);
		return successCount;
	}
	
	public int fileDelete(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.fileDelete", dto);
		return successCount;
	}//fileDelete
	
	public int delete(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.delete", dto);
		return successCount;
	}//delete
	
	public ProductDTO sellerdetail(String prdt_no) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("ProductMapper.sellerdetail", prdt_no);
		return dto;
	}//sellerdetail
	
	public List<ProductDTO> sellerlist(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.sellerlist", dto);
		return list;
	}
	
	public List<ProductDTO> option_contents(String prdt_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.option_contents", prdt_no);
		return list;
	}//option_contents
	
	public ProductDTO detail( String prdt_no ) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("ProductMapper.detail", prdt_no);
		return dto;
	}//detail
	
	public List<ProductDTO> smallcatelist(String smallcate_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.smallcatelist", smallcate_no);
		return list;
	}//smallcatelist
	
	public List<ProductDTO> bigcatelist(String bigcate_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.bigcatelist", bigcate_no);
		return list;
	}//bigcatelist
	
	public void incrementViewCnt( String prdt_no ) {
		sqlSession.update("ProductMapper.incrementViewCnt", prdt_no);
	}//incrementViewCnt

	public List<ProductDTO> main( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.main", dto);
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
