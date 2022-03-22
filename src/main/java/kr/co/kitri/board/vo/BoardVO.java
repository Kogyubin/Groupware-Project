package kr.co.kitri.board.vo;

import java.util.Date;

public class BoardVO {
	private int board_no;
	private String title;
	private String content;
	private int emp_no;
	private Date bo_regdate;
	private int visit_cnt;
	private String file_yn;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public Date getBo_regdate() {
		return bo_regdate;
	}
	public void setBo_regdate(Date bo_regdate) {
		this.bo_regdate = bo_regdate;
	}
	public int getVisit_cnt() {
		return visit_cnt;
	}
	public void setVisit_cnt(int visit_cnt) {
		this.visit_cnt = visit_cnt;
	}
	public String getFile_yn() {
		return file_yn;
	}
	public void setFile_yn(String file_yn) {
		this.file_yn = file_yn;
	}
	
}
