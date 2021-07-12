package com.shop.mapper;

import java.util.List;

import com.shop.model.AttachImageVO;
import com.shop.model.BoardImageVO;
import com.shop.model.BoardVO;
import com.shop.model.Criteria;

public interface BoardMapper {
	
	/* 게시글 등록 */
	public void create(BoardVO boardVO);
	
	/* 게시글 조회 */
	public BoardVO read(int boardid);
	
	/* 게시글 수정 */
	public void update(BoardVO boardVO);
	
	/* 게시글 삭제 */
	public void delete(int boardid);
	
	/* 게시글 목록 */
	public List<BoardVO> listAll(Criteria cri);
	
	 /* 작성자 총 수 */
    public int writerGetTotal(Criteria cri);
    
    /* 게시판 조회수*/
    public void boardHit(int boardid);
    
    /* 이미지 등록 */
	public void bimageEnroll(BoardImageVO boardImageVO);
	
}
