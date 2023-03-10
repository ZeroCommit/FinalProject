package com.ef.exhibition.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectMemberById(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberById",m);
	}
	
	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertMember",m);
	}
	
	// 아이디 중복 확인
	@Override
    public Member idcheck(SqlSession session, Member m) {
    	// TODO Auto-generated method stub
    	return session.selectOne("member.idcheck",m);
    }
	
//	// 아이디 중복 확인
//	
//	  @Override public Member idDupicate(String memberId, SqlSessionTemplatesession) {
//		  return session.selectOne("member.idDuplicate",memberId); 
//	  }
	 
	
	
	// 아이디 찾기
	@Override
	public Member findId(SqlSessionTemplate session,Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.findId",m);
	}
	// 비밀번호 찾기
    @Override
    public Member findPw(SqlSessionTemplate session,Map param) {
    	// TODO Auto-generated method stub
    	return session.selectOne("member.findPw",param);
    }

    
    
    // 비밀번호 변경 이메일 인증번호
    @Override
    public int pwChange(SqlSessionTemplate session,Map param) {
    	return session.update("member.pwChange",param);
    }
    
    // Myprovider 진행

}
