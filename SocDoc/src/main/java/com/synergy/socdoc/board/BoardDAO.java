package com.synergy.socdoc.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.NoticeVO;


@Repository
public class BoardDAO implements InterBoardDAO {
		
	@Autowired
	private SqlSessionTemplate sqlsession;
	/*
	// 총 게시물 건수(totalCount) 구하기 (검색조건이 있을 때와 없을 때로 나뉘어진다.)	
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("board.getTotalCount", paraMap);
		return 0;
	}
	
	// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	@Override
	public List<NoticeVO> boardListSearchWithPaging(HashMap<String, String> paraMap) {
		List<NoticeVO> boardList = sqlsession.selectList("board.boardListSearchWithPaging",paraMap);
		return boardList;
	}
	*/
	
	
	
	
	// 게시물 목록 조회
	@Override
	public List<NoticeVO> noticeList(){
	
		return sqlsession.selectList("board.noticeList");

	}

}
