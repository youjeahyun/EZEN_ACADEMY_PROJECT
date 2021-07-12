package com.shop.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.model.AuthorVO;
import com.shop.model.CartListVO;
import com.shop.model.Criteria;
import com.shop.model.MemberVO;
import com.shop.service.MemberService;


@Controller
@RequestMapping(value="/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	 @Autowired
	 private JavaMailSender mailSender;
	
	//회원가입 페이지 이동
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void loginGET() {
		
		logger.info("회원가입 페이지 진입");
		
	}
	
	//회원가입
		@RequestMapping(value="/join", method=RequestMethod.POST)
		public String joinPOST(MemberVO member) throws Exception{
			
			logger.info("join 진입");
			
			// 회원가입 서비스 실행
			memberservice.memberJoin(member);
			
			logger.info("join Service 성공");
			
			return "redirect:/main";
			
		}

	//로그인 페이지 이동
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void joinGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		
		logger.info("memberIdChk() 진입");
		
		int result = memberservice.idCheck(memberId);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
   
    
	}
	
	 /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
                

        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "x4513x@naver.com";
        String toMail = email;
        String title = "재현 쇼핑몰 회원가입 인증 이메일 입니다.";
        String content = 
                "재현 쇼핑몰을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
 
    }
    /* 로그인 */
    @RequestMapping(value="login.do", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
        
    	HttpSession session = request.getSession();
    	MemberVO lvo = memberservice.memberLogin(member);
    	//System.out.println(lvo);
    	if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/member/login";
            
        }
        
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:/main";
     	
    }
    /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
    	 logger.info("logoutMainGET메서드 진입");
         
         HttpSession session = request.getSession();
         
         session.invalidate();
         
         return "redirect:/main";    
    }
    
    /* 비동기방식 로그아웃 메서드 */
    @RequestMapping(value="logout.do", method=RequestMethod.POST)
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
        
        logger.info("비동기 로그아웃 메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
    }
    
    
    /* 회원 상세 페이지 */

    @RequestMapping(value="/memberDetail", method = RequestMethod.GET)
	public void memberGetInfoGET(HttpSession session, Model model) throws Exception {

    	MemberVO memberVO =(MemberVO)session.getAttribute("member");
    	String memberId=memberVO.getMemberId();
    	
    	MemberVO memberInfo=memberservice.memberGetDetail(memberId);
    	
    	model.addAttribute("memberInfo", memberInfo);
    	


		
		

	}

	/* 회원 정보 수정 */
    @RequestMapping(value="/memberModify", method = RequestMethod.GET)
	public String memberModifyGET(HttpSession session, Model model) throws Exception{
    	
    	
    	MemberVO  memberVO =(MemberVO)session.getAttribute("member");
    	
    	String id=memberVO.getMemberId();
    	
    	model.addAttribute("memberInfo", memberservice.memberGetDetail(id));
    	

    	
		return "/member/memberModify";

	}
    
    @RequestMapping(value="/memberModify", method = RequestMethod.POST)
    public String memberModifyPOST(MemberVO vo,RedirectAttributes rttr) throws Exception{
    	
 
    	memberservice.memberModify(vo);
    	
    	
    	return "redirect:/userRoom";
    }
    
    
    
    
    
    
    
}
