package kr.co.handflea.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO dao;

	public List<ChatDTO> ajaxList(String send_mem_no) {
		List<ChatDTO> list = null;
		list = dao.ajaxList(send_mem_no);
		
		return list;
	}
}
