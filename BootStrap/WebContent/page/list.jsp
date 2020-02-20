<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
</head>
<body>
<table border="1" width="700px">
  <tr>
    <th>사번</th>
    <th>이름</th>
  </tr>
  <!--var="개별값" items="집합" 
  집합에서 각각의 요소를 개별값으로 저장했다가 각각 출력,반복함.
  컨트롤러의 setAttribute("list",list)의 list키값을 불러
  ArrayList로 저장된 dto객체값이 담긴 list를 불러 꺼내쓰는 것임
  -->
  <c:forEach var="row" items="${list}">
    <tr>
      <td>${row.empno}</td>
      <td>${row.ename}</td>
    </tr>
  </c:forEach>
  
  <!-- 페이지 네비게이션 출력 -->
  <tr align="center">
    <td colspan="2">
      <c:if test="${page.curPage > 1}">
        <a href="#" onclick="list('1')">[처음]</a>
      </c:if>
      <c:if test="${page.curBlock > 1}">
        <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" 
      end="${page.blockEnd}">
        <c:choose>
          <c:when test="${num == page.curPage}">
            <span style="color: red">${num}</span>
          </c:when>
          <c:otherwise>
            <a href="#" onclick="list('${num}')">${num}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock}">
        <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
      </c:if>
      <c:if test="${page.curPage < page.totPage}">
        <a href="#" onclick="list('${page.totPage}')">[끝]</a>
      </c:if>
    </td>
  </tr>
</table>
</body>
</html>