package com.synergy.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.NoticeVO;

@Repository
public class TestDAO implements InterDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public String getContent() {
		String content = sqlsession.selectOne("test.getContent");
		return content;
	}

	// 공지사항 최근 3개 글목록 불러오기
	@Override
	public List<NoticeVO> selectNoticeList() {
		List<NoticeVO> noticevoList = sqlsession.selectList("test.selectNoticeList");
		return noticevoList;
	}
	
	// 병원 평점순위 별 리스트 보여주기
	@Override
	public List<HpReviewVO> getRankList() {
		List<HpReviewVO> hpRankList = sqlsession.selectList("test.getRankList");
		return hpRankList;
	}

}
