package kr.co.handflea.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	public List<ProductDTO> orderList(String[] arr_basket_no) {
		List<ProductDTO> list = null;
		list = dao.orderList(arr_basket_no);
		
		return list;
	}

	@Transactional
	public int insert(OrderDTO dto, int buyNowYN) {
		int successCnt = 0;
		successCnt = dao.insertOrder(dto);
		if (successCnt < 1) {
			return successCnt;
		}
		
		if (buyNowYN == 0) {
			successCnt = dao.insertBasketOrder(dto);
			if (successCnt < 1) {
				return successCnt;
			}
			
			successCnt = dao.deleteBasket(dto.getArr_basket_no());
		} else if (buyNowYN == 1) {
			successCnt = dao.insertNowOrder(dto);
		}
		
		return successCnt;
	}

	public int deliveryUpdate(OrderDTO dto) {
		int successCnt = 0;
		successCnt = dao.deliveryUpdate(dto);
		
		return successCnt;
	}
}
