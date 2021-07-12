package com.shop.mapper;

import com.shop.model.AuthorVO;
import com.shop.model.MemberVO;

public interface MemberMapper {

	/* 회원가입 */
	public void memberJoin(MemberVO member);

	// 아이디 중복 검사
	public int idCheck(String memberId);
	
	/* 로그인 */
    public MemberVO memberLogin(MemberVO member);
    
    /* 회원 상세 */
   	public MemberVO memberGetDetail(String memberId);
   	
   	/* 회원 정보 수정 */
	public void memberModify(MemberVO member);
	
	public void memberDelete(String memberId);
	
	
}
