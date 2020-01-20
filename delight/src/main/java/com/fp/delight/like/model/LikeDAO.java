package com.fp.delight.like.model;

public interface LikeDAO {
	int selectLike(LikeVO likeVo);
	int selectLikeAll(String mt20id);
	int deleteLike(LikeVO likeVo);
	int insertLike(LikeVO likeVo);
}
