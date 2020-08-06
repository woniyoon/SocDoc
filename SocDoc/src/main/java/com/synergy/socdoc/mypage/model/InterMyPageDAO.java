package com.synergy.socdoc.mypage.model;

import java.util.HashMap;
import java.util.List;

import com.synergy.socdoc.member.QnaBoardVO;

public interface InterMyPageDAO {

	int getTotalCount(HashMap<String, String> paraMap); // 총 게시물 건수(totalCount)를 구하기(검색이 있을때와 검색이 없을때로 나뉜다.)

	List<QnaBoardVO> boardListSearchWithPaging(HashMap<String, String> paraMap); // 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한것)

	QnaBoardVO getView(String qnaSeq); // 글1개를 보여주기

	int deleteBoard(HashMap<String, String> paraMap); // 글을 삭제한다.



}
