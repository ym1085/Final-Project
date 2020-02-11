package com.fp.delight.index.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IndexVisitorsServiceImpl implements IndexVisitorsService{
	
	@Autowired
	private IndexVisitorsDAO indexVisitorsDao;
	
	@Override
	public int selectSysdate(IndexVisitorsVO indexVisitorsVO) {
		return indexVisitorsDao.selectSysdate(indexVisitorsVO);
	}
	
	@Override
	public int insertSysdate(IndexVisitorsVO indexVisitorsVO) {
		return indexVisitorsDao.insertSysdate(indexVisitorsVO);
	}
	
	@Override
	public int updateSysdate(IndexVisitorsVO indexVisitorsVO) {
		return indexVisitorsDao.updateSysdate(indexVisitorsVO);
	} 
	
	@Override
	@Transactional
	public int countVisitors(IndexVisitorsVO indexVisitorsVO) {
		int cnt = indexVisitorsDao.selectSysdate(indexVisitorsVO);
		
		try {
			if(cnt==0) {
				cnt = indexVisitorsDao.insertSysdate(indexVisitorsVO);
				
			}else if(cnt==1) {
				cnt = indexVisitorsDao.updateSysdate(indexVisitorsVO);
			}
			
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
	
}
