package kr.co.handflea.chat;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<ChatDTO> ajaxList(String mem_no) {
		List<ChatDTO> list = null;
		list = sqlSession.selectList("ChatMapper.ajaxList",	mem_no);
		
		for (ChatDTO dto : list) {
			dto.setMem_no(mem_no);
			int unread = sqlSession.selectOne("ChatMapper.unreadCnt", dto);
			String other_name = sqlSession.selectOne("ChatMapper.getName", dto);
			dto.setUnread(unread);
			dto.setOther_name(other_name);
			
			if (mem_no.equals(dto.getSend_mem_no())) {
				dto.setOther_no(dto.getRecv_mem_no());
			} else {
				dto.setOther_no(dto.getSend_mem_no());
			}
		}
		
		return list;
	}

	public List<ChatDTO> chatDetail(ChatDTO dto) {
		List<ChatDTO> list = null;
		list = sqlSession.selectList("ChatMapper.chatDetail", dto);
		sqlSession.update("ChatMapper.updateChat", dto);
		
		return list;
	}

	public int chatSend(ChatDTO dto) {
		int exist = sqlSession.selectOne("ChatMapper.existChat", dto);
		if (exist == 0) {
			int max_room = sqlSession.selectOne("ChatMapper.maxRoomno");
			dto.setChat_roomno(Integer.toString(max_room + 1));
		} else {
			String chat_roomno = sqlSession.selectOne("ChatMapper.selectRoom", dto);
			dto.setChat_roomno(chat_roomno);
		}
		
		int insertYN = 0;
		insertYN = sqlSession.insert("ChatMapper.chatSend", dto);
		
		return insertYN;
	}
}
