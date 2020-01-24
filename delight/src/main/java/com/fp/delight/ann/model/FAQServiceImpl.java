package com.fp.delight.ann.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FAQServiceImpl implements FAQService{
	
	@Autowired
	private FAQDAO FAQDao;

	@Override
	public int FAQwrite(FAQVO FAQVo) {
		return FAQDao.FAQwrite(FAQVo);
	}

	@Override
	public List<FAQVO> faqSearch(FAQVO FAQVo) {
		return FAQDao.FAQSearch(FAQVo);
	}

	@Override
	public int faqtotal(FAQVO FAQVo) {
		return FAQDao.faqtotal(FAQVo);
	}

	@Override
	public int faqdel(int faqSeq) {
		return FAQDao.faqdel(faqSeq);
	}

	@Override
	@Transactional
	public int faqMultiDel(List<FAQVO> faqList) {
		int cnt=0;
		try {
			for(FAQVO vo: faqList) {
				int faqSeq=vo.getFaqSeq();
				if(faqSeq!=0) {
					cnt=FAQDao.faqdel(faqSeq);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}

	@Override
	public FAQVO faqDetail(int faqSeq) {
		return FAQDao.faqDetail(faqSeq);
	}

	@Override
	public int faqEdit(FAQVO FAQVo) {
		return FAQDao.faqEdit(FAQVo);
	}
	
	
	
}
