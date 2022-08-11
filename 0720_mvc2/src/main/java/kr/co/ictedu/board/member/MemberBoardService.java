package kr.co.ictedu.board.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class MemberBoardService {

	@Autowired
	private MemberBoardDAO dao;

	public List<MemberBoardDTO> searchList( SearchDTO dto ) {
		List<MemberBoardDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

}//class
