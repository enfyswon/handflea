package kr.co.handflea.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.handflea.product.ProductDTO;
@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;
	
	/*
	 * @Transactional public int insert ( OrderDTO dto, int buyNowYN) { int
	 * successCount= 0; successCount = dao.insertOrder(dto); //insertOrderMain을
	 * 수행하면서 selectKey가 dto에 order_no 값을 입력한다. if(successCount < 1) return
	 * successCount;
	 * 
	 * if(buyNowYN == 0) { successCount =
	 * dao.insertOrderDetail(dto);//insertOrderDetail을 호출하는 시점에서는 dto에 order_no 값이
	 * 있다. if(successCount < 1) return successCount;
	 * 
	 * successCount = dao.deleteBasketByArray(dto.getArr_basket_no()); } else
	 * if(buyNowYN == 1) {//장바구니 테이블에 데이터가 없는 바로 주문 successCount =
	 * dao.insertBuyNowOrderDetail(dto); } if(successCount < 1) return successCount;
	 * 
	 * successCount = dao.updateCreditCardUsedDate(dto); if(successCount < 1) return
	 * successCount;
	 * 
	 * successCount = dao.updateDeliveryAddrUsedDate(dto); if(successCount < 1)
	 * return successCount;
	 * 
	 * return successCount; }
	 * 
	 * public List<ProductDTO> orderList(String[] arr_basket_no) { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * public List<ProductDTO> buyNowOrderList(ProductDTO dto) { // TODO
	 * Auto-generated method stub return null; }
	 */

}
