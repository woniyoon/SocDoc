package com.synergy.socdoc.hpMem;

import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;

public interface InterHpMemDAO {

	public HpInfoVO getHpInfo(String hpSeq);

	public List<HpInfoVO> getInfoUpdateList(String hpSeq);

}
