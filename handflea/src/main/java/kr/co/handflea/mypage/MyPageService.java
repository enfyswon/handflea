package kr.co.handflea.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.order.OrderDTO;
import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.DeliveryDTO;
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

	public List<OrderDTO> orderList(String mem_no) {
		List<OrderDTO> list = null;
		list = dao.orderList(mem_no);
		
		for (int i = 0; i < list.size(); i++) {
			OrderDTO dto = list.get(i);
			if (dto.getPrdt_con().equals("1") || dto.getPrdt_con().equals("2")) {
				dto = dao.orderDeliveryList(dto.getDetail_no());
				list.set(i, dto);
			}
		}
		
		return list;
	}

	public OrderDTO orderDetail(String detail_no) {
		OrderDTO dto = null;
		String delivery_no = dao.deliveryChk(detail_no);
		
		if (delivery_no == null || delivery_no == "") {
			dto = dao.orderDetail(detail_no);
		} else {
			dto = dao.orderDeliveryDetial(detail_no);
		}
		
		return dto;
	}

	public String sellerNo(String detail_no) {
		String seller_no = null;
		seller_no = dao.sellerNo(detail_no);
		
		return seller_no;
	}

	public List<DeliveryDTO> deliverySelect() {
		List<DeliveryDTO> list = null;
		list = dao.deliverySelect();
		
		return list;
	}

	public MemberDTO getSellerOrderCnt(String mem_no) {
		MemberDTO dto = null;
		dto = dao.getSellerOrderCnt(mem_no);
		
		return dto;
	}

	public MemberDTO sellerInfoSelect(String mem_no) {
		MemberDTO dto = null;
		dto = dao.sellerInfoSelect(mem_no);
		
		return dto;
	}

	public int sellerInfoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = dao.sellerInfoUpdate(dto);
		return updateYN;
	}
	
	public int sellerDelete(MemberDTO dto) {
		int deleteYn = 0;
		deleteYn = dao.sellerDelete(dto);
		return deleteYn;
	}

	public int memDelete(MemberDTO dto) {
		int deleteYn = 0;
		deleteYn = dao.memDelete(dto);
		return deleteYn;
	}
}
