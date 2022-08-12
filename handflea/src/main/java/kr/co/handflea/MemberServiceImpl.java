package kr.co.handflea;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

@Inject
MemberDAO memberDao;
@Override
public String loginCheck(MemberDTO dto, HttpSession session) {
String name = memberDao.loginCheck(dto);
 if (name != null) { 
  session.setAttribute("mem_email", dto.getMem_email());
  session.setAttribute("mem_name", dto.getMem_name());
}
 return name; 
}

@Override
public void logout(HttpSession session) {
 session.invalidate();
 }
}