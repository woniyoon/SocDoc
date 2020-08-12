package com.synergy.socdoc.hpMem;

import java.util.*;

import com.synergy.socdoc.member.HpInfoVO;

public interface InterHpMemDAO {

	public HpInfoVO getHpInfo(String hpSeq);

	public List<HpInfoVO> getInfoUpdateList(HashMap<String, String> paraMap);

	public HpInfoVO getHpInfoDetail(String submitId);

	public List<HashMap<String, String>> getScheduleTbl(String submitId);

	public List<HashMap<String, String>> getOpeningHours(String hpSeq);

	public List<HashMap<String, String>> getRecentReviews(String hpSeq);

	public List<HashMap<String, String>> getVisitors(HashMap<String, String> paraMap);

	public int getNumOfVisitors(HashMap<String, String> paraMap);

	public int submitInfo(HpInfoVO hpInfoVO);

	public int submitSchedule(List<HashMap<String, String>> scheduleList);

	public int getNumOfUpdates(String hpSeq);

}
