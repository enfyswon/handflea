package kr.co.handflea;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 




@Controller
@RequestMapping("/member/*")
public class MemberController {

@Inject

@RequestMapping("login.do")
 public String login() {
  return "member/login";
}


 }