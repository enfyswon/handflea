package kr.co.handflea.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.util.dto.MemberDTO;

@Repository
public class AdminDAO {
   @Autowired
   SqlSession sqlSession;

   public List<MemberDTO> memberList(String mem_no) {
      List<MemberDTO> list = null;
      list = sqlSession.selectList("AdminMapper.memberList", mem_no);
      
      return list;
   }

   public int sellerRevoke(String mem_no) {
      int successCnt = 0;
      successCnt = sqlSession.update("AdminMapper.sellerRevoke", mem_no);
      
      return successCnt;
   }
}