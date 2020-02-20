//주소 검색 열어주기
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

//회원정보 수정
window.onload = function(){
	var param="userid="+$("#topuserid").val();
	$.ajax({
		type: "post",
		url: "/BootStrap/member_servlet/view.do",
		data: param,
		success: function(result){
			$("#page-top").html(result);
		}
	});
}
$(function(){
$("#btnUpdate").click(function(){
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()
	+"&email="+$("#email").val()
	+"&hp="+$("#hp").val()
	+"&birthday="+$("#birthday_Year").val()+$("#birthday_Month").val()+$("#birthday_Day").val()
	+"&addr1="+$("#addr1").val()
	+"&addr2="+$("#addr2").val()
	+"&addr3="+$("#addr3").val();
	$.ajax({
		type: "post",
		url: "/BootStrap/member_servlet/update.do",
		data: param,
		error : function(error) {
	        alert("Error!");
	    },
	    success : function(data) {
	        alert("수정완료");
		}
	});
});
});