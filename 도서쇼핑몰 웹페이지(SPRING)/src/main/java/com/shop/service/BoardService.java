package com.shop.service;

import java.util.List;

import com.shop.model.BoardImageVO;
import com.shop.model.BoardVO;
import com.shop.model.Criteria;

public interface BoardService {
	
	/* 게시글 등록 */
	public void create(BoardVO boardVO) throws Exception;
	
	/* 게시글 조회 */
	public BoardVO read(int boardid) throws Exception;
	
	/* 게시글 수정 */
	public void update(BoardVO boardVO) throws Exception;
	
	/* 게시글 삭제 */
	public void delete(int boardid) throws Exception;
	
	/* 게시글 목록 */
	public List<BoardVO> listAll(Criteria cri) throws Exception;
	
	 /* 작성자 총 수 */
    public int writerGetTotal(Criteria cri) throws Exception;
    
    /* 이미지 등록 */
	public void bimageEnroll(BoardImageVO boardImageVO) throws Exception;


}
