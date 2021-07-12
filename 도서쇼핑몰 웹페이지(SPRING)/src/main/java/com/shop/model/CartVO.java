package com.shop.model;

import java.util.Date;

public class CartVO {
	
	private int cartNum;
	private String memberId;
	private Integer bookId;
	private int cartStock;
	private Date addDate;
	private String uuid;
	private int cartid;
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", memberId=" + memberId + ", bookId=" + bookId + ", cartStock="
				+ cartStock + ", addDate=" + addDate + "]";
	}
	

	
}
