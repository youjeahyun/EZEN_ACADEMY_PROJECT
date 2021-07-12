package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.MainMapper;
import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	MainMapper mainMapper;

	@Override
	public AttachImageVO mainImage(AttachImageVO attachImage) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.mainImage(attachImage);
	}

	@Override
	public List<AttachImageVO> mainImage2(AttachImageVO attachImage) {
		// TODO Auto-generated method stub
		return mainMapper.mainImage2(attachImage);
	}

	@Override
	public List<AttachImageVO> mainKo(Criteria cri) {
		// TODO Auto-generated method stub
		return mainMapper.mainKo(cri);
	}

	@Override
	public AttachImageVO mainDetail(AttachImageVO attachImage)  throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.mainDetail(attachImage);
	}

	@Override
	public int mainGetTotal(Criteria cri) throws Exception {
		
	        return mainMapper.mainGetTotal(cri);
	}

	@Override
	public List<AttachImageVO> mainGetList(Criteria cri) {
		// TODO Auto-generated method stub
		return mainMapper.mainGetList(cri);
	}

	@Override
	public int mainGetTotal2(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.mainGetTotal2(cri);
	}
	
	@Override
	public int mainGetTotal3(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.mainGetTotal3(cri);
	}
	
	@Override
	public int mainGetTotal4(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.mainGetTotal4(cri);
	} 

	@Override
	public List<AttachImageVO> authorGetList2(Criteria cri) {
		// TODO Auto-generated method stub
		return mainMapper.authorGetList2(cri);
	}

	@Override
	public List<AttachImageVO> genreGetList(Criteria cri) {
		// TODO Auto-generated method stub
		return mainMapper.genreGetList(cri);
	}

	@Override
	public List<AttachImageVO> mainEn(Criteria cri) {
		// TODO Auto-generated method stub
		return mainMapper.mainEn(cri);
	}

	@Override
	public int mainGetTotal5(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.mainGetTotal5(cri);
	}

	@Override
	public List<AttachImageVO> mainSearch(Criteria cri) {
		// TODO Auto-generated method stub
		return mainMapper.mainSearch(cri);
	}





}
