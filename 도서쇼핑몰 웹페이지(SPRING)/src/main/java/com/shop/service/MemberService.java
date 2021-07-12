package com.shop.service;

import com.shop.model.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
   /* 아이디 중복 검사*/
	public int idCheck(String memberId) throws Exception;
	
	/* 로그인 */
    public MemberVO memberLogin(MemberVO member) throws Exception;
	
    /* 회원 상세 */
   	public MemberVO memberGetDetail(String memberId) throws Exception;
   	
   	/* 회원 정보 수정 */
	public void memberModify(MemberVO member) throws Exception;
	
	public void memberDelete(String memberId) throws Exception;
}