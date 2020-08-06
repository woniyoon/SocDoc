package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.MemberVO;

@Component
@Repository
public class AdminDAO implements InterAdminDAO {

	@Resource
	private SqlSessionTemplate sqlsession;


	@Override
	public List<MemberVO> selectMemberList() {
		List<MemberVO> membervoList = sqlsession.selectList("admin.selectMemberList");
		return membervoList;
	}

/*	
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("admin.getTotalCount", paraMap);
		return totalCount;
	}

	@Override
	public List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("admin.memberListSearchWithPaging", paraMap);
		return memberList;
	}	

*/	
}
