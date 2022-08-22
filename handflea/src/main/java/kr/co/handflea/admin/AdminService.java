package kr.co.handflea.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.QnA.QnADTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SearchDTO;

@Service
public class AdminService {
  
	@Autowired
   private AdminDAO dao;

   public List<MemberDTO> memberList(String mem_no) {
      List<MemberDTO> list = null;
      list = dao.memberList(mem_no);
      
      return list;
   }

   public int sellerRevoke(String mem_no) {
      int successCnt = 0;
      successCnt = dao.sellerRevoke(mem_no);
      
      return successCnt;
   }

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}
	
	public List<QnADTO> searchList(SearchDTO dto) {
		List<QnADTO>list=null;
		list = dao.searchList(dto);
		return list;
		
	}



}