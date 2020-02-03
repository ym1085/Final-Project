package com.fp.delight.admin.userManagemet.model;

import java.util.List;

public class ReviewListVO {
	List<Integer> reviewSeqList;

	public List<Integer> getReviewSeqList() {
		return reviewSeqList;
	}

	public void setReviewSeqList(List<Integer> reviewSeqList) {
		this.reviewSeqList = reviewSeqList;
	}

	@Override
	public String toString() {
		return "ReviewListVO [reviewSeqList=" + reviewSeqList + "]";
	}
	
}
