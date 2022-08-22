package kr.co.handflea.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.util.dto.MemberDTO;

@Service
public class AdminService {
	@Autowired
	AdminDAO dao;

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

}
