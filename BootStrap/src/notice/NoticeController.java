package notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import notice.dao.NoticeDAO;
import notice.dto.NoticeCommentDTO;
import notice.dto.NoticeDTO;
import page.Pager;


public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws 
	ServletException, IOException {
		//클라이언트에서 요청한 주소
		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		NoticeDAO dao=new NoticeDAO();
		if(url.indexOf("notice.do") != -1) {
			//레코드 갯수 계산
			int count=dao.count();
			//페이지 나누기를 위한 처리
			int curPage=1;
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			//System.out.println("list.do 호출");
			List<NoticeDTO> list=dao.list(start,end);
			System.out.println(list);
			request.setAttribute("list", list);
			//페이지 네비게이션 출력을 위한 정보전달
			request.setAttribute("page", pager);
			
			String page="/project/notice_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insert.do") != -1) {
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", 
					new DefaultFileRenamePolicy());
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소
			NoticeDTO dto=new NoticeDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			dao.insert(dto);
			String page="/project/anabada.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("download.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao.getFileName(num);
			System.out.println("첨부파일 이름:"+filename);
			
			//다운로드할 파일 경로
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096];//바이트배열 생성
			//서버에 저장된 파일을 읽기 위한 스트림 생성
			FileInputStream fis=new FileInputStream(path);
			//mimeType(파일의 종류-img, mp3, txt..등)
			String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
			//파일 이름에 한글이 포함된 경우 header 값을 보내게 되는데
			//header에는 한글이나 특수문자가 올 수 없기 때문에
			//8859_1(서유럽언어)를 utf-8로 변환해서
			//한글,특수문자 처리를 해야함.
			filename = 
					new String(filename.getBytes("utf-8"),"8859_1");
			//http header
			response.setHeader("Content-Disposition", 
					"attachment;filename="+filename);
			//OutputStream 생성(서버에서 클라이언트에 쓰기)
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true) {
				numRead = fis.read(b,0,b.length);//데이터 읽음
				if(numRead == -1) break; //더 이상 내용이 없으면
				out.write(b,0,numRead);//데이터 쓰기
			}
			//파일 처리 관련 리소스 정리
			out.flush();
			out.close();
			fis.close();
			//다운로드 횟수 증가 처리
			dao.plusDown(num);
		}else if(url.indexOf("view.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가 처리
			dao.plusReadCount(num, session);
			NoticeDTO dto=dao.viewReplace(num);
			
			//BoardDTO dto=dao.view(num);
			request.setAttribute("dto", dto);
			String page="/project/viewnotice.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("commentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			//댓글 목록 리턴
			List<NoticeCommentDTO> list=dao.commentList(num);
			request.setAttribute("list", list);
			//출력 페이지 이동
			String page="/project/comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("comment_add.do") != -1) {
			NoticeCommentDTO dto=new NoticeCommentDTO();
			//게시물 번호
			int notice_num=Integer.parseInt(request.getParameter("notice_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setNotice_num(notice_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 page이동이 불필요
		}else if(url.indexOf("pass_check.do") != -1) {
			//게시물 번호
			System.out.println("passcheck 호출...");
			System.out.println(request.getParameter("num"));
			System.out.println(request.getParameter("passwd"));
			int num=Integer.parseInt(request.getParameter("num"));
			//비밀번호
			String passwd=request.getParameter("passwd");
			//비번 check
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/project/notice_edit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 틀리면
				page=contextPath+"/notice_servlet/view.do?num="
			+num+"&message=error";
				response.sendRedirect(page);
			}//else
		}else if(url.indexOf("update.do") != -1) {
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", 
					new DefaultFileRenamePolicy());
			System.out.println("update num :"+multi.getParameter("num") );
			int num=Integer.parseInt(multi.getParameter("num"));
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소
			System.out.println(writer);
			System.out.println(subject);
			System.out.println(passwd);
			System.out.println(ip);
			NoticeDTO dto=new NoticeDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			dao.update(dto);
			String page="/project/anabada.jsp";
			response.sendRedirect(contextPath+page);
	
		}else if(url.indexOf("delete.do") != -1) {
			MultipartRequest multi=new MultipartRequest(request,
					Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, 
					"utf-8", new DefaultFileRenamePolicy());
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			String page="/project/anabada.jsp";
			response.sendRedirect(contextPath+page);
			
		}else if(url.indexOf("search.do") != -1) {
			//검색옵션과 검색 키워드
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			
			List<NoticeDTO> list=dao.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			String page="/board/search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
