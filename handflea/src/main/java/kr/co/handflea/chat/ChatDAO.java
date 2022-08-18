package kr.co.handflea.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<ChatDTO> ajaxList(String send_mem_no) {
		List<ChatDTO> list = null;
		list = sqlSession.selectList("ChatMapper.ajaxList",	send_mem_no);
		
		return list;
	}
}
