package com.shop.controller;



import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.model.CartListVO;
import com.shop.model.CartVO;
import com.shop.model.Criteria;
import com.shop.model.MemberVO;
import com.shop.model.OrderDetailVO;
import com.shop.model.OrderListVO;
import com.shop.model.OrderVO;
import com.shop.model.PageDTO;
import com.shop.service.CartService;

@Controller
public class CartController {

        @Autowired
        private CartService cartService;
        
        @ResponseBody
        @RequestMapping(value="/cateDetail/addCart",method = RequestMethod.POST)
        public void addCart(CartVO cartVO, HttpSession session) throws Exception{
        	
        	MemberVO member=(MemberVO)session.getAttribute("member");
        	cartVO.setMemberId(member.getMemberId());
        	
        	cartService.addCart(cartVO);
        }
        
        
        @RequestMapping(value="/cart", method = RequestMethod.GET)
        public void getcartList(HttpSession session, Model model,Criteria cri) throws Exception{
        	
        	MemberVO memberVO =(MemberVO)session.getAttribute("member");
        	String memberId=memberVO.getMemberId();
        	
        	List<CartListVO> cartList=cartService.cartList(memberId, cri);
        	
        	model.addAttribute("cartList", cartList);
        	
        	model.addAttribute("pageMaker", new PageDTO(cri,cartService.cartGetTotal(memberId,cri)));
        }
        
     // 카트 삭제
        @ResponseBody
        @RequestMapping(value ="/deleteCart", method = RequestMethod.POST)
        public int deleteCart(HttpSession session,
             @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
        
         
         MemberVO member = (MemberVO)session.getAttribute("member");
         String memberId = member.getMemberId();
         
         int result = 0;
         int cartid = 0;
         

         if(member != null) {
          cart.setMemberId(memberId);;
          
          for(String i : chArr) {   
           cartid = Integer.parseInt(i);
           cart.setCartid(cartid);
           cartService.deleteCart(cart);
          }   
          result = 1;
         }  
         return result;  
        }
        
        
      //주문
        @RequestMapping(value ="/cart", method = RequestMethod.POST)
        public String order(HttpSession session,OrderVO order,OrderDetailVO orderDetail ) throws Exception{
        	
        	MemberVO member=(MemberVO)session.getAttribute("member");
        	String memberId=member.getMemberId();
        	
        	Calendar cal = Calendar.getInstance();
        	 int year = cal.get(Calendar.YEAR);
        	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        	 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
        	 String subNum = "";
        	 
        	 for(int i = 1; i <= 6; i ++) {
        		  subNum += (int)(Math.random() * 10);
        		 }
        	 
        	 String orderId = ymd + "_" + subNum;
        	 
        	 order.setOrderId(orderId);
        	 order.setMemberId(memberId);
        	 orderDetail.setOrderId(orderId);
        	 orderDetail.setMemberId(memberId);
        	 
        	cartService.stockUpdate(memberId); 
        	cartService.orderInfo(order);
        	cartService.orderInfo_Details(orderDetail);
        	cartService.cartAllDelete(memberId);
        	
        	return "redirect:/orderList";
        	
        }
        // 주문 목록
        @RequestMapping(value = "/orderList", method = RequestMethod.GET)
        public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
    
         
         MemberVO member = (MemberVO)session.getAttribute("member");
         String memberId = member.getMemberId();
         
         order.setMemberId(memberId);
         
         List<OrderVO> orderList = cartService.orderList(order);
         
         model.addAttribute("orderList", orderList);
        }
        
        
     // 주문 상세 목록
        @RequestMapping(value = "/orderView", method = RequestMethod.GET)
        public void getOrderList(HttpSession session,
              @RequestParam("n") String orderId,
              OrderVO order, Model model) throws Exception {
         
         MemberVO member = (MemberVO)session.getAttribute("member");
         String userId = member.getMemberId();
         
         order.setMemberId(userId);
         order.setOrderId(orderId);
         
         List<OrderListVO> orderView = cartService.orderView(order);
         
         model.addAttribute("orderView", orderView);
        }
        
        
}
