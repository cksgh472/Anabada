package member;

import java.sql.Date;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private String hp;
	private String birthday;
	private String addr1;
	private String addr2;
	private String addr3;
	private Date join_date;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", hp="
				+ hp + ", birthday=" + birthday + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3
				+ ", join_date=" + join_date + "]";
	}
	
	public MemberDTO() {
	}
	
	public MemberDTO(String userid, String passwd, String name, String email, String hp, String birthday, String addr1,
			String addr2, String addr3, Date join_date) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.hp = hp;
		this.birthday = birthday;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.join_date = join_date;
	}
}