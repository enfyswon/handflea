package kr.co.handflea.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = SqlSession.insert("ProductMapper.insert", dto);
		return successCount;
	}
}//class
