package kr.co.handflea.order;

public class OrderDTO {
	private String order_no;
	private String mem_no;
	private String prdt_no;
	private String pay_info;
	private String delivery_c_no;
	private String delivery_no;
	private String prdt_con;
	private String delivery_yn;
	private int buy_qty;
	private String option_no;
	
	private String prdt_name;
	private String option_contents;
	private int price;
	private int delivery_price;
	private String thumbnail_name;
	private String thumbnail_path;
	private int total_price;
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getPrdt_no() {
		return prdt_no;
	}
	public void setPrdt_no(String prdt_no) {
		this.prdt_no = prdt_no;
	}
	public String getPay_info() {
		return pay_info;
	}
	public void setPay_info(String pay_info) {
		this.pay_info = pay_info;
	}
	public String getDelivery_c_no() {
		return delivery_c_no;
	}
	public void setDelivery_c_no(String delivery_c_no) {
		this.delivery_c_no = delivery_c_no;
	}
	public String getDelivery_no() {
		return delivery_no;
	}
	public void setDelivery_no(String delivery_no) {
		this.delivery_no = delivery_no;
	}
	public String getPrdt_con() {
		return prdt_con;
	}
	public void setPrdt_con(String prdt_con) {
		this.prdt_con = prdt_con;
	}
	public String getDelivery_yn() {
		return delivery_yn;
	}
	public void setDelivery_yn(String delivery_yn) {
		this.delivery_yn = delivery_yn;
	}
	public int getBuy_qty() {
		return buy_qty;
	}
	public void setBuy_qty(int buy_qty) {
		this.buy_qty = buy_qty;
	}
	public String getOption_no() {
		return option_no;
	}
	public void setOption_no(String option_no) {
		this.option_no = option_no;
	}
	public String getPrdt_name() {
		return prdt_name;
	}
	public String getOption_contents() {
		return option_contents;
	}
	public void setOption_contents(String option_contents) {
		this.option_contents = option_contents;
	}
	public void setPrdt_name(String prdt_name) {
		this.prdt_name = prdt_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDelivery_price() {
		return delivery_price;
	}
	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
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
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
}
