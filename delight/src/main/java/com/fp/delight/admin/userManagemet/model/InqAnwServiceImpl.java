package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fp.delight.common.SearchVO;

@Service
public class InqAnwServiceImpl implements InqAnwService{
	
	@Autowired
	private InqAnwDAO inqAnwDao;

	@Override
	public List<Map<String, Object>> adminInqSel(SearchVO searchVo) {
		return inqAnwDao.adminInqSel(searchVo);
	}

	@Override
	public int adminInqSelTotal(SearchVO searchVo) {
		return inqAnwDao.adminInqSelTotal(searchVo);
	}

	@Override
	public Map<String, Object> inqDetail(int inqSeq) {
		return inqAnwDao.inqDetail(inqSeq);
	}

	@Override
	@Transactional
	public int anwComplanw(InqAnwVO inqAnwVo) {
		int inqSeq=inqAnwVo.getInquerySeq();
		
		int cnt=0;
		try {
			cnt=inqAnwDao.anwCompl(inqSeq);
			cnt=inqAnwDao.inqanwWrite(inqAnwVo);
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

	@Override
	public int anwCk(int inqSeq) {
		return inqAnwDao.anwCk(inqSeq);
	}

	

	
}
