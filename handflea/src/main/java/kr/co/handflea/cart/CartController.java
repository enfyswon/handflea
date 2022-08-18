package kr.co.handflea.cart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	private final static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list() {
		
		return "/cart/cart_list";
	}
}
