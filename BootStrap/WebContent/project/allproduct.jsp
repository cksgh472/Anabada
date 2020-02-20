<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function () {
	$.ajax({
		type: "post",
		url: "${path}/products_servlet/list.do",
		success: function(result){
			$("#listviewAll").html(result);
		}
	});	
});
function list(page,categories,categories_detail) {
	$.ajax({
	    type: "POST",
	    url: (categories == "All") ? "${path}/products_servlet/list.do?curPage="+page :
	    	"${path}/products_servlet/cate.do?curPage="+page+"&categories="+categories+"&categories_detail="+categories_detail,
	    success: function(result){
	    		$("#listviewAll").html(result);
	    }
	});
}
function selectcate(categories,categories_detail) {
	$.ajax({
		type: "post",
		url: "${path}/products_servlet/cate.do?categories="+categories+"&categories_detail="+categories_detail,
		success: function(result){
			$("#listviewAll").html(result);
		}
	});	
}
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
  <!-- Begin Page Content -->
  <div id="listview"></div>
    <div id="hide">
      <div id="listviewAll"> </div>
    </div>
<%@ include file="../include/body_footer.jsp" %>