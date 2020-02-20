<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>  
<%@ page import="java.util.List" %>  
<%@ page import="member.MemberDTO" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function view(userid){
	document.form1.userid.value = userid;
	document.form1.submit();
}
</script>
</head>
<body>
<%
Map<String,Object> map=(Map<String,Object>)request.getAttribute("map");
List<MemberDTO> list=(List<MemberDTO>)map.get("list");
int count=(int)map.get("count");
%>
등록된 회원수 : <%=count %>명
<table border="1" width="100%">
  <tr>
    <th>이름</th>
    <th>아이디</th>
    <th>가입일자</th>
    <th>이메일</th>
    <th>핸드폰</th>
  </tr>
  <% for(MemberDTO dto : list) { %>
  <tr>
    <td><a href="#" onclick="view('<%=dto.getUserid()%>')">
    <%=dto.getName()%></a></td>
    <td><%=dto.getUserid() %> </td>
    <td><%=dto.getJoin_date() %> </td>
    <td><%=dto.getEmail() %> </td>
    <td><%=dto.getHp() %> </td>
  </tr>
  <%} %>
</table>

<form name="form1" method="post" 
action="/BootStrap/member_servlet/view.do">
  <input type="hidden" name="userid">
</form>



</body>
</html>