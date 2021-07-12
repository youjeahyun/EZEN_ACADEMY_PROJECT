package com.shop.mapper;

import java.util.List;

import com.shop.model.Criteria;
import com.shop.model.ReplyVO;

public interface ReplyMapper {
	//댓글 리스트
	public List<ReplyVO> list(int boardid);
	
	//댓글 작성
	public void create(ReplyVO replyVO);
	
	//댓글 수정
	public void update(ReplyVO replyVO);
	
	//댓글 삭제
	public void delete(ReplyVO replyVO);
	
	//선택한 댓글 조회
	public ReplyVO selectReply(int replyno);
    
}
