package kr.co.ictedu.board.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class MemberBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<MemberBoardDTO> searchList( SearchDTO dto ) {
		List<MemberBoardDTO> list = null;
		list = sqlSession.selectList("MemberBoardMapper.searchList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MemberBoardMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

}//class
