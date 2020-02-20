package products.dto;

import java.sql.Date;

public class ProductsDTO {
	private int num;
	private String writer;
	private String subject;
	private String passwd;
	private Date reg_date;//java.sql.Date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String content;
	private String ip;
	private int comment_count;//댓글 갯수, 테이블에는 없음
	private String filename,filename1,filename2,filename3,filename4,filename5;
	private int filesize,filesize1,filesize2,filesize3,filesize4,filesize5;
	private int click;
	private String ext;//첨부파일의 확장명, 테이블에는 없음
	private String show;
	private int price;
	private int delprice;
	private int totalprice;
	private String categories;
	private String categories_detail;
	private String newproduct;
	
	
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	public String getFilename3() {
		return filename3;
	}
	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}
	public String getFilename4() {
		return filename4;
	}
	public void setFilename4(String filename4) {
		this.filename4 = filename4;
	}
	public String getFilename5() {
		return filename5;
	}
	public void setFilename5(String filename5) {
		this.filename5 = filename5;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getFilesize1() {
		return filesize1;
	}
	public void setFilesize1(int filesize1) {
		this.filesize1 = filesize1;
	}
	public int getFilesize2() {
		return filesize2;
	}
	public void setFilesize2(int filesize2) {
		this.filesize2 = filesize2;
	}
	public int getFilesize3() {
		return filesize3;
	}
	public void setFilesize3(int filesize3) {
		this.filesize3 = filesize3;
	}
	public int getFilesize4() {
		return filesize4;
	}
	public void setFilesize4(int filesize4) {
		this.filesize4 = filesize4;
	}
	public int getFilesize5() {
		return filesize5;
	}
	public void setFilesize5(int filesize5) {
		this.filesize5 = filesize5;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDelprice() {
		return delprice;
	}
	public void setDelprice(int delprice) {
		this.delprice = delprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getCategories_detail() {
		return categories_detail;
	}
	public void setCategories_detail(String categories_detail) {
		this.categories_detail = categories_detail;
	}
	public String getNewproduct() {
		return newproduct;
	}
	public void setNewproduct(String newproduct) {
		this.newproduct = newproduct;
	}
	@Override
	public String toString() {
		return "ProductsDTO [num=" + num + ", writer=" + writer + ", subject=" + subject + ", passwd=" + passwd
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", content=" + content + ", ip=" + ip + ", comment_count=" + comment_count
				+ ", filename=" + filename + ", filename1=" + filename1 + ", filename2=" + filename2 + ", filename3="
				+ filename3 + ", filename4=" + filename4 + ", filename5=" + filename5 + ", filesize=" + filesize
				+ ", filesize1=" + filesize1 + ", filesize2=" + filesize2 + ", filesize3=" + filesize3 + ", filesize4="
				+ filesize4 + ", filesize5=" + filesize5 + ", click=" + click + ", ext=" + ext + ", show=" + show
				+ ", price=" + price + ", delprice=" + delprice + ", totalprice=" + totalprice + ", categories="
				+ categories + ", categories_detail=" + categories_detail + ", newproduct=" + newproduct + "]";
	}
}