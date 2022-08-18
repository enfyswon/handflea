package kr.co.handflea.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String chatContents(@RequestParam String chat_roomno, @RequestParam String other_no, HttpSession session, Model model) {
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMem_no();
		ChatDTO dto = new ChatDTO();
		dto.setChat_roomno(chat_roomno);
		dto.setMem_no(mem_no);
		dto.setRecv_mem_no(other_no);
		
		List<ChatDTO> list = service.chatDetail(dto);
		
		model.addAttribute("chat_detail", list);
		
		return "/chat/chat_contents";
	}
	
	@RequestMapping(value = "/send", method=RequestMethod.GET)
	public int chatSend(@RequestParam String chat_roomno, @RequestParam String other_no,
			@RequestParam String content, HttpSession session) {
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMem_no();
		ChatDTO dto = new ChatDTO();
		dto.setChat_roomno(chat_roomno);
		dto.setSend_mem_no(mem_no);
		dto.setRecv_mem_no(other_no);
		dto.setChat_contents(content);
		
		int insertYN = service.chatSend(dto);
		
		return insertYN;
	}
}
