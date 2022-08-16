package kr.co.handflea.review;

public class ReviewDTO {
	private String review_no;
	private String mem_no;
	private String order_no;
	private String review_contents;
	private String review_photo;
	private String review_photopath;
	private String star_point;
	private String reg_date;
	
	public String toString() {
		return review_no + " : " + review_photo  + " : " + review_contents + " : " + mem_no;
	}

	public String getReview_no() {
		return review_no;
	}
	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public String getReview_photo() {
		return review_photo;
	}

	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}

	public String getReview_photopath() {
		return review_photopath;
	}

	public void setReview_photopath(String review_photopath) {
		this.review_photopath = review_photopath;
	}

	public String getStar_point() {
		return star_point;
	}

	public void setStar_point(String star_point) {
		this.star_point = star_point;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
