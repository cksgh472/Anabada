<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    </div>
  </div>
</div>  
  <!-- Footer -->
  <div class="container-fluid">
    <div id="footertoggle">
      <button id="ToggleBottom" class="btn btn-link rounded-circle mr-3" data-toggle="collapse" data-target="#tail_body">
        <i class="fa fa-bars"></i>
      </button>
    </div>
    <div class="tail_body collapse show" id="tail_body">
	  <div class="tail_item flex-shrink-2">
	  <div class="title_tail">CS CENTER</div>
	  <div class="tel">1688-0000</div>
	  <div class="time">
	  <span>WEEK</span> 10:00 ~ 17:00<br><span>LUNCH</span> 12:00 ~ 13:00
	</div>
	<div class="time_info">
	  주말, 공휴일은 휴무입니다.<br>
	  통화량 폭주로 전화연결이 안 될 경우,<br>
	  게시판에 문의 남겨주시면 <br>
	  빠른 처리 해드리겠습니다.<br></div>
	</div>

	<div class="tail_item flex-shrink-2">
	  <div class="title_tail">ACCOUNT INFO</div>
	    <ul class="bank_info">
	      <li><span>농협</span>010-0000-9999-111</li>
	      <li><span>국민</span>00000-123456-123</li>
		  <li><span>우체국</span>000123-02-987654</li>
          <li><span>우리</span>1000-001-999999</li>
		  <li>예금주: ANABADA</li>
		</ul><a href="https://pgweb.uplus.co.kr/" target="_blank"><img src="images/lgup.png" alt=""></a>
	  </div>

	<div class="tail_item flex-shrink-3">
	  <div class="title_tail">RETURN</div>
	    <div class="return_txt">
		  <a href="#">교환/반품 정책 확인</a><br><br>
		   서울 강동구 천호동 000<br>
		   우체국 물류센터<br>
		   ANABADA<br></div>
	    </div>	

	<div class="tail_item flex-shrink-1">
	  <div class="title_tail">WITH US</div>
	    <ul class="shop_info"><li><a href="#"><span>COMPANY</span> <small> 회사소개</small></a></li>
		  <li><a href="#"><span>AGREEMENT</span> <small> 이용약관</small></a></li>
		    <li><a href="#"><span>PRIVACYPOLICY</span> <small> 개인정보처리방침</small></a></li>
			<li><a href="#"><span>GUIDE</span> <small> 이용안내</small></a></li>
		</ul>
		<div class="bsns_wrap">
		  <ul class="sns "><li><a href="https://www.youtube.com" target="_blank"><img src="../project/images/ico_yt.png" alt="youtube"></a></li>
		    <li><a href="https://www.facebook.com" target="_blank"><img src="../project/images/ico_fb.png" alt="facebook"></a></li>
		    <li><a href="https://www.instagram.com" target="_blank"><img src="../project/images/ico_ist.png" alt="insta"></a></li>
		    <li><a href="https://twitter.com" target="_blank"><img src="../project/images/ico_tw.png" alt="twitter"></a></li>
		  </ul>
		</div>
	  </div>

	  <div class="tail_item flex-shrink-0">
	    <div class="title_tail">COMPANY INFO
	    </div>
		  <div class="com_info">
		    상호명: ANABADA |  대표 : 홍길동<br>
		    주소 : 서울시 강동구 천호동 어딘가<br>
		    개인정보관리책임자 : 박찬호 | 이메일: hong@naver.com<br>
		    사업자등록번호 : 000-111-22222 <a href="https://www.ftc.go.kr/" target="_blank">[사업자정보확인]</a><br>
		    통신판매업신고 : 2020-대한민국-0000 <br><br>
		    호스팅 : (주)ANABADA<br>
		   Copyright © ANABADA all rights reserved.
		  </div>
	  </div>
    </div>
    <!-- end tail_body -->
  </div>
  <!-- End of Footer -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃 하시겠습니까?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="${path}/session_servlet/logout.do">로그아웃</a>
        </div>
      </div>
    </div>
  </div>
<script src="../include/js/anabada.js"></script>
<script src="../include/js/jquery.easing.min.js"></script>  
<script src="../include/js/bootstrap.bundle.min.js"></script>
</body>
</html>