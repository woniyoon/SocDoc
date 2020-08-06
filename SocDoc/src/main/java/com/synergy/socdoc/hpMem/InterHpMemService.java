package com.synergy.socdoc.hpMem;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.HpInfoVO;

@Service
public interface InterHpMemService {

	public HpInfoVO getHpInfo(String hpSeq);

	public List<HpInfoVO> getInfoUpdateList(String hpSeq);

	// 병원 정보 관리에서 행을 클릭했을 때 구체적인 정보를 가져옴
	public HpInfoVO getHpInfoDetail(String submitId);

	
}
