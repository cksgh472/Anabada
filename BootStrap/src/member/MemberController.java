package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String url=request.getRequestURL().toString();
		String uri=request.getRequestURI();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String context=request.getContextPath();
		MemberDAO dao=new MemberDAO();
		if(uri.indexOf("join_bcrypt.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String birthday=request.getParameter("birthday");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			String addr3=request.getParameter("addr3");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setBirthday(birthday);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			dto.setAddr3(addr3);
			dao.insertBcrypt(dto);
			String page=request.getContextPath()+"/project/login.jsp?message=new";
			response.sendRedirect(page);
			
		}else if(uri.indexOf("view.do") != -1) {
			String userid=request.getParameter("userid");
			MemberDTO dto=dao.memberDetail(userid);
			request.setAttribute("dto", dto);
			String page="/project/userinfo.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("update.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String birthday=request.getParameter("birthday");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			String addr3=request.getParameter("addr3");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setBirthday(birthday);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			dto.setAddr3(addr3);
			dao.update(dto);
			//페이지 이동
			response.sendRedirect(context+"/project/main.jsp");
			
		}else if(uri.indexOf("list.do") != -1) {//member_servlet/list.do
			System.out.println("list.do호출...");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do"));
			//HashMap 생성
			Map<String,Object> map=new HashMap<>();
			List<MemberDTO> list=dao.memberList();
			map.put("list", list);
			//ArrayList에 담겨진 레코드의 갯수로 저장
			map.put("count", list.size());
			
			//최종적으로 map담긴 값을 setAttribute에 저장
			request.setAttribute("map", map);
			//출력을 위해 포워딩할 uri를 지정
			String page="/project/member_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}