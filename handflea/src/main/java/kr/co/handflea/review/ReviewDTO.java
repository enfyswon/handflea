package kr.co.handflea.review;

public class ReviewDTO {
	private String review_no;
	private String mem_no;
	private String order_no;
	private String option_no;
	private String review_contents;
	private String review_photo;
	private String review_photopath;
	private String star_point;
	
	public String toString() {
		return review_no + " : " + review_photo  + " : " + review_contents + " : " + mem_no;
	}

	public String getReview_no() {
		return review_no;
	}
	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}
	
}
