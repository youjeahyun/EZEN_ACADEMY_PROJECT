package com.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.model.AttachImageVO;
import com.shop.model.BookVO;
import com.shop.model.Criteria;
import com.shop.model.MemberVO;
public interface MainService {

	public AttachImageVO mainImage(AttachImageVO attachImage) throws Exception;
	
	
	public List<AttachImageVO> mainImage2(AttachImageVO attachImage);
	
	public List<AttachImageVO> mainKo(Criteria cri);
	
	public AttachImageVO mainDetail(AttachImageVO attachImage) throws Exception;
	
	public int mainGetTotal(Criteria cri) throws Exception;
	
	public int mainGetTotal2(Criteria cri) throws Exception;
	
	public int mainGetTotal3(Criteria cri) throws Exception;
	
	public int mainGetTotal4(Criteria cri) throws Exception;


	public List<AttachImageVO> mainGetList(Criteria cri);


	public List<AttachImageVO> authorGetList2(Criteria cri);


	public List<AttachImageVO> genreGetList(Criteria cri);


	public List<AttachImageVO> mainEn(Criteria cri);


	public int mainGetTotal5(Criteria cri) throws Exception;


	public List<AttachImageVO> mainSearch(Criteria cri);



	
}
