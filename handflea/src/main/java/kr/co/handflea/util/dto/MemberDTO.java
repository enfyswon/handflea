package kr.co.handflea.util.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {

	private String mem_no;
	private String mem_name;
	private String mem_email;
	private String mem_pwd;
	private String pnum;
	private String mdate;
	private String mem_photo;
	private String mem_photopath;
	private MultipartFile profile;

	private String tel1;
	private String tel2;
	private String tel3;

	private String post_code;
	private String add_1;
	private String add_2;
	
	private String seller_yn;
	private String bank_no;
	private String account_no;

	@Override
	public String toString() {
		return mem_no
		+ " : " + mem_name
		+ " : " + mem_email
		+ " : " + mem_pwd
		+ " : " + pnum
		+ " : " + mdate
		+ " : " + tel1
		+ " : " + tel2
		+ " : " + tel3
		+ " : " + post_code
		+ " : " + add_1
		+ " : " + add_2;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}

	public String getMem_photopath() {
		return mem_photopath;
	}

	public void setMem_photopath(String mem_photopath) {
		this.mem_photopath = mem_photopath;
	}

	public MultipartFile getProfile() {
		return profile;
	}

	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getAdd_1() {
		return add_1;
	}

	public void setAdd_1(String add_1) {
		this.add_1 = add_1;
	}

	public String getAdd_2() {
		return add_2;
	}

	public void setAdd_2(String add_2) {
		this.add_2 = add_2;
	}

	public String getSeller_yn() {
		return seller_yn;
	}

	public void setSeller_yn(String seller_yn) {
		this.seller_yn = seller_yn;
	}

	public String getBank_no() {
		return bank_no;
	}

	public void setBank_no(String bank_no) {
		this.bank_no = bank_no;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	
}//class
