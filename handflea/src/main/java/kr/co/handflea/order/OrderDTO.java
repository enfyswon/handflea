package kr.co.handflea.order;

public class OrderDTO {

	private String order_no;
	private String mem_no;
	private String prdt_no;
	private String pay_info;
	private String delivery_c_no;
	private String delivery_no;
	private String product_con;
	private String delivery_yn;
	private String buy_qty;
	private String option_no;
		
		@Override
		public String toString() {
			return order_no
				+ " : " +mem_no
				+ " : " +prdt_no
				+ " : " +pay_info
				+ " : " +delivery_c_no
				+ " : " +delivery_no
				+ " : " +product_con
				+ " : " +delivery_yn
				+ " : " +buy_qty
				+ " : " +option_no
				+ " : " +mem_no;
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
	public String getProduct_con() {
		return product_con;
	}
	public void setProduct_con(String product_con) {
		this.product_con = product_con;
	}
	public String getDelivery_yn() {
		return delivery_yn;
	}
	public void setDelivery_yn(String delivery_yn) {
		this.delivery_yn = delivery_yn;
	}
	public String getBuy_qty() {
		return buy_qty;
	}
	public void setBuy_qty(String buy_qty) {
		this.buy_qty = buy_qty;
	}
	public String getOption_no() {
		return option_no;
	}
	public void setOption_no(String option_no) {
		this.option_no = option_no;
	}
	public Object getArr_cart_no() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getArr_basket_no() {
		// TODO Auto-generated method stub
		return null;

	}
	
	

}
