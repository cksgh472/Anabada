<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnEdit").click(function(){
		document.user.action="${path}/products_servlet/pass_check.do";
		document.user.submit();
	});
	
	$('[data-toggle="tooltip"]').tooltip();
});
/* 댓글 추가 */
function comment_add(){
	var param="usersell_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/products_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#content").val("");
			comment_list();
		}
	});
}
/* 댓글 리스트 */
function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/products_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
  <!-- Begin Page Content -->
    <!-- ======================================Page Heading====================================== -->
    <div id="listview"></div>
      <div class="card o-hidden border-0 shadow-lg my-3 mx-md-5" id="hide">
        <div class="card-body p-0">
          <div class="row">
            <div class="col-lg-12">
              <div class="p-1 px-md-5">
              <form class="user" name="user" method="post">
                <div class="text-center">
                  <h1 class="h2 text-gray-900 mb-4">상품정보</h1>
                </div>
                <hr>
                <input type="hidden" name="num" value="${dto.num}">
                <!-- 판매자 정보 -->
                <div class="row">
                  <div class="col-6 col-sm-3 mb-1 mb-sm-0">
                    <input type="text" class="form-control form-control-user" readonly value="판매자 : ${dto.writer}">
                  </div>
                  <div class="col-6 col-sm-3 mb-1 mb-sm-0">
                    <input type="text" class="form-control form-control-user" readonly id="reg_date" name="reg_date" value="등록일 : ${dto.reg_date}">
                  </div>
                  <div class="col-6 col-sm-3 mb-1 mb-sm-0">
                    <input type="text" class="form-control form-control-user" readonly id="readcount" name="readcount" value="조회수 : ${dto.readcount}">
                  </div>
                  <div class="col-6 col-sm-3 mb-1 mb-sm-0">
                    <input type="text" class="form-control form-control-user" readonly id="totalprice" name="totalprice" value="가격 : ${dto.totalprice}">
                  </div>
                </div>
                <hr>
                <div class="jumbotron rounded mb-3 col-12 col-md-8 offset-md-2">
  			      <div id="sellimg" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
			        <ul class="carousel-indicators col-12">
					  <li data-target="#sellimg" data-slide-to="0" class="active"></li>
					  <li data-target="#sellimg" data-slide-to="1"></li>
					  <c:if test="${dto.filename2 != '-'}">
					    <li data-target="#sellimg" data-slide-to="2"></li>
    		          </c:if>
    		          <c:if test="${dto.filename3 != '-'}">
					    <li data-target="#sellimg" data-slide-to="3"></li>
    		          </c:if>
    		          <c:if test="${dto.filename4 != '-'}">
					    <li data-target="#sellimg" data-slide-to="4"></li>
    		          </c:if>
    		          <c:if test="${dto.filename5 != '-'}">
					    <li data-target="#sellimg" data-slide-to="5"></li>
    		          </c:if>
					</ul>
                    <!-- The slideshow -->
                    <div class="carousel-inner col-12" id="mycar">
		              <div class="carousel-item active">
		                <img src="../project/images/upload/${dto.filename}" alt="${dto.filename}">
		              </div>
		              <div class="carousel-item">
		                <img src="../project/images/upload/${dto.filename1}" alt="${dto.filename1}">
		              </div>
		                <c:if test="${dto.filename2 != '-'}">
		                  <div class="carousel-item">
	     	                <img src="../project/images/upload/${dto.filename2}" alt="${dto.filename2}">
    		              </div>
    		            </c:if>
    		            <c:if test="${dto.filename3 != '-'}">
		                  <div class="carousel-item">
	     	                <img src="../project/images/upload/${dto.filename3}" alt="${dto.filename3}">
    		              </div>
    		            </c:if>
    		            <c:if test="${dto.filename4 != '-'}">
		                  <div class="carousel-item">
	     	                <img src="../project/images/upload/${dto.filename4}" alt="${dto.filename4}">
    		              </div>
    		            </c:if>
    		            <c:if test="${dto.filename5 != '-'}">
		                  <div class="carousel-item">
	     	                <img src="../project/images/upload/${dto.filename5}" alt="${dto.filename5}">
    		              </div>
    		            </c:if>
		            </div>
                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#sellimg" data-slide="prev">
		              <span class="carousel-control-prev-icon"></span>
		            </a>
		            <a class="carousel-control-next" href="#sellimg" data-slide="next">
		              <span class="carousel-control-next-icon"></span>
		            </a>
		          </div>
		  		</div>
                <div class="form-group row">
                  <div class="col-sm-12 mb-0">
                    <input type="text" class="form-control form-control-user" readonly id="subject" name="subject" value="제목 : ${dto.subject}">
                  </div>
                  <div class="col-sm-12 mb-3">
                  <hr>
                  <textarea rows="7" class="form-control " readonly>${dto.content}</textarea>
                  </div>
                  <div class="col-md-3 mb-3 mb-md-0">
                    <button type="button" class="btn btn-user btn-block btn-outline-info" value="BACK" onClick="history.go(-1)">목록으로</button>
                  </div>
                  <div class="col-md-3 mb-3 mb-md-0">
                    <input type="text" class="form-control form-control-user text-center" readonly value="${dto.categories}">
                  </div>
                  <div class="col-md-3 mb-3 mb-md-0">
                    <input type="text" class="form-control form-control-user text-center" readonly value="${dto.categories_detail}">
                  </div>
                  <c:if test="${dto.writer eq sessionScope.userid}">
                  <div class="col-md-3 mb-3 mb-md-0">
                    <input type="text" class="form-control form-control-user text-center" name="passwd" placeholder="글 비밀번호" required>
                  </div>
                  </c:if>
                </div>
                <hr>
                
                 <div class="form-group row">
                   <c:choose>
			         <c:when test="${dto.writer eq sessionScope.userid}">
			           <div class="col-12 col-md-6 col-sm-6 mb-3 mb-sm-0">
                       <button class="btn btn-danger btn-user btn-block" id="btnCancle">삭제</button>
                       </div>
			           <div class="col-12 col-md-6 col-sm-6">
			           <button class="btn btn-primary btn-user btn-block" id="btnEdit" data-toggle="tooltip" 
				       data-placement="top" title="글 비밀번호를 입력해주세요">수정</button>
			           </div>
			         </c:when>
			         <c:otherwise>
			           <div class="col-12 col-md-6 col-sm-6 mb-3 mb-sm-0">
                       <button class="btn btn-success btn-user btn-block" id="btnCancle">찜하기</button>
                       </div>
			           <div class="col-12 col-md-6 col-sm-6">
			             <button class="btn btn-success btn-user btn-block" id="btnUpdate">쪽지보내기</button>
			           </div>
			         </c:otherwise>
			       </c:choose>
                 </div>
                 <hr>
				<div id="commentList"></div>
				 <h5>댓글작성</h5>
                 <div class="input-group mb-3">
                  <input type="hidden" id="writer" value="${sessionScope.userid}" readonly>
				  <input type="text" class="form-control" id="content" placeholder="내용">
				  <div class="input-group-append">
				    <button class="btn btn-success" type="button" id="btnSave">작성</button>
				  </div>
				</div>
				<hr>
               </form>
				<h3>판매자의 다른 상품 보기</h3>
             </div>
           </div>
       </div>
    </div>
</div>
<%@ include file="../include/body_footer.jsp" %>