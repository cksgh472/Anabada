<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<title>ANABADA-새상품</title>
<script type="text/javascript">
$(function() {
	$.ajax({
		type: "post",
		url: "${path}/products_servlet/list.do?check=new",
		success: function(result){
			$("#listview").html(result);
		}
	});	
});
function list(page) {
	$.ajax({
	    type: "POST",
	    url: "${path}/products_servlet/list.do?check=new"+"&curPage="+page,
	    success: function(result){
	    		$("#listview").html(result);
	    }
	});
}
function selectcate(categories,categories_detail) {
	$.ajax({
		type: "post",
		url: "${path}/products_servlet/cate.do?categories="+categories+"&categories_detail="+categories_detail,
		success: function(result){
			$("#listview").html(result);
		}
	});	
}
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid">
          <div id="listview"> </div>
        </div>
    </div>
  </div>
</div>
<%@ include file="../include/body_footer.jsp" %>