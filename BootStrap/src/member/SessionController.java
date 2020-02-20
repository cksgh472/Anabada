package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/session_servlet/*")//공통 url
public class SessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 요청한 주소
		String uri=request.getRequestURI();
		System.out.println(uri);
		String context=request.getContextPath();
		MemberDAO dao = new MemberDAO();
		if(uri.indexOf("login_bcrypt.do") != -1) {//개별 주소
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result = dao.loginCheckBcrypt(dto);
			request.setAttribute("result", result);
			MemberDTO result1 = dao.memberDetail(userid);
			String name=result1.getName();
			String hp=result1.getHp();
			String email=result1.getEmail();
			String addr1=result1.getAddr1();
			String addr2=result1.getAddr2();
			String addr3=result1.getAddr3();
			String page="/project/login.jsp";
			if(!result.equals("로그인 실패")) {//로그인 성공
				//세션 객체 생성
				HttpSession session = request.getSession();
				//세션에 값 저장
				session.setAttribute("userid", userid);
				session.setAttribute("name", name);
				session.setAttribute("hp", hp);
				session.setAttribute("email", email);
				session.setAttribute("addr1", addr1);
				session.setAttribute("addr2", addr2);
				session.setAttribute("addr3", addr3);
				session.setAttribute("message", result);
				page="/project/main.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else {//로그인 실패
				response.sendRedirect(request.getContextPath()+page+"?message=error");
			}
		}else if(uri.indexOf("logout.do") != -1) {//로그아웃 처리
			//세션객체 생성
			System.out.println("로그아웃 서블릿");
			HttpSession session=request.getSession();
			//세션을 비움(초기화)
			session.invalidate();
			//로그인 페이지로 이동
			String page=request.getContextPath()+"/project/login.jsp";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
