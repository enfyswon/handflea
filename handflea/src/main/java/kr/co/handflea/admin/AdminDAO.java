package kr.co.handflea.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.QnA.QnADTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SearchDTO;

@Repository
public class AdminDAO {
   
	@Autowired
	private SqlSession sqlSession;
   
   public List<MemberDTO> memberList(String mem_no) {
      List<MemberDTO> list = null;
      list = sqlSession.selectList("AdminMapper.memberList", mem_no);
      
      return list;
   }

   public int sellerRevoke(String mem_no) {
      int successCnt = 0;
      successCnt = sqlSession.update("AdminMapper.sellerRevoke", mem_no);
      
      return successCnt;
   }

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchListCount", dto);
		return totalCount;
	}
	
	public List<QnADTO> searchList(SearchDTO dto) {
		List<QnADTO> list = null;
		list = sqlSession.selectList("AdminMapper.selectList", dto);
		return list;
	}
}