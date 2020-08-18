package com.synergy.socdoc.center.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.QnaBoardVO;

public interface InterCenterDAO {

	List<HashMap<String, String>> faqSelect();

	int inquiryAdd(QnaBoardVO qvo);

}
