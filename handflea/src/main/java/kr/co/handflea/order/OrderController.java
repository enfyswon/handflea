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

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	private final static Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String orderList(ProductDTO dto, Model model, HttpSession session) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		MemberDTO mdto = new MemberDTO();
		mdto = service.buyerInfo(mem_no);
		model.addAttribute("buyer_info", mdto);
		
		List<ProductDTO> list = null;
		list = service.buyOrderList(dto);
		model.addAttribute("list", list);
		
		return "/order/order_list";
	}
}
