package kr.co.handflea.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO dao;
	
	public List<BankDTO> bankSelect() {
		List<BankDTO> list = null;
		list = dao.bankSelect();
		
		return list;
	}
}
