package kr.co.handflea.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.handflea.credit.CreditCardDTO;
import kr.co.handflea.credit.CreditCardService;
import kr.co.handflea.delivery.DeliveryDAO;
import kr.co.handflea.delivery.DeliveryDTO;
import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/order")
public class OrderController {
	@Autowired
	OrderService service;

	@RequestMapping(value = "/order_list", method = RequestMethod.POST)
	public String orderList(OrderDTO dto, HttpSession session, Model model) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		dto.setMem_no(mem_no);
		
		List<OrderDTO> list = null;
		
		// 수령인, 전화번호, 배송지 주소, 상품 정보 (상품 이름, 수량, 상품 금액, 배송비, 총 주문 금액) 가져오기 
		// 구매자 mem_no, 상품 번호 prdt_no, 구매수량 buy_qty 가지고 있음
		list = service.orderList(dto);
		
		model.addAttribute("order_list", list);
		return "order/order_list";
	}
	/*
	 * @RequestMapping( value = "/order_list", method = RequestMethod.GET ) public
	 * String orderList( String [] arr_basket_no, ProductDTO dto, Model model,
	 * HttpSession session ) { List<ProductDTO> list = null; if(arr_basket_no !=
	 * null && arr_basket_no.length > 0) {//장바구니 -> 주문 목록 list = service.orderList(
	 * arr_basket_no ); } else {//상품 상세 화면 바로구매버튼 -> 주문 목록 list =
	 * service.buyNowOrderList( dto ); arr_basket_no = new String[1];
	 * arr_basket_no[0] = "0"; } model.addAttribute("list", list);
	 * 
	 * List<DeliveryDTO> deliverylist = null; deliverylist = DeliveryDAO.list( (
	 * (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
	 * model.addAttribute("deliverylist", deliverylist);
	 * 
	 * List<CreditCardDTO> cardlist = null; cardlist = CreditCardService.list( (
	 * (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
	 * model.addAttribute("cardlist", cardlist);
	 * 
	 * model.addAttribute( "arr_basket_no", new Gson().toJson( arr_basket_no ) );
	 * 
	 * return "/order/order_list";//jsp file name }//orderList
	 */
}//class

