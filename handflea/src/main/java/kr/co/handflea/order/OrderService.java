package kr.co.handflea.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;

	public List<ProductDTO> buyOrderList(ProductDTO dto) {
		List<ProductDTO> list = null;
		list = dao.buyOrderList(dto);
		
		return list;
	}

	public MemberDTO buyerInfo(String mem_no) {
		MemberDTO dto = new MemberDTO();
		dto = dao.buyerInfo(mem_no);
		
		return dto;
	}

}
