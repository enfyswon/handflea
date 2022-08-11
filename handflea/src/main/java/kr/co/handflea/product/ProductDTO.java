package kr.co.handflea.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_no;
	private int mem_no;
	private String smallcate_no;
	private String product_name;
	private String product_contents;
	private int product_price;
	private int option_no;
	private int soldout_yn;
	private int delete_yn;
	
	private String bigcate_no;
	private String bigcate_name;
	private String smallcate_name;
	
	private MultipartFile thumbnail;
	private MultipartFile prdt_img;
	private MultipartFile desc_img;
	private MultipartFile add_file;
	private String thumbnail_name;
	private String thumbnail_path;
	private String prdt_img_name;
	private String prdt_img_path;
	private String desc_img_name;
	private String desc_img_path;
	private String add_file_name;
	private String add_file_path;

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
	public String getSmallcate_no() {
		return smallcate_no;
	}
	public void setSmallcate_no(String smallcate_no) {
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
	public String getBigcate_no() {
		return bigcate_no;
	}

	public void setBigcate_no(String bigcate_no) {
		this.bigcate_no = bigcate_no;
	}

	public String getBigcate_name() {
		return bigcate_name;
	}

	public void setBigcate_name(String bigcate_name) {
		this.bigcate_name = bigcate_name;
	}

	public String getSmallcate_name() {
		return smallcate_name;
	}

	public void setSmallcate_name(String smallcate_name) {
		this.smallcate_name = smallcate_name;
	}

	public MultipartFile getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}

	public MultipartFile getPrdt_img() {
		return prdt_img;
	}

	public void setPrdt_img(MultipartFile prdt_img) {
		this.prdt_img = prdt_img;
	}

	public MultipartFile getDesc_img() {
		return desc_img;
	}

	public void setDesc_img(MultipartFile desc_img) {
		this.desc_img = desc_img;
	}

	public MultipartFile getAdd_file() {
		return add_file;
	}

	public void setAdd_file(MultipartFile add_file) {
		this.add_file = add_file;
	}

	public String getThumbnail_name() {
		return thumbnail_name;
	}

	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
	}

	public String getThumbnail_path() {
		return thumbnail_path;
	}

	public void setThumbnail_path(String thumbnail_path) {
		this.thumbnail_path = thumbnail_path;
	}

	public String getPrdt_img_name() {
		return prdt_img_name;
	}

	public void setPrdt_img_name(String prdt_img_name) {
		this.prdt_img_name = prdt_img_name;
	}

	public String getPrdt_img_path() {
		return prdt_img_path;
	}

	public void setPrdt_img_path(String prdt_img_path) {
		this.prdt_img_path = prdt_img_path;
	}

	public String getDesc_img_name() {
		return desc_img_name;
	}

	public void setDesc_img_name(String desc_img_name) {
		this.desc_img_name = desc_img_name;
	}

	public String getDesc_img_path() {
		return desc_img_path;
	}

	public void setDesc_img_path(String desc_img_path) {
		this.desc_img_path = desc_img_path;
	}

	public String getAdd_file_name() {
		return add_file_name;
	}

	public void setAdd_file_name(String add_file_name) {
		this.add_file_name = add_file_name;
	}

	public String getAdd_file_path() {
		return add_file_path;
	}

	public void setAdd_file_path(String add_file_path) {
		this.add_file_path = add_file_path;
	}
	
	
}
