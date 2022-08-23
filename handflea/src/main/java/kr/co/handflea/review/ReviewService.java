package kr.co.handflea.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.order.OrderDTO;
 
@Service
public class ReviewService {

	@Autowired
    private ReviewDAO dao;
	
	public int write( ReviewDTO dto ) {
		int successCount = 0;
		successCount = dao.write(dto);
		return successCount;
	}//write
	
	SqlSession sql;
	
	public List<ReviewDTO> getReviewList(int start) throws Exception{
		int cnt=8;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("cnt", cnt);
		
		List<ReviewDTO> list = null;
		return list;
	}//list

	public List<ReviewDTO> getList(int startNum) {
		List<ReviewDTO> list = null;
		list = dao.getList(startNum);
		return list;
	}

	
}
