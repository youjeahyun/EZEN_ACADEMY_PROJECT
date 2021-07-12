package com.shop.mapper;

import java.util.List;

import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
import com.shop.model.MemberVO;

public interface MainMapper {
	

	

	public List<AttachImageVO> mainImage2(AttachImageVO attachImage);
	
	public AttachImageVO mainImage(AttachImageVO attachImage);
	
	public List<AttachImageVO> mainKo(Criteria cri);
	
	public List<AttachImageVO> mainEn(Criteria cri);
	
	public AttachImageVO mainDetail(AttachImageVO attachImage);
	
	public int mainGetTotal(Criteria cri);
	
	public int mainGetTotal2(Criteria cri);
	
	public int mainGetTotal3(Criteria cri);
	
	public int mainGetTotal4(Criteria cri);
	
	public List<AttachImageVO> mainGetList(Criteria cri);
	

	public List<AttachImageVO> authorGetList2(Criteria cri);

	public List<AttachImageVO> genreGetList(Criteria cri);

	public int mainGetTotal5(Criteria cri);

	public List<AttachImageVO> mainSearch(Criteria cri);
	
	

	
	
	
}
