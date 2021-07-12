package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.ReplyMapper;
import com.shop.model.Criteria;
import com.shop.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
     @Inject
 private ReplyMapper replyMapper;
	
	
	
	@Override
	public List<ReplyVO> list(int boardid) throws Exception {
		
		return replyMapper.list(boardid);
	}
	
	
	
	@Override
	public void create(ReplyVO replyVO) throws Exception {
		replyMapper.create(replyVO);
		
	}
	
	@Override
	public void update(ReplyVO replyVO) throws Exception {
	    replyMapper.update(replyVO);
		
	}
	
	@Override
	public void delete(ReplyVO replyVO) throws Exception {
		replyMapper.delete(replyVO);
	}
	
	@Override
	public ReplyVO selectReply(int replyno) throws Exception {
		
		return replyMapper.selectReply(replyno);
	}
	
	
}


