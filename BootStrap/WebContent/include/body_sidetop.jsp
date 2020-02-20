<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../project/main.jsp">
        <img class="img-thumbnail" src="../project/images/Logofile.png"></a>
      <hr class="sidebar-divider my-0">
      <!-- Heading -->
      <li class="sidebar-heading">
         <h6>상품보기</h6> 
      </li>
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMenu" aria-expanded="true" aria-controls="collapseMenu">
        <i class="fas fa-bars"></i>
          <span>전체카테고리</span>
        </a>
        <div id="collapseMenu" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
               <a class="collapse-header" data-toggle="collapse" data-target="#item_1">전자제품</a>
                <div class="item-box collapse" id="item_1" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('전자제품','스마트폰')" href="#">스마트폰</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','태블릿PC')" href="#">태블릿PC</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','노트북/PC')" href="#">노트북/PC</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','카메라')" href="#">카메라</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','음향가전/학습기기')" href="#">음향가전/학습기기</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','게임/타이틀')" href="#">게임/타이틀</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','웨어러블')" href="#">웨어러블</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','영상가전')" href="#">영상가전</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','생활/주방/미용가전')" href="#">생활/주방/미용가전</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','자동차기기')" href="#">자동차기기</a>
			    <a class="collapse-item" onclick="selectcate('전자제품','기타전자기기')" href="#">기타전자기기</a>
			    </div>
			  <a class="collapse-header" data-toggle="collapse" data-target="#item_2">완구/문구/취미</a>
			    <div class="item-box collapse" id="item_2" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('완구/문구/취미','문구/사무용품')" href="#">문구/사무용품</a>
			    <a class="collapse-item" onclick="selectcate('완구/문구/취미','화방용품')" href="#">화방용품</a>
			    <a class="collapse-item" onclick="selectcate('완구/문구/취미','악기')" href="#">악기</a>
			    <a class="collapse-item" onclick="selectcate('완구/문구/취미','피규어')" href="#">피규어</a>
			    </div>
          	  <a class="collapse-header" data-toggle="collapse" data-target="#item_3">스포츠/레저</a>
          	  <div class="item-box collapse" id="item_3" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','캠핑')" href="#">캠핑</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','등산')" href="#">등산</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','골프')" href="#">골프</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','자전거/오토바이')" href="#">자전거/오토바이</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','자동차')" href="#">자동차</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','스키/보드')" href="#">스키/보드</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','낚시')" href="#">낚시</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','수영/헬스/요가')" href="#">수영/헬스/요가</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','스케이트/보드/롤러')" href="#">스케이트/보드/롤러</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','축구/야구/농구')" href="#">축구/야구/농구</a>
			    <a class="collapse-item" onclick="selectcate('스포츠/레저','기타스포츠용품')" href="#">기타스포츠용품</a>
			  </div>
		      <a class="collapse-header" data-toggle="collapse" data-target="#item_4">여행/문화</a>
		        <div class="item-box collapse" id="item_4" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('여행/문화','지류/카드상품권')" href="#">지류/카드상품권</a>
			    <a class="collapse-item" onclick="selectcate('여행/문화','공연/티켓')" href="#">공연/티켓</a>
			    <a class="collapse-item" onclick="selectcate('여행/문화','모바일쿠폰/상품권')" href="#">모바일쿠폰/상품권</a>
			    <a class="collapse-item" onclick="selectcate('여행/문화','여행/항공권')" href="#">여행/항공권</a>
			    <a class="collapse-item" onclick="selectcate('여행/문화','레저이용권')" href="#">레저이용권</a>
			    </div>
		      <a class="collapse-header" data-toggle="collapse" data-target="#item_5">패션잡화</a>
		        <div class="item-box collapse" id="item_5" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('패션잡화','신발')" href="#">신발</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','여성가방')" href="#">여성가방</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','남성가방')" href="#">남성가방</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','지갑')" href="#">지갑</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','시계')" href="#">시계</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','주얼리')" href="#">주얼리</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','모자')" href="#">모자</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','여행용가방/소품')" href="#">여행용가방/소품</a>
			    <a class="collapse-item" onclick="selectcate('패션잡화','기타잡화')" href="#">기타잡화</a>
			    </div>
			  <a class="collapse-header" data-toggle="collapse" data-target="#item_6">생활/건강</a>
			    <div class="item-box collapse" id="item_6" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('생활/건강','자동차용품')" href="#">자동차용품</a>
			    <a class="collapse-item" onclick="selectcate('생활/건강','주방용품')" href="#">주방용품</a>
			    <a class="collapse-item" onclick="selectcate('생활/건강','세탁용품')" href="#">세탁용품</a>
			    <a class="collapse-item" onclick="selectcate('생활/건강','수납/정리용품')" href="#">수납/정리용품</a>
			    <a class="collapse-item" onclick="selectcate('생활/건강','공구')" href="#">공구</a>
			    <a class="collapse-item" onclick="selectcate('생활/건강','애완')" href="#">애완</a>
			    <a class="collapse-item" onclick="selectcate('생활/건강','식품')" href="#">식품</a>
			    </div>
			  <a class="collapse-header" data-toggle="collapse" data-target="#item_7">화장품/미용</a>
			    <div class="item-box collapse" id="item_7" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('화장품/미용','스킨케어')" href="#">스킨케어</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','선케어')" href="#">선케어</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','베이스메이크업')" href="#">베이스메이크업</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','색조메이크업')" href="#">색조메이크업</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','클렌징')" href="#">클렌징</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','마스크/팩')" href="#">마스크/팩</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','헤어케어')" href="#">헤어케어</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','헤어스타일링')" href="#">헤어스타일링</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','바디케어')" href="#">바디케어</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','네일케어')" href="#">네일케어</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','남성화장품')" href="#">남성화장품</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','향수')" href="#">향수</a>
			    <a class="collapse-item" onclick="selectcate('화장품/미용','뷰티소품')" href="#">뷰티소품</a>
			    </div>
			    <a class="collapse-header" data-toggle="collapse" data-target="#item_8">도서/음반/DVD</a>
			    <div class="item-box collapse" id="item_8" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('도서/음반/DVD','도서')" href="#">도서</a>
			    <a class="collapse-item" onclick="selectcate('도서/음반/DVD','음반/DVD')" href="#">음반/DVD</a>
			    </div>
			  <a class="collapse-header" data-toggle="collapse" data-target="#item_9">가구/인테리어</a>
			  <div class="item-box collapse" id="item_9" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','침실가구')" href="#">침실가구</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','거실/주방가구')" href="#">거실/주방가구</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','수납가구')" href="#">수납가구</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','침구단품')" href="#">침구단품</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','커튼')" href="#">커튼</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','서재/사무용가구')" href="#">서재/사무용가구</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','DIY자재/용품')" href="#">DIY자재/용품</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','침구세트')" href="#">침구세트</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','아동/주니어가구')" href="#">아동/주니어가구</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','인테리어소품')" href="#">인테리어소품</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','베개/솜류')" href="#">베개/솜류</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','수예')" href="#">수예</a>
			    <a class="collapse-item" onclick="selectcate('가구/인테리어','카페트/러그')" href="#">카페트/러그</a>
			    </div>
			  <a class="collapse-header" data-toggle="collapse" data-target="#item_10">패션의류</a>
			    <div class="item-box collapse" id="item_10" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('패션의류','여성의류')" href="#">여성의류</a>
			    <a class="collapse-item" onclick="selectcate('패션의류','남성의류')" href="#">남성의류</a>
			    <a class="collapse-item" onclick="selectcate('패션의류','언데웨어/잠옷')" href="#">언데웨어/잠옷</a>
			    </div>
		      <a class="collapse-header" data-toggle="collapse" data-target="#item_11">유아동/출산</a>
		      <div class="item-box collapse" id="item_11" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('유아동/출산','유모차/카시트')" href="#">유모차/카시트</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','완구/교육/교구')" href="#">완구/교육/교구</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','수유/이유용품')" href="#">수유/이유용품</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','외출용품')" href="#">외출용품</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','유아가구')" href="#">유아가구</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','목욕/스킨케어')" href="#">목욕/스킨케어</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','위생/건강/세제')" href="#">위생/건강/세제</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','임부복')" href="#">임부복</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','유아동의류/잡화')" href="#">유아동의류/잡화</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','안전용품')" href="#">안전용품</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','기저귀/물티슈')" href="#">기저귀/물티슈</a>
			    <a class="collapse-item" onclick="selectcate('유아동/출산','분유/이유식/간식')" href="#">분유/이유식/간식</a>
			    </div>
			   <a class="collapse-header" data-toggle="collapse" data-target="#item_12">해외명품</a>
			   <div class="item-box collapse" id="item_12" data-parent="#collapseMenu">
			    <a class="collapse-item" onclick="selectcate('해외명품','명품가방')" href="#">명품가방</a>
			    <a class="collapse-item" onclick="selectcate('해외명품','명품지갑')" href="#">명품지갑</a>
			    <a class="collapse-item" onclick="selectcate('해외명품','명품신발')" href="#">명품신발</a>
			    <a class="collapse-item" onclick="selectcate('해외명품','명품액세서리')" href="#">명품액세서리</a>
			    </div>
              </div>
            </div>
       	  <hr class="sidebar-divider my-0">
  <!-- Heading -->
  <div class="sidebar-heading">
     <h6>메뉴</h6>        
  </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-shopping-cart"></i>
          <span>내물품</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">My Cart</h6>
            <a class="collapse-item" href="#">판매상품</a>
            <a class="collapse-item" href="#">판매완료 상품</a>
            <h6 class="collapse-header">Like</h6>
            <a class="collapse-item" href="#">인기상품</a>
            <a class="collapse-item" href="#">찜한상품</a>
          </div>
        </div>
      </li>

      <!-- Nav Item -->
      <li class="nav-item">
        <a class="nav-link" href="../project/allproduct.jsp">
          <i class="fas fa-certificate"></i>
          <span>전체상품</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="../project/newproduct.jsp">
          <i class="fas fa-gift"></i>
          <span>새상품</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#center" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-dolly"></i>
          <span>고객센터</span></a>
          <div id="center" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">ANABADA</h6>
            <a class="collapse-item" href="#">소개</a>
            <a class="collapse-item" href="../project/anabada.jsp">공지사항</a>
            <a class="collapse-item" href="#">1:1문의</a>
          </div>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-hand-holding-usd"></i>
          <span>판매하기</span></a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a href="../project/sellmain.jsp" class="collapse-header h-6">판매유형</a>
            <a class="collapse-item" href="#">베이직</a>
            <a class="collapse-item" href="#">라이트</a>
            <a class="collapse-item" href="../project/usersell.jsp">직접판매</a>
          </div>
        </div>
        </li>
        
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <li class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </li>
   
 	</ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div> 
        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" name="form1" method="post" action="${path}/products_servlet/search.do">
            <div class="input-group">
              <input type="hidden" name="search_option" value="all">
              <input type="text" class="form-control bg-light border-0 small" placeholder="상품명, 지역을 입력하세요" aria-label="Search" aria-describedby="basic-addon2" name="keyword" value="${keyword}">
              <div class="input-group-append">
                <button class="btn btn-primary" type="submit" id="btnSearch" name="btnSearch">
                <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>
          
          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown-->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search" name="form1" method="post" action="${path}/products_servlet/search.do">
                  <div class="input-group">
                    <input type="hidden" name="search_option" value="all">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="상품명, 지역을 입력하세요" aria-label="Search" aria-describedby="basic-addon2" name="keyword" value="${keyword}">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="submit" name="btnSearch">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>
            
            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter"></span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter"></span>
              </a>
              
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>
            
			<div class="topbar-divider d-none d-sm-block"></div>
			<c:choose>
              <c:when test="${sessionScope.userid != null}">
                <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.userid}</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="../member_servlet/view.do?userid=${sessionScope.userid}">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                             개인정보
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                             장바구니
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                             활동내역
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                             로그아웃
                </a>
              </div>
            </li>
              </c:when>
              <c:otherwise>
              <li class="nav-item dropdown no-arrow">
                  <a class="nav-link dropdown-toggle" href="login.jsp">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인</span>
                    <img class="img-profile rounded-circle" src="../project/images/key.png">
                  </a>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
        </nav>
        <!-- End of Topbar -->