package kr.co.handflea.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.handflea.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	private final static Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list() {
		
		return "/chat/chat_list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String ajaxList(HttpSession session, Model model) {
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMem_no();
		
		List<ChatDTO> list = service.ajaxList(mem_no);
		model.addAttribute("chat_list", list);
		
		return "/chat/chat_ajax_list";
	}
}
