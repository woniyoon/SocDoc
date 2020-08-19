package com.synergy.socdoc.center.service;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.QnaBoardVO;

public interface InterCenterService {

	List<HashMap<String, String>> faqSelect();

	int inquiryAdd(QnaBoardVO qvo);

}
