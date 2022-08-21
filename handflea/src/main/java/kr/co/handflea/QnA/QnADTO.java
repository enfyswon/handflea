package kr.co.handflea.QnA;

public class QnADTO {

	private String QnA_no;
	private String title;
	private String mem_no;
	private String mid;
	private String contents;
	private String view_cnt;
	private String write_date;
	public String getQnA_no() {
		
		
		return QnA_no;
	}
	public void setQnA_no(String qnA_no) {
		QnA_no = qnA_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

}
