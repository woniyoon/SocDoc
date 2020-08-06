package com.synergy.socdoc.hpMem;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;

@Service
public interface InterHpMemService {

	public HpInfoVO getHpInfo(String hpSeq);

	public List<HpInfoVO> getInfoUpdateList(String hpSeq);

	
}
