package com.synergy.socdoc.reviewMenu;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;

public interface InterReviewMenuService {

	List<HpInfoVO> getHpList(HashMap<String, String> paraMap);

}
