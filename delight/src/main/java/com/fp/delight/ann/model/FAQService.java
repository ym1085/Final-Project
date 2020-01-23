package com.fp.delight.ann.model;

import java.util.List;

public interface FAQService {
	int FAQwrite(FAQVO FAQVo);
	List<FAQVO> faqSearch(FAQVO FAQVo);
	int faqtotal(FAQVO FAQVo);
	int faqdel(int faqSeq);
}
