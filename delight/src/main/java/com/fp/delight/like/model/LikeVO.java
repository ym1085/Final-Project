package com.fp.delight.like.model;

import com.fp.delight.common.SearchVO;

public class LikeVO extends SearchVO{
	private int likeCountSeq;
	private String mt20id;
	private String userid;
	private String genre;
	private String prfnm;
	public int getLikeCountSeq() {
		return likeCountSeq;
	}
	public void setLikeCountSeq(int likeCountSeq) {
		this.likeCountSeq = likeCountSeq;
	}
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	@Override
	public String toString() {
		return "LikeVO [likeCountSeq=" + likeCountSeq + ", mt20id=" + mt20id + ", userid=" + userid + ", genre=" + genre
				+ ", prfnm=" + prfnm + "]";
	}
	
	
	
	
}
