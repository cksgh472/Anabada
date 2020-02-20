package products;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import page.Pager;
import products.dao.ProductsDAO;
import products.dto.ProductsCommentDTO;
import products.dto.ProductsDTO;

public class ProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws 
	ServletException, IOException {
		//클라이언트에서 요청한 주소
		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		ProductsDAO dao=new ProductsDAO();
		if(url.indexOf("list.do") != -1) {
				String categories="All";
				String categories_detail="전체상품";
				String page="";
				int count=0;
				String newproduct="";
				System.out.println(request.getParameter("check"));
				if(request.getParameter("check")!=null) {
					page="/project/sell_list_new.jsp";         
					count=dao.countnew();
					newproduct="y";
				}else{
					page="/project/sell_list.jsp";
					count=dao.count();
				}
				int curPage=1;
				if(request.getParameter("curPage") != null) {
					curPage=Integer.parseInt(request.getParameter("curPage"));
				}
				Pager pager=new Pager(count, curPage);
				int start=pager.getPageBegin();
				int end=pager.getPageEnd();
				List<ProductsDTO> list=dao.list(start,end,newproduct);
				request.setAttribute("list", list);
				request.setAttribute("categories", categories);
				request.setAttribute("categories_detail", categories_detail);
				request.setAttribute("page", pager);
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else if(url.indexOf("cate.do") != -1) {
			//레코드 갯수 계산
				String categories = request.getParameter("categories");
			    String categories_detail = request.getParameter("categories_detail");
				int count=dao.countcate(categories_detail);
				int curPage=1;
				if(request.getParameter("curPage") != null) {
					curPage=Integer.parseInt(request.getParameter("curPage"));
				}
				Pager pager=new Pager(count, curPage);
				int start=pager.getPageBegin();
				int end=pager.getPageEnd();
				List<ProductsDTO> list=dao.listcate(start,end,categories_detail);
				request.setAttribute("list", list);
				request.setAttribute("categories", categories);
				request.setAttribute("categories_detail", categories_detail);
				//페이지 네비게이션 출력을 위한 정보전달
				request.setAttribute("page", pager);
				String page="/project/sell_list.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
		}else if(url.indexOf("insert.do") != -1) {
			//파일업로드 처리
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			MultipartRequest multi=new MultipartRequest(request,Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8",
					new DefaultFileRenamePolicy());
			//request.getParameter대신 multi.getParameter로 바꿔야함.
			//MultipartRequest를 쓰는 순간 request객체가 확장됨
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String categories=multi.getParameter("categories");
			String categories_detail=multi.getParameter("categories_detail");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소
			String price=multi.getParameter("price");
			String delprice=multi.getParameter("delprice");
			String totalprice=multi.getParameter("totalprice");
			String newproduct=multi.getParameter("new");
			String filename=" ";//공백 1개
			String filename1=" ";
			String filename2=" ";
			String filename3=" ";
			String filename4=" ";
			String filename5=" ";
			int filesize=0,filesize1=0,filesize2=0,filesize3=0,filesize4=0,filesize5=0;
			try {
				//첨부파일의 집합
				
					  Enumeration filessize=multi.getFileNames();//파일이름을 가져옴
						//다음 요소가 있으면
					    ArrayList<String> filelist = new ArrayList<>();
					    while(filessize.hasMoreElements()) {
					    	String file=(String)filessize.nextElement();
					    	filelist.add(multi.getFilesystemName(file));
					    }
					    int i=filelist.size()-1;
					    Enumeration files=multi.getFileNames();//파일이름을 가져옴
						while(files.hasMoreElements()) {
							//첨부파일의 이름
							String file=(String)files.nextElement();
							if(i == 0){
								filename=multi.getFilesystemName(file);
								File f0=multi.getFile(file);
							if(f0 != null) {
								filesize=(int)f0.length();//파일 사이즈 저장
							}
							}else if(i == 1) {
								filename1=multi.getFilesystemName(file);
								File f1=multi.getFile(file);
								
							if(f1 != null) {
								filesize1=(int)f1.length();//파일 사이즈 저장
							}
							}else if(i == 2) {
								filename2=multi.getFilesystemName(file);
								File f2=multi.getFile(file);
								
							if(f2 != null) {
								filesize2=(int)f2.length();//파일 사이즈 저장
							}
							}else if(i == 3) {
								filename3=multi.getFilesystemName(file);
								File f3=multi.getFile(file);
							if(f3 != null) {
								filesize3=(int)f3.length();//파일 사이즈 저장
							}
							}else if(i == 4) {
								filename4=multi.getFilesystemName(file);
								File f4=multi.getFile(file);
							if(f4 != null) {
								filesize4=(int)f4.length();//파일 사이즈 저장
							}
							}else if(i == 5) {
								filename5=multi.getFilesystemName(file);
								File f5=multi.getFile(file);
							if(f5 != null) {
								filesize5=(int)f5.length();//파일 사이즈 저장
							}
							}
							i--;
						}
			} catch (Exception e) {
				e.printStackTrace();
			}
			ProductsDTO dto=new ProductsDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			dto.setPrice(Integer.parseInt(price));
			dto.setDelprice(Integer.parseInt(delprice));
			dto.setTotalprice(Integer.parseInt(totalprice));
			dto.setCategories(categories);
			dto.setCategories_detail(categories_detail);
			if(newproduct != null) {newproduct="y";}else{newproduct="n";}
			dto.setNewproduct(newproduct);
			//파일 첨부를 하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			/*
			 * String filetest[]=
			 * {filename,filename1,filename2,filename3,filename4,filename5}; for(String test
			 * : filetest) { if(test == null || test.trim().equals("")) { test="-"; } }
			 */
		    if(filename == null || filename.trim().equals("")) {filename="-";}
			if(filename1 == null || filename1.trim().equals("")) {filename1="-";}
			if(filename2 == null || filename2.trim().equals("")) {filename2="-";}
			if(filename3 == null || filename3.trim().equals("")) {filename3="-";}
			if(filename4 == null || filename4.trim().equals("")) {filename4="-";}
			if(filename5 == null || filename5.trim().equals("")) {filename5="-";}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			dto.setFilename1(filename1);
			dto.setFilesize1(filesize1);
			dto.setFilename2(filename2);
			dto.setFilesize2(filesize2);
			dto.setFilename3(filename3);
			dto.setFilesize3(filesize3);
			dto.setFilename4(filename4);
			dto.setFilesize4(filesize4);
			dto.setFilename5(filename5);
			dto.setFilesize5(filesize5);
			dao.insert(dto);
			String page="/project/allproduct.jsp";
			response.sendRedirect(contextPath+page);
			
		}else if(url.indexOf("click.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			dao.plusClick(num, session);
			String page="/project/allproduct.jsp";
			response.sendRedirect(contextPath+page);
			
		}else if(url.indexOf("view.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가 처리
			dao.plusReadCount(num, session);
			ProductsDTO dto=dao.viewReplace(num);
			request.setAttribute("dto", dto);
			String page="/project/selldetail.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("commentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호:"+num);
			//댓글 목록 리턴
			List<ProductsCommentDTO> list=dao.commentList(num);
			request.setAttribute("list", list);
			//출력 페이지 이동
			String page="/project/comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("comment_add.do") != -1) {
			ProductsCommentDTO dto=new ProductsCommentDTO();
			//게시물 번호
			int usersell_num=Integer.parseInt(request.getParameter("usersell_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setUsersell_num(usersell_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 page이동이 불필요
		}else if(url.indexOf("reply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			ProductsDTO dto=dao.view(num);
			dto.setContent("===게시물의 내용===\n"+dto.getContent());
			request.setAttribute("dto", dto);
			String page="/products/reply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("pass_check.do") != -1) {
			//게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("passcheck:" +num);
			//비밀번호
			String passwd=request.getParameter("passwd");
			//비번 check
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/project/selldetail_edit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 틀리면
				page=contextPath+"/products_servlet/view.do?num="
			+num+"&message=error";
				response.sendRedirect(page);
			}//else
		}else if(url.indexOf("update.do") != -1) {
			//파일업로드 처리
			//디렉토리가 없으면 생성
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", 
					new DefaultFileRenamePolicy());
			//request.getParameter대신 multi.getParameter로 바꿔야함.
			//MultipartRequest를 쓰는 순간 request객체가 확장됨
			int num=Integer.parseInt(multi.getParameter("num"));
			System.out.println("update cont"+num);
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String categories=multi.getParameter("categories");
			String categories_detail=multi.getParameter("categories_detail");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소
			String price=multi.getParameter("price");
			String delprice=multi.getParameter("delprice");
			String totalprice=multi.getParameter("totalprice");
			String newproduct=multi.getParameter("new");
			String filename=" ";//공백 1개
			String filename1=" ";
			String filename2=" ";
			String filename3=" ";
			String filename4=" ";
			String filename5=" ";
			int filesize=0,filesize1=0,filesize2=0,filesize3=0,filesize4=0,filesize5=0;
			try {
				//첨부파일의 집합
				Enumeration filessize=multi.getFileNames();//파일이름을 가져옴
				//다음 요소가 있으면
			    ArrayList<String> filelist = new ArrayList<>();
			    while(filessize.hasMoreElements()) {
			    	String file=(String)filessize.nextElement();
			    	filelist.add(multi.getFilesystemName(file));
			    }
			    int i=filelist.size()-1;
			    Enumeration files=multi.getFileNames();//파일이름을 가져옴
				while(files.hasMoreElements()) {
					//첨부파일의 이름
					String file=(String)files.nextElement();
					if(i == 0){
						filename=multi.getFilesystemName(file);
						File f0=multi.getFile(file);
					if(f0 != null) {
						filesize=(int)f0.length();//파일 사이즈 저장
					}
					}else if(i == 1) {
						filename1=multi.getFilesystemName(file);
						File f1=multi.getFile(file);
						
					if(f1 != null) {
						filesize1=(int)f1.length();//파일 사이즈 저장
					}
					}else if(i == 2) {
						filename2=multi.getFilesystemName(file);
						File f2=multi.getFile(file);
						
					if(f2 != null) {
						filesize2=(int)f2.length();//파일 사이즈 저장
					}
					}else if(i == 3) {
						filename3=multi.getFilesystemName(file);
						File f3=multi.getFile(file);
					if(f3 != null) {
						filesize3=(int)f3.length();//파일 사이즈 저장
					}
					}else if(i == 4) {
						filename4=multi.getFilesystemName(file);
						File f4=multi.getFile(file);
					if(f4 != null) {
						filesize4=(int)f4.length();//파일 사이즈 저장
					}
					}else if(i == 5) {
						filename5=multi.getFilesystemName(file);
						File f5=multi.getFile(file);
					if(f5 != null) {
						filesize5=(int)f5.length();//파일 사이즈 저장
					}
					}
					i--;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			ProductsDTO dto=new ProductsDTO();
			if(newproduct != null) {newproduct="y";}else{newproduct="n";}
			System.out.println(newproduct);
			dto.setNewproduct(newproduct);
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			dto.setPrice(Integer.parseInt(price));
			dto.setDelprice(Integer.parseInt(delprice));
			dto.setTotalprice(Integer.parseInt(totalprice));
			dto.setCategories(categories);
			dto.setCategories_detail(categories_detail);
			
			//파일 첨부를 하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename == null || filename.trim().equals("")) {filename="-";}
			if(filename1 == null || filename1.trim().equals("")) {filename1="-";}
			if(filename2 == null || filename2.trim().equals("")) {filename2="-";}
			if(filename3 == null || filename3.trim().equals("")) {filename3="-";}
			if(filename4 == null || filename4.trim().equals("")) {filename4="-";}
			if(filename5 == null || filename5.trim().equals("")) {filename5="-";}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			dto.setFilename1(filename1);
			dto.setFilesize1(filesize1);
			dto.setFilename2(filename2);
			dto.setFilesize2(filesize2);
			dto.setFilename3(filename3);
			dto.setFilesize3(filesize3);
			dto.setFilename4(filename4);
			dto.setFilesize4(filesize4);
			dto.setFilename5(filename5);
			dto.setFilesize5(filesize5);
			//레코드 수정
			dao.update(dto);
			//페이지 이동
			String page="/project/allproduct.jsp";
			response.sendRedirect(contextPath+page);
	
		}else if(url.indexOf("delete.do") != -1) {
			//파일업로드를 안쓰더라도 MultipartRequest 처리를 해야한다.
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, 
					"utf-8", new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			//페이지 이동
			String page="/products_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("search.do") != -1) {
			//검색옵션과 검색 키워드
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			int count=dao.searchcount(keyword);
			int curPage=1;
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			System.out.println(curPage);
			System.out.println(keyword);
			System.out.println(search_option);
			System.out.println(count);
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<ProductsDTO> list=dao.searchList(start, end, search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			request.setAttribute("page", pager);
			String page="/project/search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			System.out.println("끝");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}