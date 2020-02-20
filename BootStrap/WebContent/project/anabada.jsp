<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		type: "post",
		url: "${path}/notice_servlet/notice.do",
		success: function(result){
			$("#noticelistview").html(result);
		}
	});	
});
//클릭한 페이지로 이동
function list(page){
	$.ajax({
		type: "post",
		url: "${path}/notice_servlet/notice.do?curPage="+page,
		success: function(result){
			$("#noticelistview").html(result);
		}
	});	
}
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
 <!-- Begin Page Content -->
  <div id="listview"></div>
  <div id=hide>
  <div id="noticelistview"></div>
  </div>
 <!-- end content -->
<%@ include file="../include/body_footer.jsp" %>