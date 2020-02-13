package com.fp.delight.index.model;

public interface IndexVisitorsService {
	
	int selectSysdate(IndexVisitorsVO indexVisitorsVO);
	int insertSysdate(IndexVisitorsVO indexVisitorsVO);
	int updateSysdate(IndexVisitorsVO indexVisitorsVO);
	int countVisitors(IndexVisitorsVO indexVisitorsVO);
}


