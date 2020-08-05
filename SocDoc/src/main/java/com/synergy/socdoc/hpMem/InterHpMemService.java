package com.synergy.socdoc.hpMem;

import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;

@Service
public interface InterHpMemService {

	public HpInfoVO getHpInfo(String hpSeq);
	
}
