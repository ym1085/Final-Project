package com.fp.delight.ann.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AnnServiceImpl implements AnnService{

	@Autowired
	private AnnDAO annDao;
	
	@Override
	public int annInsert(AnnVO annVo) {
		return annDao.annInsert(annVo);
	}

	@Override
	public List<AnnVO> annList(AnnVO annVo) {
		return annDao.annList(annVo);
	}

	@Override
	public int normalTotal(AnnVO annVo) {
		return annDao.normalTotal(annVo);
	}

	@Override
	public List<AnnVO> eventSearch(AnnVO annVo) {
		return annDao.eventSearch(annVo);
	}

	@Override
	public int eventTotal(AnnVO annVo) {
		return annDao.eventTotal(annVo);
	}

	@Override
	@Transactional
	public int annMultiDel(List<AnnVO> list) {
		int cnt=0;
		try {
			for(AnnVO vo : list) {
				int annSeq=vo.getAnnSeq();
				if(annSeq!=0) {
					cnt=annDao.normalDel(annSeq);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
		
		
		
	}

	@Override
	@Transactional
	public int annMultiExpo(List<AnnVO> list) {
		int cnt=0;
		try {
			for(AnnVO vo : list) {
				int annSeq=vo.getAnnSeq();
				if(annSeq!=0) {
					cnt=annDao.annExposure(annSeq);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int annUnExposure(List<AnnVO> list) {
		int cnt=0;
		try {
			for(AnnVO vo : list) {
				int annSeq=vo.getAnnSeq();
				if(annSeq!=0) {
					cnt=annDao.annUnExposure(annSeq);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

	@Override
	public AnnVO selAnnBySeq(int annSeq) {
		return annDao.selAnnBySeq(annSeq);
	}

	@Override
	public int anntopchk(String annType) {
		return annDao.anntopchk(annType);
	}

	@Override
	public AnnVO anntopinfo(String annType) {
		return annDao.anntopinfo(annType);
	}

	@Override
	public int topSetting(int annSeq) {
		return annDao.topSetting(annSeq);
	}

	@Override
	public int unTopSetting(int annSeq) {
		return annDao.unTopSetting(annSeq);
	}

	@Override
	public int annExpo(int annSeq) {
		return annDao.annExposure(annSeq);
	}

	@Override
	public int annUnExpo(int annSeq) {
		return annDao.annUnExposure(annSeq);
	}

}
