package com.fp.delight.like.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeDAO likeDao;

	@Override
	public int selectLike(LikeVO likeVo) {
		return likeDao.selectLike(likeVo);
	}

	@Override
	public int selectLikeAll(String mt20id) {
		return likeDao.selectLikeAll(mt20id);
	}

	@Override
	public int deleteLike(LikeVO likeVo) {
		return likeDao.deleteLike(likeVo);
	}

	@Override
	public int insertLike(LikeVO likeVo) {
		return likeDao.insertLike(likeVo);
	}

	@Override
	public List<Map<String, Object>> selectLikeNew5List(String userid) {
		return likeDao.selectLikeNew5List(userid);
	}

	@Override
	public List<Map<String, Object>> selectLikeList2(LikeVO likeVo) {
		return likeDao.selectLikeList2(likeVo);
	}

	@Override
	public int selectTotalRecord(String userid) {
		return likeDao.selectTotalRecord(userid);
	}
	
}
