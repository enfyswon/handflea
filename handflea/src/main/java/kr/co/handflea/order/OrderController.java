package kr.co.handflea.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.handflea.credit.CreditCardDTO;
import kr.co.handflea.delivery.DeliveryDAO;
import kr.co.handflea.delivery.DeliveryDTO;
import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;




@Controller
@RequestMapping( value = "/order")
public class OrderController {


	@RequestMapping( value = "/order_list", method = RequestMethod.GET )
	public String orderList( String [] arr_basket_no, ProductDTO dto, Model model, HttpSession session ) {
		List<ProductDTO> list = null;
		if(arr_basket_no != null && arr_basket_no.length > 0) {//장바구니 -> 주문 목록
			list = service.orderList( arr_basket_no );
		} else {//상품 상세 화면 바로구매버튼 -> 주문 목록
			list = service.buyNowOrderList( dto );
			arr_basket_no = new String[1];
			arr_basket_no[0] = "0";
		}
		model.addAttribute("list", list);

		List<DeliveryDTO> deliverylist = null;
		deliverylist = DeliveryDAO.list( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		model.addAttribute("deliverylist", deliverylist);

		List<CreditCardDTO> cardlist = null;
		cardlist = creditCardService.list( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		model.addAttribute("cardlist", cardlist);

		model.addAttribute( "arr_basket_no", new Gson().toJson( arr_basket_no ) );

		return "/order/order_list";//jsp file name
	}//orderList

}//class

