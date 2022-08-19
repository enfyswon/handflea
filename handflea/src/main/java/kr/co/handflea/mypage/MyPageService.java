package kr.co.handflea.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SellerDTO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO dao;
	
	public int sellerjoin(SellerDTO dto) {
		int successCount = 0;
		successCount = dao.sellerjoin( dto );
		return successCount;
	}//sellerjoin
	
	public List<BankDTO> bankSelect() {
		List<BankDTO> list = null;
		list = dao.bankSelect();
		
		return list;
	}

	public MemberDTO infoSelect(String mem_no) {
		MemberDTO dto = null;
		dto = dao.infoSelect(mem_no);
		
		return dto;
	}

	public int infoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = dao.infoUpdate(dto);
		
		return updateYN;
	}

}
