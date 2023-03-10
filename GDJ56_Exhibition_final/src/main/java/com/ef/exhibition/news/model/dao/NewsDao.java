package com.ef.exhibition.news.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.news.model.vo.Attachment;
import com.ef.exhibition.news.model.vo.News;

public interface NewsDao {
	List<News> selectNewsList(SqlSessionTemplate session,Map<String,Integer> page);
	int selectNewsCount(SqlSessionTemplate session);
	News selectNews(SqlSessionTemplate session, int newsNo);
	int insertNews(SqlSessionTemplate session, News n);
	int insertAttachment(SqlSessionTemplate session,Attachment attachment);
	int deleteNews(SqlSessionTemplate session, int newsNo);
	int updateNews(SqlSessionTemplate session, Map news);
}
