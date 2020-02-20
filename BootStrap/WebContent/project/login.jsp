<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../include/header.jsp" %>
<title>ANABADA 로그인</title>
  <!-- JSTL 명령어 -->
  <!-- c: 코어태그 -->
  <c:if test="${param.message == 'new' }">
  <script>
    alert("회원가입을 축하합니다!");
  </script>
  </c:if>
  <c:if test="${param.message == 'error' }">
  <script>
    alert("아이디 또는 비밀번호가 일치하지 않습니다.");
  </script>
  </c:if>
  <c:if test="${param.message == 'logout' }">
  <script>
    alert("로그아웃되었습니다.")
  </script>
</c:if>
</head>
<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-6 col-lg-10 col-md-10">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <div>
                      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../project/main.jsp">
         			  <img class="img-thumbnail mb-3" style="width:100%; height:10rem" src="../project/images/Logofile.png"></a>
                    </div>
                  </div>
                  <form class="user" action="${path}/session_servlet/login_bcrypt.do">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="userid" name="userid" placeholder="아이디를 입력하세요">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                      </div>
                    </div>
                    <input type="submit" class="btn btn-primary btn-user btn-block" value="로그인">
                    <hr>
                    <div class="form-row">
                    <a href="index.html" class="btn btn-google btn-user btn-block col-sm-6">
                      <i class="fab fa-google fa-fw"></i> Google계정으로 로그인
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block col-sm-6">
                      <i class="fab fa-facebook-f fa-fw"></i> Facebook계정으로 로그인
                    </a>
                    <a href="index.html" class="btn btn-naver btn-user btn-block col-sm-6">
                      <i class="fab fa-naver-f fa-fw"></i> Naver계정으로 로그인
                    </a>
                    <a href="index.html" class="btn btn-kakao btn-user btn-block col-sm-6">
                      <i class="fab fa-kakao-f fa-fw"></i> Kakao계정으로 로그인
                    </a>
                    </div>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="#">비밀번호를 잊으셨나요?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="register.jsp">계정 만들기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>