package com.shop.controller;



import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.model.AttachImageVO;
import com.shop.model.CartListVO;
import com.shop.model.Criteria;
import com.shop.model.MemberVO;
import com.shop.model.PageDTO;
import com.shop.service.AdminService;
import com.shop.service.AuthorService;
import com.shop.service.CartService;
import com.shop.service.MainService;
import com.shop.service.MemberService;

@Controller
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Autowired
	private MainService mainService;

	@Autowired
	private AuthorService authorService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private CartService cartService;

	@Autowired
	private MemberService memberservice;

	//메인 페이지 이동
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public void mainPageGET(HttpServletRequest request,AttachImageVO img, Model model, Criteria cri) throws Exception {
		HttpSession session = request.getSession();
		logger.info("메인 페이지 진입");

		cri.setAmount(20);

		List list = mainService.mainGetList(cri);


		model.addAttribute("list", list);
		//AttachImageVO Image = mainService.mainImage(img);

		/* 페이지 이동 인터페이스 데이터 */   
		model.addAttribute("pageMaker", new PageDTO(cri,mainService.mainGetTotal(cri)));


		//session.setAttribute("test", Image);  
		// System.out.println(Image);
	}

	//상품 상세 페이지 이동
	@RequestMapping(value="/cateDetail", method = RequestMethod.GET)
	public void mainDetailPageGET(Criteria cri,AttachImageVO img, Model model) throws Exception{

		logger.info("메인 상세 페이지 진입");
		AttachImageVO detail = mainService.mainDetail(img);

		CartListVO test = cartService.cartGetTotal2();


		model.addAttribute("list2",test);
		model.addAttribute("list", detail);
	}

	//상품 구매 페이지 이동
	@RequestMapping(value="/cateOrder", method = RequestMethod.GET)
	public void cateOrderPageGET(AttachImageVO img, Model model) throws Exception{
		logger.info("제품 구매 페이지 진입");

	}


	//마이룸 페이지 이동
	@RequestMapping(value="/userRoom", method = RequestMethod.GET)
	public void uerRoomPageGET(AttachImageVO img, Model model) throws Exception{
		logger.info("마이룸 페이지 진입");

	}

	//국내 페이지 이동
	@RequestMapping(value="/cate1", method = RequestMethod.GET)
	public void koBookPageGET(Criteria cri,AttachImageVO img, Model model) throws Exception {
		logger.info("국내  페이지 진입");

		cri.setAmount(20);

		List list = mainService.mainKo(cri);
		model.addAttribute("list", list);

		/* 페이지 이동 인터페이스 데이터 */   
		model.addAttribute("pageMaker", new PageDTO(cri,mainService.mainGetTotal2(cri)));
	}
	//외국 페이지 이동
	@RequestMapping(value="/cate2", method = RequestMethod.GET)
	public void EnBookPageGET(Criteria cri,AttachImageVO img, Model model) throws Exception {
		logger.info("외국  페이지 진입");

		cri.setAmount(20);

		List list = mainService.mainEn(cri);
		model.addAttribute("list", list);

		/* 페이지 이동 인터페이스 데이터 */   
		model.addAttribute("pageMaker", new PageDTO(cri,mainService.mainGetTotal5(cri)));
	}

	//장르 페이지 이동
	@RequestMapping(value="/cate3", method = RequestMethod.GET)
	public void genrePageGET(Criteria cri,AttachImageVO img, Model model) throws Exception {
		logger.info("장르  페이지 진입");

		cri.setAmount(20);

		ObjectMapper objm = new ObjectMapper();

		List list = adminService.cateList();

		List list2 = mainService.genreGetList(cri);

		String cateList = objm.writeValueAsString(list);

		model.addAttribute("cateList", cateList);

		model.addAttribute("list",list2);





		/* 페이지 이동 인터페이스 데이터 */   
		model.addAttribute("pageMaker", new PageDTO(cri,mainService.mainGetTotal3(cri)));
	}

	//작가별 페이지 이동
	@RequestMapping(value="/cate4", method = RequestMethod.GET)
	public void authorPageGET(Criteria cri,AttachImageVO img, Model model) throws Exception {
		logger.info("작가별  페이지 진입");

		cri.setAmount(20);

		ObjectMapper objm = new ObjectMapper();

		List list = authorService.cateList();

		List list2 = mainService.authorGetList2(cri);

		String authorList = objm.writeValueAsString(list);

		model.addAttribute("authorList", authorList);


		model.addAttribute("list",list2);



		/* 페이지 이동 인터페이스 데이터 */   
		model.addAttribute("pageMaker", new PageDTO(cri,mainService.mainGetTotal4(cri)));
	}	



	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){

		logger.info("getImage()...." + fileName);
		File file = new File("C:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		}catch (IOException e) {
			e.printStackTrace();
		}

		return result;

	}

	@GetMapping("/bdisplay")
	public ResponseEntity<byte[]> getbImage(String fileName){

		logger.info("getbImage()...." + fileName);
		File file = new File("C:\\upload\\" + fileName);

		ResponseEntity<byte[]> bresult = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			bresult = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		}catch (IOException e) {
			e.printStackTrace();
		}

		return bresult;
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



		return "/memberModify";

	}

	@RequestMapping(value="/memberModify", method = RequestMethod.POST)
	public String memberModifyPOST(MemberVO vo,RedirectAttributes rttr) throws Exception{


		memberservice.memberModify(vo);


		return "redirect:/memberDetail";
	}

	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDeltetPOST(HttpSession session,Model model ) throws Exception{

		MemberVO member=(MemberVO)session.getAttribute("member");

		String id=member.getMemberId();

		memberservice.memberDelete(id);
		session.invalidate();
		return "redirect:/main";



	}
	   //검색 페이지 이동
    @RequestMapping(value="/search", method = RequestMethod.GET)
    public void searchPageGET(Criteria cri,AttachImageVO img, Model model) throws Exception {
    logger.info("국내  페이지 진입");
    
    cri.setAmount(20);
    
    List list = mainService.mainSearch(cri);
    model.addAttribute("list", list);
    
    /* 페이지 이동 인터페이스 데이터 */   
    model.addAttribute("pageMaker", new PageDTO(cri,mainService.mainGetTotal(cri)));
    }








}
