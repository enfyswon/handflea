package kr.co.handflea.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO dao;

	public List<ChatDTO> ajaxList(String mem_no) {
		List<ChatDTO> list = null;
		list = dao.ajaxList(mem_no);
		
		return list;
	}

	public List<ChatDTO> chatDetail(ChatDTO dto) {
		List<ChatDTO> list = null;
		list = dao.chatDetail(dto);
		
		return list;
	}

	public int chatSend(ChatDTO dto) {
		int insertYN = 0;
		insertYN = dao.chatSend(dto);
		
		return insertYN;
	}
}
