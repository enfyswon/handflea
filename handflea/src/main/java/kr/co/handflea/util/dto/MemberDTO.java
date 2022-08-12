package kr.co.handflea.util.dto;

public class MemberDTO {

	private String mem_no;
	private String mem_name;
	private String mem_email;
	private String mem_pwd;
	private String pnum;
	private String mdate;

	private String tel1;
	private String tel2;
	private String tel3;

	private String post_code;
	private String add_1;
	private String add_2;

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
	

	

	

}//class
