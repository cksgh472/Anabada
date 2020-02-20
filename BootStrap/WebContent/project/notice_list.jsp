<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/project/noticewrite.jsp";
	});
});
</script>
  <div class="container-fluid">
  <h1>공지사항<small> Notice</small></h1>
  <table class="table table-bordered table-hover text-center">
    <thead class="bg-primary">
      <tr>
        <th style="width: 10%">글번호</th>
        <th style="width: 55%">제목</th>
        <th style="width: 10%">작성자</th>
        <th style="width: 15%">작성일</th>
        <th style="width: 10%">조회수</th>
      </tr>
    </thead>
    <tbody>
  <c:forEach var="dto" items="${list}">
  <tr>
    <td>${dto.num}</td>
    <td><a href="${path}/notice_servlet/view.do?num=${dto.num}">${dto.subject}
    <c:if test="${dto.comment_count > 0}">
      <span class="badge badge-secondary badge-danger badge-pill">${dto.comment_count}</span>
    </c:if>
    </a>
    </td>
    <td>${dto.writer}</td>
    <td>${dto.reg_date}</td>
    <td>${dto.readcount}</td>
  </tr>
 </c:forEach> 
      
    </tbody>
  </table>
  <!-- 테이블 유틸 -->
      <div class="d-flex my-3">
        <div class="row col-8">
		  <select name="cars" class="custom-select col-3 col-md-2">
		    <option selected>제목</option>
		    <option value="content">내용</option>
		    <option value="all">제목+내용</option>
		  </select>
		      <input type="text" class="form-control col-5 col-md-3">
		  <div class="input-group-append">
		    <button class="btn btn-primary" type="submit">검색</button>
		  </div>
        </div>
        <c:if test="${sessionScope.userid eq 'admin'}">
        <div class="col-4 text-right">
          <button class="btn btn-primary" type="button" id="btnWrite">글쓰기</button>
        </div>
        </c:if>
      </div>
  <div class="row">
    <div class="col-12">
    <div class="row col-12 justify-content-center">
<ul class="pagination">
  <c:if test="${page.curBlock > 1 }">
  <li class="page-item"><a class="page-link" href="#" onclick="list('1')">처음</a></li>
  </c:if>
  <c:if test="${page.curBlock > 1 }">
  <li class="page-item"><a class="page-link" href="#" onclick="list('${page.prevPage}')">이전</a></li>
  </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
       <c:choose>
         <c:when test="${num == page.curPage}">
         <li class="page-item"><a class="page-link bg-primary" style="color: white" href="#">${num}</a></li>
         </c:when>
         <c:otherwise>
           <li class="page-item"><a class="page-link" href="#" onclick="list('${num}')">${num}</a></li>
         </c:otherwise>
       </c:choose>
     </c:forEach>
     <c:if test="${page.curBlock < page.totBlock}">
       <li class="page-item"><a class="page-link" href="#" onclick="list('${page.nextPage}')">다음</a></li>
     </c:if>
     <c:if test="${page.curBlock < page.totBlock}">
       <li class="page-item"><a class="page-link" href="#" onclick="list('${page.totPage}')">끝</a></li>
     </c:if>
		</ul>
		</div>
    </div>
  </div>
</div>