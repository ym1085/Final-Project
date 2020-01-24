package com.fp.delight.ann.model;

import java.util.List;

public interface FAQDAO {
	int FAQwrite(FAQVO FAQVo);
	List<FAQVO> FAQSearch(FAQVO FAQVo);
	int faqtotal(FAQVO FAQVo);
	int faqdel(int faqSeq);
	FAQVO faqDetail(int faqSeq);
	int faqEdit(FAQVO FAQVo);
}
