package com.fp.delight.like.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAOMybatis implements LikeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.like.";

	@Override
	public int selectLike(LikeVO likeVo) {
		return sqlSession.selectOne(namespace+"selectLike",likeVo);
	}

	@Override
	public int selectLikeAll(String mt20id) {
		return sqlSession.selectOne(namespace+"selectLikeAll",mt20id);
	}

	@Override
	public int deleteLike(LikeVO likeVo) {
		return sqlSession.delete(namespace+"deleteLike",likeVo);
	}

	@Override
	public int insertLike(LikeVO likeVo) {
		return sqlSession.insert(namespace+"insertLike",likeVo);
	}

	@Override
	public List<Map<String, Object>> selectLikeNew5List(String userid) {
		return sqlSession.selectList(namespace+"selectLikeNew5List",userid);
	}

	@Override
	public List<Map<String, Object>> selectLikeList2(LikeVO likeVo) {
		return sqlSession.selectList(namespace+"selectLikeList2",likeVo);
	}

	@Override
	public int selectTotalRecord(String userid) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",userid);
	}


	
}
