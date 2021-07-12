package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.MemberMapper;
import com.shop.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;
	/*회원가입*/
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	/* 아이디중복검사 */
	@Override
	public int idCheck(String memberId) throws Exception {
	
		return membermapper.idCheck(memberId);
	}
	
	/* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }
 
    @Override
    public MemberVO memberGetDetail(String memberId) throws Exception {
    	// TODO Auto-generated method stub
    	return membermapper.memberGetDetail(memberId);
    }
    
    @Override
    public void memberModify(MemberVO member) throws Exception {
    	// TDO Auto-generated method stub
     membermapper.memberModify(member);
    }
    
    @Override
    public void memberDelete(String memberId) throws Exception {
    	membermapper.memberDelete(memberId);
    }
	
   
}