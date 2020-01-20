package com.fp.delight.like.model;

public class LikeVO {
	private int likeCountSeq;
	private String mt20id;
	private String userid;
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
	@Override
	public String toString() {
		return "LikeVO [likeCountSeq=" + likeCountSeq + ", mt20id=" + mt20id + ", userid=" + userid + "]";
	}
	
	
}
