package kr.co.ictedu.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.credit.card.CreditCardDTO;
import kr.co.ictedu.credit.card.CreditCardService;
import kr.co.ictedu.delivery.DeliveryDTO;
import kr.co.ictedu.delivery.DeliveryService;
import kr.co.ictedu.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Autowired
	private DeliveryService deliveryService;

	@Autowired
	private CreditCardService creditCardService;

	@RequestMapping(value = "/list_credit_card", method = RequestMethod.GET)
	public String listCreditCard( Model model, HttpSession session ) {

		List<CreditCardDTO> cardlist = null;
		cardlist = creditCardService.list( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		model.addAttribute("cardlist", cardlist);

		return "mypage/list_credit_card";
	}//listCreditCard

	@RequestMapping(value = "/list_delivery", method = RequestMethod.GET)
	public String listDelivery( Model model, HttpSession session ) {

		List<DeliveryDTO> deliverylist = null;
		deliverylist = deliveryService.list( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		model.addAttribute("deliverylist", deliverylist);

		return "mypage/list_delivery";
	}//listDelivery

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list( Model model, HttpSession session ) {

		return "mypage/list";
	}//list

}//class
