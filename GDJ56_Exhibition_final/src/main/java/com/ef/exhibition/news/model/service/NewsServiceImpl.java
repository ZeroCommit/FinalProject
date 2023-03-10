package com.ef.exhibition.news.model.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.exhibition.news.model.dao.NewsDao;
import com.ef.exhibition.news.model.vo.Attachment;
import com.ef.exhibition.news.model.vo.News;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NewsServiceImpl implements NewsService{

	private NewsDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public NewsServiceImpl(NewsDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	//공지사항 메인 페이징처리
	@Override
	public List<News> selectNewsList(Map<String, Integer> page){
		return dao.selectNewsList(session, page);
	}
	
	//공지사항 메인 페이징처리
	@Override
	public int selectNewsCount() {
		return dao.selectNewsCount(session);
	}
	
	//공지사항 상세페이지
	@Override
	public News selectNews(int newsNo) {
//		log.debug("{}",newsNo);
		return dao.selectNews(session,newsNo);
	}

	//공지사항 작성페이지
	@Override
	@Transactional
	public int insertNews(News n) {
		log.debug("insert 전 : "+n.getNewsNo());
		int result=dao.insertNews(session,n);
		log.debug("insert 후 : "+n.getNewsNo());
		
		if(result>0&&n.getFiles().size()>0) {
			result=0;
			for(Attachment a: n.getFiles()) {
				a.setNews(n);
				result+=dao.insertAttachment(session, a);
			}
			if(result!=n.getFiles().size()) {
				throw new RuntimeException();
			}
		}else {
			//게시물 등록이 실패하면 rollbackc처리
			throw new RuntimeException("실패!");
		}
		return result;
	}

	@Override
	@Transactional
	public int deleteNews(int newsNo) {
		int result=dao.deleteNews(session,newsNo);
//		log.debug("삭제할 번호 : ",newsNo);
		return result;
	}

	@Override
	@Transactional
	public int updateNews(Map news) {
		int result=dao.updateNews(session, news);
//		log.debug("{}",result);
		return result;
	}
	
	
	
}
