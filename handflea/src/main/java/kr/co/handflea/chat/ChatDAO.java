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
}
