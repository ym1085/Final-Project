package com.fp.delight.ann.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
	
}
