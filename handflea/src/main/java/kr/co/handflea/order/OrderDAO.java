package kr.co.handflea.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProductDTO> buyOrderList(ProductDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("OrderMapper.buyOrderList", dto);
		
		return list;
	}

	public MemberDTO buyerInfo(String mem_no) {
		MemberDTO dto = new MemberDTO();
		dto = sqlSession.selectOne("OrderMapper.buyerInfo", mem_no);
		
		return dto;
	}
}
