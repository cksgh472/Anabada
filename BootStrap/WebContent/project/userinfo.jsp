<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnUpdate").click(function(){
		document.userinfo.submit();
	});

});
var element_layer = document.getElementById('layer');
//주소 검색 닫아주기
function closeDaumPostcode() {
	//iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
}
	function searchAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);

               $("[name=addr1]").val(data.zonecode);
               $("[name=addr2]").val(fullRoadAddr);
               element_layer.style.display = 'none';
               document.getElementById("addr3").focus();
               
                /*document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           },
        width : '100%',
        height : '100%'
        }).embed(element_layer);
        element_layer.style.display = 'block';
        initLayerPosition();
    }
//팝업창 세부 설정
function initLayerPosition() {
var width = 300; //우편번호서비스가 들어갈 element의 width
var height = 460; //우편번호서비스가 들어갈 element의 height
var borderWidth = 1; //샘플에서 사용하는 border의 두께
//위에서 선언한 값들을 실제 element에 넣는다.
element_layer.style.height = height + 'px';
element_layer.style.border = borderWidth + 'px solid';
//실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
element_layer.style.width = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'rem';
}
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
  <!-- ======================================Page Heading====================================== -->
  <div class="container">
    <div class="card o-hidden border-0 shadow-lg my-3">
      <div class="card-body p-0">
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h2 text-gray-900 mb-4">내정보 수정</h1>
              </div>
              <hr>
              <form class="user">
              <div class="justify-content-center row">
                <img class="rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/200x200">
              </div>
              <div class="form-group justify-content-center row">
                <div class="col-6 col-sm-4 col-md-3 col-lg-1 mb-sm-0">
                <button class="btn btn-primary btn-s btn-block btn-icon-split">수정</button>
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg-1 mb-sm-0">
                <button class="btn btn-primary btn-s btn-block btn-icon-split">삭제</button>
                </div>
                </div>
                </form>
                <hr>
              <form class="user" id="userinfo" name="userinfo" method="post" action="${path}/member_servlet/update.do">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" readonly id="userid" name="userid" placeholder="아이디" value="${dto.userid}">
                  </div>
                  <div class="col-sm-6 mb-md-0">
                    <input type="text" class="form-control form-control-user" readonly name="name" placeholder="이름" value="${dto.name}">
                  </div>
                </div>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="hidden" class="form-control form-control-user" name="passwd" placeholder="비밀번호" value="${dto.passwd}">
                  </div>
                  <div class="col-sm-6">
                    <input type="hidden" class="form-control form-control-user" id="passwdcheck" placeholder="비밀번호 확인" value="${dto.passwd}">
                  </div>
                <div class="form-group row">
                  <div class="col-md-6 mb-3 mb-md-0">
                  <input type="email" class="form-control form-control-user" name="email" placeholder="메일주소를 입력하세요" value="${dto.email}">
                  </div>
                  <div class="col-md-6">
                    <input type="text" class="form-control form-control-user" name="hp" placeholder="휴대폰 ex) 010-1234-5678" value="${dto.hp}">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-4 mb-3 mb-sm-0">
                  <c:set var="birthday" value="${dto.birthday}"/>
                  <input type="text" class="form-control form-control-user" name="birthday_Year" placeholder="출생년도" value="${fn:substring(birthday, 0,4)}">
                  </div>
                  <div class="col-sm-3 mb-sm-0 col-6">
                  <input type="text" class="form-control form-control-user" name="birthday_Month" placeholder="월" value="${fn:substring(birthday, 4,6)}">
                  </div>
                  <div class="col-sm-3 mb-sm-0 col-6">
                  <input type="text" class="form-control form-control-user" name="birthday_Day" placeholder="일" value="${fn:substring(birthday, 6,8)}">
                  </div>
                </div>
                <div class="form-group row">
			      <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3 mb-sm-0" >
                  <input type="text" class="form-control form-control-user btn-m" readonly id="addr1" name="addr1" value="${dto.addr1}">
                  </div>
                  <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-sm-0">
                  <input type="button" class="btn btn-primary btn-user btn-block btn-m" onclick="searchAddr()" value="주소찾기">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" readonly id="addr2" name="addr2" placeholder="주소" value="${dto.addr2}">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="addr3" name="addr3" placeholder="상세주소" value="${dto.addr3}">
                </div>
                <div id="layer" class="col-12 col-md-12">
                </div>
                 <hr>
                 <div class="form-group row">
                   <div class="col-12 col-md-6 col-sm-6 mb-3 mb-sm-0">
                   <button class="btn btn-primary btn-user btn-block" id="btnCancle">취소</button>
                   </div>
					<div class="col-12 col-md-6 col-sm-6">
                   <button class="btn btn-primary btn-user btn-block" type="button" id="btnUpdate">수정</button>
                   </div>
                   </div>
                 <hr>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div><!-- end container -->
<%@ include file="../include/body_footer.jsp" %>