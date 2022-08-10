package kr.co.handflea.product;

public class ProductDTO {
	private int product_no;
	private int mem_no;
	private int smallcate_no;
	private String product_name;
	private String product_contents;
	private int product_price;
	private int option_no;
	private int soldout_yn;
	private int delete_yn;
	
	@Override
	public String toString() {
		return product_no
				+ " : " + mem_no
				+ " : " + smallcate_no
				+ " : " + product_name
				+ " : " + product_contents
				+ " : " + product_price
				+ " : " + option_no
				+ " : " + soldout_yn
				+ " : " + delete_yn;
	}
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getSmallcate_no() {
		return smallcate_no;
	}
	public void setSmallcate_no(int smallcate_no) {
		this.smallcate_no = smallcate_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_contents() {
		return product_contents;
	}
	public void setProduct_contents(String product_contents) {
		this.product_contents = product_contents;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public int getSoldout_yn() {
		return soldout_yn;
	}
	public void setSoldout_yn(int soldout_yn) {
		this.soldout_yn = soldout_yn;
	}
	public int getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(int delete_yn) {
		this.delete_yn = delete_yn;
	}
	
	
}
