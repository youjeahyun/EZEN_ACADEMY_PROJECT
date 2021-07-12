package com.shop.mapper;

import java.util.List;

import com.shop.model.CartListVO;
import com.shop.model.CartVO;
import com.shop.model.Criteria;
import com.shop.model.OrderDetailVO;
import com.shop.model.OrderListVO;
import com.shop.model.OrderVO;

import org.apache.ibatis.annotations.Param;

public interface CartMapper {
	
	public void addCart(CartVO cartVO);

	public List<CartListVO> cartList(@Param("memberId") String memberId,@Param("cri") Criteria cri);

	public int cartGetTotal(@Param("memberId") String memberId,Criteria cri);

	public CartListVO cartGetTotal2();
	
    public void deleteCart(CartVO cartVO);
	
	public void cartAllDelete(String memberId);
	
	//주문정보
	public void orderInfo(OrderVO order);

	public List<OrderVO> orderList(OrderVO order);

	public List<OrderListVO> orderView(OrderVO order);

	public void orderInfo_Details(OrderDetailVO orderDetail);
	
	//수량수정
	public void stockUpdate(String memberId);
	
}
