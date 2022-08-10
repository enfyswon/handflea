package kr.co.handflea.chat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	private final static Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService service;
}
