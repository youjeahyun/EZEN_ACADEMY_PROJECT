package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.BoardMapper;
import com.shop.model.AuthorVO;
import com.shop.model.BoardImageVO;
import com.shop.model.BoardVO;
import com.shop.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	
	private BoardMapper boardMapper;
	
	@Inject
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper=boardMapper;
	}
	
	
	 /* 게시글 작성 */
	@Override
	public void create(BoardVO boardVO) throws Exception {
		
		boardMapper.create(boardVO);
		if(boardVO.getBimageList() == null || boardVO.getBimageList().size() <= 0) {
			return;
		}
		
           boardVO.getBimageList().forEach(boardImageVO ->{
			
			boardImageVO.setBoardid(boardVO.getBoardid());
			boardMapper.bimageEnroll(boardImageVO);
			
		});
		
	}
	
	/* 게시글 목록 */
	@Override
	public List<BoardVO> listAll(Criteria cri) throws Exception {
		
		return boardMapper.listAll(cri);
	}
	
	/* 게시글 개수 */
	@Override
	public int writerGetTotal(Criteria cri) throws Exception {
		
		return boardMapper.writerGetTotal(cri);
	}
	
	/* 게시글 조회 */
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int boardid) throws Exception {
	         boardMapper.boardHit(boardid);
		return boardMapper.read(boardid);
	}
	
	/* 게시글 수정 */
	@Override
	public void update(BoardVO boardVO) throws Exception {
	
		 boardMapper.update(boardVO);
	}
	
	/* 게시글 삭제 */
	@Override
	public void delete(int boardid) throws Exception {
		
		 boardMapper.delete(boardid);
	}
	
@Override
	public void bimageEnroll(BoardImageVO vo) throws Exception {
	 boardMapper.bimageEnroll(vo);
		
	}
	
	

}
