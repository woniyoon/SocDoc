package com.synergy.socdoc.hpMem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;

@Service
public class HpMemService implements InterHpMemService {

	@Autowired
	private InterHpMemDAO dao;
	
	@Override
	public HpInfoVO getHpInfo(String hpSeq) {
		HpInfoVO hpInfo = dao.getHpInvo(hpSeq);
		
		return hpInfo;
	}

}
