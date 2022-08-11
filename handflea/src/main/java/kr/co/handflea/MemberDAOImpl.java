package kr.co.handflea;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;


public class MemberDAOImpl implements MemberDAO {

@Inject
SqlSession sqlSession; 

@Override
public String loginCheck(MemberDTO dto) {
return sqlSession.selectOne("member.login_check", dto);
 }
}