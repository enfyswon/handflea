package kr.co.handflea.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.order.OrderDTO;
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
		dao.updateSellerYN(dto.getMem_no());
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

	public List<OrderDTO> recentOrder(String mem_no) {
		List<OrderDTO> list = null;
		list = dao.recentOrder(mem_no);
		
		return list;
	}

	public List<OrderDTO> recentSellOrder(String mem_no) {
		List<OrderDTO> list = null;
		list = dao.recentSellOrder(mem_no);
		
		return list;
	}

	public List<OrderDTO> saleList(String mem_no) {
		List<OrderDTO> list = null;
		list = dao.saleList(mem_no);
		
		for (int i = 0; i < list.size(); i++) {
			OrderDTO dto = list.get(i);
			if (dto.getPrdt_con().equals("1") || dto.getPrdt_con().equals("2")) {
				dto = dao.saleDeliveryList(dto.getDetail_no());
				list.set(i, dto);
			}
		}
		
		return list;
	}

}
