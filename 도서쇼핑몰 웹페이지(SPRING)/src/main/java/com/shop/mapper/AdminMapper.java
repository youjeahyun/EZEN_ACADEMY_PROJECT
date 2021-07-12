package com.shop.mapper;

import java.util.List;

import com.shop.model.AttachImageVO;
import com.shop.model.BookVO;
import com.shop.model.CateVO;
import com.shop.model.Criteria;
import com.shop.model.MemberVO;

public interface AdminMapper {
	/* 상품 등록 */
	public void bookEnroll(BookVO book);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/* 상품 리스트 */
	public List<BookVO> goodsGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 상품 조회 페이지 */
	public BookVO goodsGetDetail(int bookId);
	
	/* 상품 수정 */
	public int goodsModify(BookVO vo);
	
	/* 상품 정보 삭제 */
	public int goodsDelete(int bookId);
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	
	/* 회원 리스트 */
	public List<MemberVO> memberGetList(Criteria cri);
	
	/* 회원 총 개수 */
	public int memberGetTotal(Criteria cri);
	
	/* 회원 정보 삭제 */
	public int memberDelete(String memberId);
	
	
}
