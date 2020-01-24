package com.fp.delight.ann.model;

import java.util.List;

public class FAQListVO {
	private List<FAQVO> faqList;

	public List<FAQVO> getFaqList() {
		return faqList;
	}

	public void setFaqList(List<FAQVO> faqList) {
		this.faqList = faqList;
	}

	@Override
	public String toString() {
		return "FAQListVO [faqList=" + faqList + "]";
	}
	
	
}
