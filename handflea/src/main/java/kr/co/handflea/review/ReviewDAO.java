package kr.co.handflea.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int write( ReviewDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("ReviewMapper.write", dto);
		
		return successCount;
	}//write

	public List<ReviewDTO> list() {
		List<ReviewDTO> list = null;
		list = sqlSession.selectList("review_list");
		return list;
	}//list

	public List<ReviewDTO> getList(int startNum) {
		List<ReviewDTO> list = null;
		System.out.println(startNum);
		list = sqlSession.selectList("ReviewMapper.getList", startNum);
		System.out.println(list);
		return list;
	}
	
}
