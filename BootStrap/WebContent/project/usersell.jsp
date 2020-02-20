<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp"%>
<style type="text/css">
#preImage{
	width: 100%;
	height: auto;
}
</style>
<script>
$(function() {
    $("#file0, #file1").on('change', function(){
        readURL(this);
    });
    
    $("#file1").on('change', function(){
   	 if(window.FileReader){
   	 var filename = $(this)[0].files[0].name;
   	 } else {
   	 var filename = $(this).val().split('/').pop().split('\\').pop();
   	 }
   	 $("#userfile1").val(filename);
   	 });
    
    $("#file0").on('change', function(){  // 값이 변경되면
   	 if(window.FileReader){  // modern browser
   	 var filename = $(this)[0].files[0].name;
   	 } else {  // old IE
   	 var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
   	 }
   	 // 추출한 파일명 삽입
   	 $("#userfile").val(filename);
   	 });
    
    $('#price, #delprice').on('keyup',function(){
  	  var sum1 = parseInt($("#price").val() || 0);
  	  var sum2 = parseInt($("#delprice").val() || 0);
  	  var sum = sum1 + sum2;
  	  $("#totalprice").val(sum);
  	});    
    
    $('[data-toggle="tooltip"]').tooltip();
    
    $("#btnSave").click(function(){
		document.user.submit();
	});
});

function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#preImage').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
}

var menu0 = new Array("==상품분류==","");
var menu1 = new Array("스마트폰","태블릿PC","노트북","카메라","음향가전/학습기기","게임/타이틀","웨어러블","영상가전","생활/주방/미용가전","자동차기기","기타전자기기");
var menu2 = new Array("문구/사무용품","화방용품","악기","피규어");
var menu3 = new Array("캠핑","등산","골프","자전거/오토바이","자동차","스키/보드","낚시","수영/헬스/요가","스케이트/보드/롤러","축구/야구/농구","기타스포츠용품");
var menu4 = new Array("지류/카드상품권","공연/티켓","모바일쿠폰/상품권","여행/항공권","레저이용권");
var menu5 = new Array("신발","여성가방","남성가방","지갑","시계","주얼리","모자","여행용가방/소품","기타잡화");
var menu6 = new Array("자동차용품","주방용품","세탁용품","수납/정리용품","공구","애완","식품");
var menu7 = new Array("스킨케어","선케어","베이스메이크업","색조메이크업","클렌징","마스크/팩","헤어케어","헤어스타일링","바디케어","네일케어","남성화장품","향수","뷰티소품");
var menu8 = new Array("도서","음반/DVD");
var menu9 = new Array("침실가구","거실/주방가구","수납가구","침구단품","커튼","서재/사무용가구","DIY자재/용품","침구세트","아동/주니어가구","인테리어소품","베개/솜류","수예","카페트/러그");
var menu10 = new Array("여성의류","남성의류","언데웨어/잠옷");
var menu11 = new Array("유모차/카시트","완구/교육/교구","수유/이유용품","외출용품","유아가구","목욕/스킨케어","위생/건강/세제","임부복","유아동의류/잡화","안전용품","기저귀/물티슈","분유/이유식/간식");
var menu12 = new Array("명품가방","명품지갑","명품신발","명품액세서리");

function changeItem(item){
    var temp, i=0, j=0;
    var count, select;
    temp = document.user.categories_detail;
    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('count = menu' + item + '.length');
    for (j=0 ; j<count ; j++) {
        eval('select = menu' + item + '[' + j + '];');
        temp.options[j]= new Option(select,select); 
    }
    temp.options[0].selected=true;
    return true;
}

var acount = 0;
function fileFields() {
	 var x = document.getElementById('fileAdd');
	 x.onclick = function() {
 		if(acount < 4){
 		  var i = parseFloat(this.lastChild.name)+1;
 		  input = document.createElement("input");
 		  input.setAttribute("type", "file");
 		  input.setAttribute("name", i);
 		  input.setAttribute("id", 'file'+i);
 		  input.setAttribute("class", "mb-3 col-12 col-sm-6");
 		  this.appendChild(input);
 		  acount++;
 		}
	 }
}

function addLoadEvent(func) {
 var oldonload = window.onload;
 if (typeof window.onload != 'function') {
   window.onload = func;
 } else {
   window.onload = function() {
     if (oldonload) {
       oldonload();
     }
     func();
   }
 }
}

addLoadEvent(function() {
 fileFields();
});
</script>
</head>
<%@ include file="../include/body_sidetop.jsp" %>
  <!-- ======================================Page Heading====================================== -->
  <div id="listview"></div>
    <div class="container" id="hide">
    <div class="card o-hidden border-0 shadow-lg my-3">
      <div class="card-body p-0">
      
        <!-- Nested Row within Card Body -->
        <div class="d-flex">
          <div class="col-lg-12">
            <div class="p-1 p-md-5">
              <div class="text-center">
                <h1 class="h2 text-gray-900 mb-4">물품 등록하기</h1>
              </div>
              <hr>
              <form class="user" name="user" method="post" enctype="multipart/form-data" action="${path}/products_servlet/insert.do">
              <input type="hidden" id="writer" name="writer" value="${sessionScope.userid}">
              <div class="col-10 col-md-6 mx-auto text-center">
                <img id="preImage" src="images/imgupload.png" alt="" onerror=''>
              </div>
              <hr>
                <!-- 이미지 파일 업로드(최소2개) -->
                <div class="input-group">
			        <h1 class="h5 mb-3 col-12">이미지 파일 업로드<small> (이미지 파일은 최소 2개이상 업로드 해야합니다.)</small></h1>                	
                    <div class="input-group-large mb-3 col-12 col-md-6">
					<input id="file0" type="file" name="file0" data-class-button="btn btn-default" data-class-input="form-control" 
					data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" 
					style="position: absolute; clip: rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group">
					<input type="text" id="userfile" class="form-control" readonly>
					<span class="group-span-filestyle input-group-btn" tabindex="0">
					<label for="file0" class="btn btn-primary">
					<span class="glyphicon fa fa-upload"></span>
					</label>
					</span>
					</div>
					</div>
					<div class="input-group-large mb-3 col-12 col-md-6">
					<input id="file1" name="file1"type="file" data-class-button="btn btn-default" data-class-input="form-control" 
					data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" 
					style="position: absolute; clip: rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group">
					<input type="text" id="userfile1" class="form-control" name="userfile1" readonly>
					<span class="group-span-filestyle input-group-btn" tabindex="0">
					<label for="file1" class="btn btn-primary">
					<span class="glyphicon fa fa-upload"></span>
					</label>
					</span>
					</div>
					</div>
		        </div>
		        <div class="input-group">
		           <h1 class="h5 col-12">이미지 파일 추가<small> (파일은 최대 6개까지 업로드 가능합니다.)</small></h1>
		           <a href="#" id="fileAdd" class="col-12"><button type="button" name="1" class="mb-3 input-group-lg col-12">추가</button></a>
					</div>

                <hr>
                <!-- 카테고리 분류 -->
                <div class="input-group mb-0">
                <div class="input-group input-group-lg col-12 col-sm-6 col-lg-4 mb-3 mb-sm-0">
				<select class="custom-select user-sell-input" name="categories" id="categories" onChange=javascript:changeItem(document.user.categories.options.selectedIndex); >
				  <option value="==상품분류==" selected>==상품분류==</option>
				  <option value="전자제품">전자제품</option> 
				  <option value="완구/문구/취미">완구/문구/취미</option>
				  <option value="스포츠/레저">스포츠/레저</option>
				  <option value="여행/문화">여행/문화</option>
				  <option value="패션잡화">패션잡화</option>
				  <option value="생활/건강">생활/건강</option>
				  <option value="화장품/미용">화장품/미용</option>
				  <option value="도서/음반/DVD">도서/음반/DVD</option>
				  <option value="가구/인테리어">가구/인테리어</option>
				  <option value="패션의류">패션의류</option>
				  <option value="유아동/출산">유아동/출산</option>
				  <option value="해외명품">해외명품</option>
				</select>
				</div>
				<div class="input-group input-group-lg col-12 col-sm-6 col-lg-4">
				<select class="custom-select user-sell-input" id="categories_detail" name="categories_detail">
				  <option selected value="">==세부분류==</option>
				  <option value=""></option>
				</select>
				</div>
				</div>
				<hr>
                <div class="input-group input-group-lg col-12">
				    <div class="input-group-prepend">
				      <span class="input-group-text">제목</span>
				    </div>
				    <input type="text" class="form-control" id="subject" name="subject">
				  </div>
                <hr>
                 <div class="input-group mb-3 input-group-lg col-12">
				    <div class="input-group-prepend">
				      <span class="input-group-text">내용</span>
				    </div>
				    
				     <textarea rows="5" class="form-control" name="content" id="content" 
				     placeholder="카카오 아이디 등 메신저 아이디, 연락처를 기재해 외부 거래 (직접 계좌 송금)를 유도할 경우 사기 거래로 신고를 당하실 수 있습니다."></textarea>
				  </div>
				  <div class="input-group text-center mb-3">
				  <div class="input-group input-group-lg col-12 col-md-6 col-lg-4 mb-1">
				    <div class="input-group-prepend">
				      <span class="input-group-text">상품가격</span>
				    </div>
				    <input type="text" class="form-control user-sell-input num_only num_comma num_sum" data-toggle="tooltip" 
				    data-placement="top" title="원하시는 가격을 숫자만 입력해주세요" id="price" name="price">
				  </div>
				  <div class="input-group input-group-lg col-12 col-md-6 col-lg-4 mb-1">
				    <div class="input-group-prepend num_only num_comma num_sum">
				      <span class="input-group-text">배송비</span>
				    </div>
				    <input type="text" class="form-control user-sell-input" data-toggle="tooltip" 
				    data-placement="top" title="원하시는 가격을 숫자만 입력해주세요" id="delprice" name="delprice">
				  </div>
				  <div class="input-group input-group-lg col-12 col-md-12 col-lg-4 mb-1">
				    <div class="input-group-prepend num_only num_comma num_sum">
				      <span class="input-group-text">합계</span>
				    </div>
				    <input type="text" class="form-control user-sell-input" id="totalprice" name="totalprice" value="" readonly>
				  </div>
				  </div>
				  <div class="input-group">
				  <div class="input-group input-group-lg col-12 col-lg-4 mb-3">
				    <div class="input-group-prepend">
				      <span class="input-group-text">비밀번호</span>
				    </div>
				    <input type="password" class="form-control user-sell-input" data-toggle="tooltip" name="passwd" id="passwd"
				    data-placement="top" title="게시글 수정 및 삭제에만 이용됩니다.">
				  </div>
				  </div>
				  
				  <div class="custom-control custom-switch ml-3">
				    <input type="checkbox" class="custom-control-input input-group-large" id="new" name="new">
				    <label class="custom-control-label" for="new" data-toggle="tooltip" 
				    data-placement="top" title="미개봉일 경우만 활성화!">새상품</label>
				    
				  </div>
			    <hr>
			       <div class="input-group col-12">
                   <div class="col-12 col-md-6 col-sm-6 mb-3 mb-sm-0">
                   <button class="btn btn-outline-secondary btn-user btn-block" id="btnCancle">취소</button>
                   </div>
					<div class="col-12 col-md-6 col-sm-6 mb-1">
                   <button class="btn btn-outline-primary btn-user btn-block" id="btnSave">등록</button>
                   </div>
                   </div>
			      </form>
			    </div>
		      </div>
            </div>
          </div>
        </div>
      </div>
<%@ include file="../include/body_footer.jsp" %>