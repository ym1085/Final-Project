package com.fp.delight.ann.model;

import java.util.List;

public interface AnnService {
	int annInsert(AnnVO annVo);
	List<AnnVO> annList(AnnVO annVo);
	int normalTotal(AnnVO annVo);
	List<AnnVO> eventSearch(AnnVO annVo);
	int eventTotal(AnnVO annVo);
}
