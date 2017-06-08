package org.bong.domain;

import java.sql.Timestamp;

public class ReplyVO {
	private int rno;
	private String rcontent;
	private String writer;
	private Timestamp regdate;
	private Timestamp updatedate;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", rcontent=" + rcontent + ", writer=" + writer + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + "]";
	}
	
	
}
