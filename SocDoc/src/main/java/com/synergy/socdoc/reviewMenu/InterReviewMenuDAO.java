package com.synergy.socdoc.reviewMenu;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

public interface InterReviewMenuDAO {

	List<HpInfoVO> getHpList(HashMap<String, String> paraMap);

	int getReviewMenuTotalPage(HashMap<String, String> paraMap);

	List<HpReviewVO> readReviewDetail(String hpSeq);

}
