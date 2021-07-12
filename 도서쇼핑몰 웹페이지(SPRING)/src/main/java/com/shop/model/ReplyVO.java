package com.shop.model;

import java.util.Date;

public class ReplyVO {
	private int replyno;
	private int boardid;
	private String replytext;
	private String replywriter;
	private Date regdate;
	private Date update_date;
	
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public int getBoardid() {
		return boardid;
	}
	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplywriter() {
		return replywriter;
	}
	public void setReplywriter(String replywriter) {
		this.replywriter = replywriter;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyno=" + replyno + ", boardid=" + boardid + ", replytext=" + replytext + ", replywriter="
				+ replywriter + ", regdate=" + regdate + ", update_date=" + update_date + "]";
	}

	
}
