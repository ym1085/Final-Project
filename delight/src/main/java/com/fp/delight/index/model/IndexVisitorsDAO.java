package com.fp.delight.index.model;

public interface IndexVisitorsDAO {
	
	int selectSysdate(IndexVisitorsVO indexVisitorsVO);	//오늘날짜 검색
	int insertSysdate(IndexVisitorsVO indexVisitorsVO);	
	int updateSysdate(IndexVisitorsVO indexVisitorsVO);	
}


