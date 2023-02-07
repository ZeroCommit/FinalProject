package com.ef.exhibition.exh.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ef.exhibition.exh.model.vo.Exhibition;

@Repository
public class ExhibitionDaoImpl implements ExhibitionDao{

	@Override
	public int insertExh(SqlSessionTemplate session, Exhibition exh) {
		return session.insert("exh.insertExh",exh);
	}

	@Override
	public List<Exhibition> selectExhList(SqlSessionTemplate session, Map<String, Integer> page) {
		return session.selectList("exh.selectExhList",null, 
				new RowBounds(
						(page.get("cPage")-1)*page.get("numPerpage"),
						page.get("numPerpage")));
	}

	@Override
	public int selectExhCount(SqlSessionTemplate session) {
		return session.selectOne("exh.selectExhCount");
	}

	@Override
	public Exhibition selectExh(SqlSessionTemplate session, int exNo) {
		return session.selectOne("exh.selectExh",exNo);
	}
	
	
//	// 좋아요 증가
//	public int increaseLike(Map<String, Object> map) {
//		return sqlSession.insert("exhMapper.increaseLike", map);
//	}
//
//	// 좋아요 감소
//	public int decreaseLike(Map<String, Object> map) {
//		return sqlSession.delete("exhMapper.decreaseLike", map);
//	}
//	
//	// 좋아요 여부 확인
//	public int selectLikePushed(Map<String, Integer> map) {
//		return sqlSession.selectOne("exhMapper.selectLikePushed", map);
//	}
	
	
}
