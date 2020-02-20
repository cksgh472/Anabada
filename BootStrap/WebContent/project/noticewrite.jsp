<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnSave").click(function(){
		document.user.submit();
	});
	
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
 <!-- Page Heading -->
  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-3">
      <div class="card-body p-0">
      
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h2 text-gray-900 mb-4">공지사항 작성</h1>
              </div>
              <hr>
              <form class="user" name="user" method="post" enctype="multipart/form-data" action="${path}/notice_servlet/insert.do">
              <input type="hidden" id="writer" name="writer" value="${sessionScope.userid}">
                <!-- 카테고리 분류 -->
                <div class="input-group input-group-lg col-12">
				    <div class="input-group-prepend">
				      <span class="input-group-text">제목</span>
				    </div>
				    <input type="text" class="form-control" id="subject" name="subject">
				  </div>
                <hr>
                 <div class="input-group mb-3 input-group-lg col-12">
				    <div class="input-group-prepend">
				      <span class="input-group-text">내용</span>
				    </div>
				     <textarea rows="20" class="form-control" name="content" id="content"></textarea>
				  </div>
				  <div class="row mx-1">
				  <div class="input-group mb-3 input-group-lg col-4">
				    <div class="input-group-prepend">
				      <span class="input-group-text">비밀번호</span>
				    </div>
				    <input type="password" class="form-control user-sell-input" data-toggle="tooltip" name="passwd" id="passwd"
				    data-placement="top" title="게시글 수정 및 삭제에만 이용됩니다.">
				  </div>
				  </div>
			    <hr>
			       <div class="row col-12">
                   <div class="col-12 col-md-6 col-sm-6 mb-3 mb-sm-0">
                   <button class="btn btn-outline-secondary btn-user btn-block" type="button" onClick="history.back()">취소</button>
                   </div>
					<div class="col-12 col-md-6 col-sm-6">
                   <button class="btn btn-outline-primary btn-user btn-block" id="btnSave">등록</button>
                   </div>
                   </div>
			      </form>
			    </div>
		      </div>
            </div>
          </div>
        </div>
      </div>
<%@ include file="../include/body_footer.jsp" %>