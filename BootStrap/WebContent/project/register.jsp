<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ANABADA 회원가입</title>
  <!-- Custom fonts for this template-->
  <!-- Custom styles for this template-->
  <link href="../include/css/sb-admin-2.css" rel="stylesheet">
  <script src="../include/jquery-3.4.1.min.js"></script>
  <script type="text/javascript">
$(function(){
//회원가입
  $('#btnJoin').click(function check(){
	//아이디 체크--------------------------------------------------
	var userid = document.getElementById("userid");
	if(userid.value == ""){
		alert("아이디는 필수 입력입니다.");
		userid.focus();
		return false;
	}
	//^시작, $끝, {4,10}글자수 지정
	var exp1 = /^[A-Za-z0-9]{4,10}$/;//정규표현식
	//정규표현식.test(검사할 문자열) - 규칙에 맞으면 true, 틀리면 false
	if(!exp1.test(userid.value)){
		alert("아이디는 영문자,숫자 4~10자리로 입력하세요.");
		userid.focus();
		return false;
	}
	//이름 체크----------------------------------------------------
	var name = document.getElementById("name");
	
	//\x20: 16진수 20=>10진수 32, (스페이스 1개인 공백문자를 의미)
	var exp2 = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2,10}$/;
	if(!exp2.test(name.value)){
		alert("이름은 한글 2~10자 이내로 입력하세요.");
		name.focus();
		return false;
	}
	
	//비밀번호 체크--------------------------------------------------
	var passwd = document.getElementById("passwd");
	var exp4 =/^(?=.*\d{1,12})(?=.*[~`!@#$%\^&*()-+=]{1,12})(?=.*[a-zA-Z]{2,12}).{8,12}$/;
	if(!exp4.test(passwd.value)){
		alert("비밀번호는숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8~12자리 입력해야 합니다.");
		passwd.focus();
		return false;
	}
	
	//이메일 체크---------------------------------------------------
	var email = document.getElementById("email");
	
	
	var exp3 = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	if(!exp3.test(email.value)){
		alert("이메일 형식이 잘못 되었습니다. ex) abc@abc.com");
		email.focus();
		return false;
	}
	
	//전화번호 체크--------------------------------------------------
	var hp = document.getElementById("hp");
	var exp = /^[0-9]+$/;
	console.log("match:"+hp.value.match(exp));
	console.log("test:"+exp.test(hp.value));
	if(!hp.value.match(exp)){
		alert("숫자만 입력하세요 ex)0101234567");
		hp.focus();
		return false;
	}
	var termsofuse1=document.getElementsByName('termsofuse1');
	var termsofuse2=document.getElementsByName('termsofuse2');
	var check1 = 0;
	var check2 = 0;
	for(var i=0; i<termsofuse1.length; i++){
		if(termsofuse1[i].checked == true)check1++;}
	for(var i=0; i<termsofuse2.length; i++){
		if(termsofuse2[i].checked == true)check2++;}
		if(check1<1 || check2<1){
			alert("이용약관을 확인하세요.");
			return false;}
		
		document.user.submit();
  });
});
  </script>
</head>
<body class="bg-gradient-primary">
  <div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h2 text-gray-900 mb-4">회원가입</h1>
              </div>
              <hr>
              <form class="user" id="user" name="user" method="post" action="../member_servlet/join_bcrypt.do">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="userid" name="userid" placeholder="ID를 입력하세요" required>
                    <div class="valid-feedback">Valid.</div>
    				<div class="invalid-feedback">아이디를 입력해주세요.</div>
                  </div>
                  <div class="col-sm-3">
                    <input type="button" class="btn btn-primary btn-user btn-block" id="btnCheck" value="중복확인">
                  </div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름을 입력하세요" required>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="passwd" name="passwd" placeholder="비밀번호" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="passwdcheck" name="passwdcheck" placeholder="비밀번호 확인" required>
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="메일주소를 입력하세요" >
                </div>
                <div class="form-group row">
                  <div class="col-sm-4  mb-3 mb-sm-0">
                  <input type="text" class="form-control form-control-user" id="birthday_Year" name="birthday_Year" placeholder="출생년도" required>
                  </div>
                  <div class="col-sm-3 mb-3 mb-sm-0 col-6">
                  <input type="text" class="form-control form-control-user" id="birthday_Month" name="birthday_Month" placeholder="월" required>
                  </div>
                  <div class="col-sm-3 mb-3 mb-sm-0 col-6">
                  <input type="text" class="form-control form-control-user" id="birthday_Day" name="birthday_Day" placeholder="일" required>
                  </div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="hp" name="hp" placeholder="휴대폰 ex) 01012345678" required>
                </div>
                <div class="form-group row">
			      <div class="col-sm-3  mb-3 mb-sm-0 col-5" >
                  <input type="text" class="form-control form-control-user" readonly id="addr1" name="addr1" required>
                  </div>
                  <div class="col-sm-3">
                  <input type="button" class="btn btn-primary btn-user btn-block" onclick="searchAddr()" value="주소찾기" required>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" readonly id="addr2" name="addr2" placeholder="주소" required>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="addr3" name="addr3" placeholder="상세주소" required>
                </div>
                <div id="layer" class="col-12 col-md-12">
                </div>
                 <hr>
                <div class="form-group">
                  <textarea class="form-control form-control-user" style="overflow:hidden">
   여러분을 환영합니다.
   ANABADA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
   본 약관은 다양한 ANABADA 서비스의 이용과 관련하여 ANABADA 서비스를 제공하는 ANABADA 주식회사(이하 ‘ANABADA’)와
        			이를 이용하는 ANABADA 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
        			아울러 여러분의 ANABADA 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
        			ANABADA 서비스를 이용하시거나 ANABADA 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,
        			잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
                  </textarea>
                </div>
                <div class="form-group">
                  <div class="custom-control custom-checkbox small">
                    <input type="checkbox" class="custom-control-input" id="customCheck" name= "termsofuse1">
                    <label class="custom-control-label" for="customCheck">ANABADA 이용약관 동의(필수)</label>
                  </div>
                </div>
                <div class="form-group">
                  <textarea class="form-control form-control-user" style="overflow:hidden">
   정보통신망법 규정에 따라 DaFarm에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,개인정보의 보유 및 이용기간을 안내 드리오니
   자세히 읽은 후 동의하여 주시기 바랍니다. 
   1. 수집하는 개인정보
   이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 DaFarm 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 
    				등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, DaFarm는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
                              회원가입 시점에 DaFarm가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
                	- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다.
                	   만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 
                	   추가로 수집합니다.
                	   그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
                	- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
            		   서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
                  </textarea>
                </div>
                <div class="form-group">
                  <div class="custom-control custom-checkbox small">
                    <input type="checkbox" class="custom-control-input" id="customCheck1" name= "termsofuse2">
                    <label class="custom-control-label" for="customCheck1">개인정보 수집 및 이용약관 동의(필수)</label>
                  </div>
                </div>              
                <hr>
                    <button class="btn btn-primary btn-user btn-block" id="btnJoin">회원가입</button>
                <hr>
                <!-- 타계정 가입 -->
                <div class="form-group form-row">
                <a href="index.html" class="btn btn-google btn-user btn-block col-sm-6">
                  <i class="fab fa-google fa-fw"></i> Google계정으로 가입
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block col-sm-6">
                  <i class="fab fa-facebook-f fa-fw"></i> Facebook계정으로 가입
                </a>
                <a href="index.html" class="btn btn-naver btn-user btn-block col-sm-6">
                  <i class="fab fa-facebook-f fa-fw"></i> naver계정으로 가입
                </a>
                <a href="index.html" class="btn btn-kakao btn-user btn-block col-sm-6">
                  <i class="fab fa-facebook-f fa-fw"></i> kakao계정으로 가입
                </a>
                </div>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">비밀번호를 잊으셨나요?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">이미 계정이 있으신가요? 로그인</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<script src="../include/js/park.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>
</html>