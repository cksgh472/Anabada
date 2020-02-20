<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<title>Insert title here</title>
<script>
$(function(){
	$("#btnUpdate").click(function(){
		document.noticeuser.submit();
	});
	
  $('[data-toggle="tooltip"]').tooltip();
});
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
    <!-- Content Wrapper -->
    <div id="listview"></div>
          <!-- ======================================Page Heading====================================== -->
           <div class="container" id="hide">

    <div class="card o-hidden border-0 shadow-lg my-3">
      <div class="card-body p-0">
      
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h2 text-gray-900 mb-4">공지사항 수정</h1>
              </div>
              <hr>
              <form class="user needs-validation" name="noticeuser" method="post" enctype="multipart/form-data" action="${path}/notice_servlet/update.do">
              <input type="hidden" id="num" name="num" value="${dto.num}">
              
                <div class="input-group mb-3">
                <div class="input-group input-group-lg col-5">
				    <div class="input-group-prepend">
				      <span class="input-group-text">제목</span>
				    </div>
				    <input type="text" class="form-control" id="subject" name="subject" value="${dto.subject}">
				  </div>
				  <div class="input-group input-group-lg col-3">
				    <div class="input-group-prepend">
				      <span class="input-group-text">작성자</span>
				    </div>
				    <input type="text" class="form-control" id="writer" name="writer" value="${dto.writer}" readonly>
				  </div>
				  <div class="input-group input-group-lg col-4">
				    <div class="input-group-prepend">
				      <span class="input-group-text">작성일</span>
				    </div>
				    <input type="text" class="form-control" id="reg_date" name="reg_date" value="${dto.reg_date}" readonly>
				  </div>
				  </div>
                 <div class="input-group mb-3 input-group-lg col-12">
				    <div class="input-group-prepend">
				      <span class="input-group-text">내용</span>
				    </div>
				     <textarea rows="20" class="form-control" name="content" id="content">${dto.content}</textarea>
				  </div>
			    <hr>
			        <div class="col-12 col-md-3 mb-3">
                      <input type="password" class="form-control form-control-user text-center" name="passwd" placeholder="글 비밀번호" required>
                      <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
			       <div class="input-group">
                   <div class="col-12 col-md-4 col-sm-4 mb-3">
                   <button class="btn btn-outline-secondary btn-user btn-block" type="button" id="btnCancle" onclick="history.go(-2)">취소</button>
                   </div>
                   <div class="col-12 col-md-4 col-sm-4 mb-3">
                   <button class="btn btn-outline-danger btn-user btn-block" id="btnDelete">삭제</button>
                   </div>
					<div class="col-12 col-md-4 col-sm-4 mb-3">
                   <button class="btn btn-outline-primary btn-user btn-block" id="btnUpdate">등록</button>
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