package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.AuthorMapper;
import com.shop.mapper.CartMapper;
import com.shop.model.CartListVO;
import com.shop.model.CartVO;
import com.shop.model.Criteria;
import com.shop.model.OrderDetailVO;
import com.shop.model.OrderListVO;
import com.shop.model.OrderVO;

@Service
public class CartServiceImpl implements CartService{

	 @Autowired
	 CartMapper cartMapper;
	
	  @Override
	public void addCart(CartVO cartVO) throws Exception {
		cartMapper.addCart(cartVO);
		
	}
	  
	  @Override
	public List<CartListVO> cartList(String memberId,Criteria cri) throws Exception {
		
		return cartMapper.cartList(memberId,cri);
	}

	@Override
	public int cartGetTotal(String memberId,Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return cartMapper.cartGetTotal(memberId,cri);
	}

	@Override
	public CartListVO cartGetTotal2() {
		// TODO Auto-generated method stub
		return cartMapper.cartGetTotal2();
	}
	
	  
	 @Override
	public void deleteCart(CartVO cartVO) throws Exception {
		cartMapper.deleteCart(cartVO);
		
	}
	 
	 @Override
	public void cartAllDelete(String memberId) throws Exception {
		cartMapper.cartAllDelete(memberId);
		
	}
	 
	 @Override
	public void orderInfo(OrderVO order) throws Exception {
		cartMapper.orderInfo(order);
		
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return cartMapper.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return cartMapper.orderView(order);
	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		// TODO Auto-generated method stub
		cartMapper.orderInfo_Details(orderDetail);
	}
	
	@Override
	public void stockUpdate(String memberId) throws Exception {
		// TODO Auto-generated method stub
		cartMapper.stockUpdate(memberId);
	}
}
