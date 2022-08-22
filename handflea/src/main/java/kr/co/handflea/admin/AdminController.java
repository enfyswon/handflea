package kr.co.handflea.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.handflea.QnA.QnADTO;
import kr.co.handflea.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
   private final static Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Autowired
   AdminService service;
   
   @RequestMapping(value = "/member", method = RequestMethod.GET)
   public String memberlist(Model model, HttpSession session) {
      String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
      List<MemberDTO> list = null;
      list = service.memberList(mem_no);
      
      model.addAttribute("mem_list", list);
      
      return "/admin/member";
   }
   
   @RequestMapping(value = "/revoke", method = RequestMethod.GET)
   public void sellerRevoke(String mem_no, PrintWriter out) {
      int successCnt = 0;
      successCnt = service.sellerRevoke(mem_no);
      
      out.print(successCnt);
      out.close();
   }
   
   @RequestMapping(value = "/refund", method = RequestMethod.GET)
   public String refundlist() {
      return "/admin/refund";
   }
   
   @RequestMapping(value = "qna", method = RequestMethod.GET)
   public String qnaList(Model model) {
	   String answer_yn = "0";
	   List<QnADTO> readyList = null;
	   readyList = service.readyList(answer_yn);
	   
	   answer_yn = "1";
	   List<QnADTO> completeList = null;
	   completeList = service.completeList(answer_yn);
	   
	   model.addAttribute("readyList", readyList);
	   model.addAttribute("completeList", completeList);
	
	   return "/admin/qna_list";
   }
}