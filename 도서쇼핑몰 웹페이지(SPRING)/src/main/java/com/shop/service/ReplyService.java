package com.shop.service;

import java.util.List;

import com.shop.model.Criteria;
import com.shop.model.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> list(int boardid) throws Exception;

	public void create(ReplyVO replyVO) throws Exception;

	public void update(ReplyVO replyVO) throws Exception;

	public void delete(ReplyVO replyVO) throws Exception;
	
	
	public ReplyVO selectReply(int replyno) throws Exception;
 
	
  
}
