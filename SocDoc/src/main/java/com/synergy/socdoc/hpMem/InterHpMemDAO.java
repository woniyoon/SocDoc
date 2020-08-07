package com.synergy.socdoc.hpMem;

import java.util.*;

import com.synergy.socdoc.member.HpInfoVO;

public interface InterHpMemDAO {

	public HpInfoVO getHpInfo(String hpSeq);

	public List<HpInfoVO> getInfoUpdateList(String hpSeq);

	public HpInfoVO getHpInfoDetail(String submitId);

	public List<HashMap<String, String>> getScheduleTbl(String submitId);

}
