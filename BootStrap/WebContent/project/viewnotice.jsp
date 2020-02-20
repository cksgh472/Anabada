<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnUpdate").click(function(){
		document.noticeuser.action="${path}/notice_servlet/pass_check.do";
		document.noticeuser.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.noticeuser.action="${path}/notice_servlet/delete.do";
			document.noticeuser.submit();			
		}
	});
	$('[data-toggle="tooltip"]').tooltip();
	
	function comment_add(){
		var param="notice_num=${dto.num}&writer="+$("#commentwriter").val()
		+"&content="+$("#commentcontent").val();
		$.ajax({
			type: "post",
			url: "${path}/notice_servlet/comment_add.do",
			data: param,
			success: function(){
				$("#commentcontent").val("");
				comment_list();
			}
		});
	}
	/* 댓글 리스트 */
	function comment_list(){
		$.ajax({
			type: "post",
			url: "${path}/notice_servlet/commentList.do",
			data: "num=${dto.num}",
			success: function(result){
				$("#commentList").html(result);
			}
		});
	}
});
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
 <!-- Page Heading -->
  <div id="listview"></div>
  <div class="container" id="hide">
    <div class="card o-hidden border-0 shadow-lg my-3">
      <div class="card-body p-0">
      
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h2 text-gray-900 mb-4">공지사항</h1>
              </div>
              <hr>
              <form class="user needs-validation" name="noticeuser" method="post">
              <input type="hidden" id="num" name="num" value="${dto.num}">
              
                <div class="input-group mb-3">
                <div class="input-group input-group-lg col-5">
				    <div class="input-group-prepend">
				      <span class="input-group-text">제목</span>
				    </div>
				    <input type="text" class="form-control" id="subject" name="subject" value="${dto.subject}" readonly>
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
				     <textarea rows="20" class="form-control" name="content" id="content" readonly>${dto.content}</textarea>
				  </div>
			    <hr>
			      <c:choose>
			        <c:when test="${sessionScope.userid eq 'admin'}">
			        <div class="col-12 col-md-3 mb-3 form-group">
                      <input type="password" class="form-control form-control-user text-center" name="passwd" placeholder="글 비밀번호" required>
    				  <div class="invalid-feedback">글 비밀번호를 입력해주세요.</div>
                    </div>
			       <div class="input-group">
			       <div class="col-12 col-md-6 col-sm-6 mb-3 mb-sm-0">
                   <button class="btn btn-outline-secondary btn-user btn-block" type="button" value="BACK" onclick="history.back()">목록으로</button>
                   </div>
					<div class="col-12 col-md-6 col-sm-6">
                   <button class="btn btn-outline-primary btn-user btn-block" type="button" id="btnUpdate" data-toggle="tooltip" 
				       data-placement="top" title="글 비밀번호를 입력해주세요">수정</button>
                   </div>
                   </div>
                   </c:when>
                   <c:otherwise>
                   <div class="row col-12">
                   <div class="col-16 col-md-3 col-sm-3 mb-3 mb-sm-0">
                   <a href="anabada.jsp"><button class="btn btn-outline-secondary btn-user btn-block" value="BACK">목록으로</button></a>
                   </div>
                   </div>
                     </c:otherwise>
                    </c:choose>
			      </form>
                  <div id="commentList"></div>
                  <hr>
                     <form>
     				 <h5>댓글작성</h5>
                 	 <div class="input-group mb-3">
                  	 <input type="hidden" id="commentwriter" value="${sessionScope.userid}" readonly>
				  	 <input type="text" class="form-control" id="commentcontent" placeholder="내용">
				     <div class="input-group-append">
				     <button class="btn btn-success" type="button" id="btnSave" onclick="comment_add()">작성</button>
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