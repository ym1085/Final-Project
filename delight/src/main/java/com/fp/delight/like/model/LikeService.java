package com.fp.delight.like.model;

import java.util.List;
import java.util.Map;

public interface LikeService {
	int selectLike(LikeVO likeVo);
	int selectLikeAll(String mt20id);
	int deleteLike(LikeVO likeVo);
	int insertLike(LikeVO likeVo);
	List<Map<String, Object>> selectLikeNew5List(String userid);
	List<Map<String, Object>> selectLikeList2(LikeVO likeVo);
	int selectTotalRecord(String userid);
}
