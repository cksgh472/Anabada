<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
<!-- Begin Page Content -->
  <div id="listview"></div>
  <div id="hide">
    <div class="jumbotron">
      <div id="bannerimg" class="carousel slide" data-ride="carousel">
 
 <!-- Indicators -->
	  <ul class="carousel-indicators col-12">
	    <li data-target="#bannerimg" data-slide-to="0" class="active"></li>
	    <li data-target="#bannerimg" data-slide-to="1"></li>
	    <li data-target="#bannerimg" data-slide-to="2"></li>
	  </ul>
 
 <!-- The slideshow -->
	  <div class="carousel-inner" id="mainbanner">
	    <div class="carousel-item active">
	      <img src="images/mainbanner.jpg" alt="images/mainbanner.jpg">
	    </div>
	    <div class="carousel-item">
	      <img src="images/mainbanner1.jpg" alt="images/mainbanner1.jpg">
	    </div>
	    <div class="carousel-item">
	      <img src="images/event.png" alt="images/event.png">
	    </div>
	  </div>
      
 <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#bannerimg" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#bannerimg" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
  </div>
  <div class="row mt-sm-3">
    <div class="col"></div>
      <div class="col-12 col-md-10">
        <img src="../project/images/mainbanner3.jpg" alt="images/mainbanner3.jpg" class="center-block p-1" style="width: 100%;">
      </div>
    <div class="col"></div>
  </div>
  <div class="row mt-sm-3">
    <div class="col"></div>
      <div class="col-12 col-md-5">
        <img src="../project/images/police.png" alt="images/police.png" class="center-block p-1 sub-banner" style="width: 100%;">
      </div>
      <div class="col-12 col-md-5">
        <img src="../project/images/mainbanner4.jpg" alt="images/mainbanner4.jpg" class="center-block p-1 sub-banner" style="width: 100%;">
      </div>
      <div class="col"></div>
    </div>
  </div>
 <!-- end content -->
<%@ include file="../include/body_footer.jsp" %>