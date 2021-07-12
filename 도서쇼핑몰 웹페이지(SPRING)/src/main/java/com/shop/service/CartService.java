package com.shop.service;

import java.util.List;

import com.shop.model.CartListVO;
import com.shop.model.CartVO;
import com.shop.model.Criteria;
import com.shop.model.OrderDetailVO;
import com.shop.model.OrderListVO;
import com.shop.model.OrderVO;

public interface CartService {
 
	//장바구니 담기
	public void addCart(CartVO cartVO) throws Exception;
	
	//장바구니 목록
	public List<CartListVO> cartList(String memberId,Criteria cri) throws Exception;
	
	public int cartGetTotal(String memberId,Criteria cri) throws Exception;

	public CartListVO cartGetTotal2() throws Exception;
	
	//삭제
		public void deleteCart(CartVO cartVO) throws Exception;
		
		public void cartAllDelete(String memberId) throws Exception;
		
		public void orderInfo(OrderVO order) throws Exception;

		public List<OrderVO> orderList(OrderVO order) throws Exception;

		public List<OrderListVO> orderView(OrderVO order)throws Exception;

		public void orderInfo_Details(OrderDetailVO orderDetail)throws Exception;

		//수량수정
		public void stockUpdate(String memberId) throws Exception;
}
