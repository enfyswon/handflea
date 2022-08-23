package kr.co.handflea.batch;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.order.OrderDTO;

@Repository
public class BatchDAO1 {
	
	@Autowired
	private SqlSession sqlSession;

	public List<OrderDTO> updatePrdtconlist() {
		List<OrderDTO> list = null;
		list = sqlSession.selectList("Batch1Mapper.updatePrdtconlist");
		
		return list;
	}

	public int updatePrdtcon(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.update("Batch1Mapper.updatePrdtcon", dto);
		
		return successCnt;
	}
	
	
}
