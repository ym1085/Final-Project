package com.fp.delight.ann.model;

import java.util.List;

public class AnnListVO {
	private List<AnnVO> annList;

	public List<AnnVO> getAnnList() {
		return annList;
	}

	public void setAnnList(List<AnnVO> annList) {
		this.annList = annList;
	}

	@Override
	public String toString() {
		return "AnnListVO [annList=" + annList + "]";
	}
	
	
}
