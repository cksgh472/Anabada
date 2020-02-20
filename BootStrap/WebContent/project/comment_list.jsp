<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<br>
<h3>Comment</h3>
  <table class="table">
    <thead>
      <tr align="center">
        <th width="15%">작성자</th>
        <th width="65%">내용</th>
        <th width="20%">작성일</th>
      </tr>
      </thead>
  <c:forEach var="row" items="${list}">
      <tbody>
        <tr>
          <td align="center">${row.writer}</td>
          <td>${row.content}</td>
          <td align="center">(<fmt:formatDate value="${row.reg_date}"
				pattern="yyyy-MM-dd hh:mm:ss"/>)
	      </td>
        </tr>
      </tbody>
    </c:forEach>
  </table>
</body>