package com.synergy.socdoc.detail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.detail.model.InterDetailDAO;
import com.synergy.socdoc.member.HpInfoVO;

@Service
public class DetailService implements InterDetailService {

	
	@Autowired
	private InterDetailDAO dao;
	
	@Override
	public HpInfoVO hospitalDetail(String hpSeq) {
		HpInfoVO hpDetail = dao.hospitalDetail(hpSeq);
		return hpDetail;
	}

}
