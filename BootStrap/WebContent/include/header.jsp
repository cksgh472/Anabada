<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link href="../include/css/anabada.css" rel="stylesheet">
<script src="../include/jquery-3.4.1.min.js"></script>
<script>
function selectcate(categories,categories_detail){
	$.ajax({
		type: "post",
		url: "${path}/products_servlet/cate.do?categories="+categories+"&categories_detail="+categories_detail,
		success: function(result){
			$("#listview").html(result);
			$("#hide").hide();
		}
	});	
}
</script>