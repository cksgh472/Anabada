package products.dto;

import java.util.Date;

public class ProductsCommentDTO {
	private int comment_num; 
	private int usersell_num; 
	private String writer;
	private String content;
	private Date reg_date;//java.util.Date
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getUsersell_num() {
		return usersell_num;
	}
	public void setUsersell_num(int usersell_num) {
		this.usersell_num = usersell_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}