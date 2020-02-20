<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  <div class="input-group col-12">
    <h1 class="shop_info col-12">새상품<small>(미사용)</small></h1>
      <c:forEach var="dto" items="${list}">
        <c:choose>
          <c:when test="${dto.newproduct eq 'y'}">
            <div class="col-12 col-sm-6 col-xl-3 my-1 my-md-3">
		      <div class="card m-1">
		  	    <img class="card-img-top" style="width:100%; height:16rem;" src="../project/images/upload/${dto.filename}" alt="${dto.filename}">
		          <div class="card-body">
		            <input type="hidden" value="${dto.num}" name="num">
		              <a class="card-title" href="${path}/products_servlet/view.do?num=${dto.num}">${dto.subject}
                        <c:if test="${dto.comment_count > 0}">
    	                  <span class="badge badge-secondary badge-danger badge-pill">${dto.comment_count}</span>
                        </c:if>
                       </a>
                         <h5 class="card-text"><fmt:formatNumber value="${dto.totalprice}" pattern="#,###" /></h5>
                         <a href="${path}/products_servlet/click.do?num=${dto.num}" class="btn btn-primary">좋아요&nbsp;<i class="far fa-thumbs-up"> ${dto.click}</i></a>
                         <span class="badge badge-success"><h5>새상품</h5></span>
                        <h6 class="card-text mt-1 mb-0">조회수:&nbsp;${dto.readcount}</h6>
                      <h6 class="card-text">등록일:&nbsp;${dto.reg_date}</h6>
                  </div>
             </div>
           </div>
         </c:when>
       </c:choose>
     </c:forEach>
<!-- 페이지 네비게이션 -->
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