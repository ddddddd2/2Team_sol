<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 예약 페이지 </title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> <!-- font-family:'NanumSquare', sans-serif; -->
<link href="../resources/css/custom/index/base.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/custom/booking/booking.css" rel="stylesheet" type="text/css" />

<!-- 예약날짜(Calendar) datepicker 관련 Start -->
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/custom/booking/calendar.css" rel="stylesheet" type="text/css" />
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<!-- End -->

</head>
<body>	 
	<form class="container" name="frm" title="예약정보입력" method="post" action="">	
		<div class="wrapper"> <!-- wrapper start -->
			<div class="h2-title">
				<h2> 예약정보 입력 </h2>
			</div>	
						
			<div class="section"> <!-- section start -->
				<div class="inner clear">
					<div class="left">
						<div class="box">	
						    <h3 class="icon1">예약날짜 선택</h3><!-- 예약날짜 선택 -->						    
						    <div id="calendar">						    	
									<div id="datepicker"></div>							
							</div>
						</div>
											
						<div class="box">
							<h3 class="menu"> 메뉴 </h3>
							<input type="text" title="요청사항" name="request" id="request" placeholder="요청사항을 적어주세요">
						</div>
						
						<div class="box">
							<h3 class="request"> 요청사항 </h3>
							<input type="text" title="요청사항" name="request" id="request" placeholder="요청사항을 적어주세요">
						</div>
					</div>
				</div>						
				
				<!-- right 영역 -->
				<div class="inner clear">
					<div class="right"> <!-- float right 영역 Start  -->
						<div class="box">
							<h3 class="icon2">예약자 정보</h3>
							<ul class="person">
								<li>
									<h4>예약자 이름</h4>
									<input type="text" title="예약자 이름" name="name" id="name" placeholder="예약자명">
								</li>
								<li>
									<h4>휴대폰 번호</h4>								
									<input type="text" title="휴대폰번호" name="phone" id="phone" placeholder="010-1234-1234">
								</li>
							</ul>
						</div>
					
						<div class="box">
							<h3 class="agree-info">
								<input type="checkbox" name="agree" id="agree">
								<label for="agree">개인정보의 제 3자 제공, 위탁 동의</label>
							</h3>
							<div class="agree-box" id="agree-box">
								<p>개인정보의 제 3자 제공, 위탁 동의</p><br>
								<p>“한국정보통신주식회사”(이하 “회사”)는 이용자의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호에 관한 법률" 및 “개인정보보호법”과 “전자상거래 등에서의 소비자 보호에 관한 법률”을 준수하고 있습니다. 회사는 이용자의 개인정보를 [개인정보의 수집목적]에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 제공 또는 위탁하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. - 이용자가 사전에 동의한 경우(이용자가 사전에 동의한 경우란, 서비스 이용 등을 위하여 이용자가 자발적으로 자신의 개인정보를 제3자에게 제공 및 위탁하는 것에 동의하는 것을 의미합니다). - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 이러한 경우에도, 회사는 이용자에게 (1) 개인정보를 제공받는 자, (2) 그의 이용목적, (3) 제공되는 개인정보의 항목, (4) 개인정보의 보유 및 이용기간을 사전에 고지하고 이에 대해 명시적ㆍ개별적으로 동의를 얻습니다. 이와 같은 모든 과정에 있어서 회사는 이용자의 의사에 반하여 추가적인 정보를 수집하거나, 동의의 범위를 벗어난 정보를 제3자와 공유하지 않습니다.</p><br>
								<p>1.개인정보의 제 3자 제공 및 위탁 회사는 아래와 같이 이용자로부터 수집한 개인정보를 제3자에게 제공 및 위탁 합니다.</p><br>
								<p>가. 결제수단 사업자 - 신용카드: 신용카드사(KB국민, 비씨, 롯데, 삼성, NH농협, 현대, 외환, 신한, 하나SK), 은행계열 카드사, 부가통신사업자(VAN) 등</p>
								<p>1) 개인정보를 제공 및 위탁 받는 자의 개인정보 이용 목적 : 본인 인증, 거래승인, 요금정산을 위한 거래정보전송, 수납 등 요금 정산 관련 업무</p>
								<p>2) 결제수단별 제공하는 개인정보의 항목</p>
								<p>(신용카드) 이용자의 서비스 거래정보(신용카드번호, 이용 상점 정보, 상품명, 주문금액 등)</p>
								<p>3) 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간</p>
								<p>: 해당 사업자가 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음. 단, 법령의 규정에 의한 거래 내역 등을 보관(건당 거래금액이 1만원 이하의 경우 1년, 1만원 초과의 경우 5년)</p>
								<p>나. 법원, 국세청, 검찰청, 경찰청 </p><br>
								<p>다. 이용자의 거래 상대방</p>
								<p>1) 개인정보를 제공받는 자의 개인정보 이용 목적 </p>
								<p>: 거래 승인 확인, 취소 및 환불, 거래 대금의 정산, 거래 확인 요청에 대한 응대 및 확인</p>
								<p>2) 제공하는 개인정보의 항목 </p>
								<p>: 이용자의 서비스 거래 정보(각 결제 수단의 거래 승인 여부, 거래 승인 실패 원인, 결제 일시, 결제금액 등)</p>
								<p>3) 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 </p>
								<p>: 법령의 규정에 의한 거래 내역을 보관(건당 거래금액이 1만원 이하의 경우 1년, 1만원 초과의 경우 5년)</p>
							</div>
						</div>
						
						<div class="box">
							<h3 class="bs">
								<span>결제 예정금액</span><!-- 결제 예정금액 --> 
								<strong class="price total" id="">0원</strong><!-- 0원 -->
							</h3>
							<div class="summary" title="전체요약">
								<strong id="date"></strong>
								<input type="hidden" id="date2" value=""/>
								<br>
								<span class="sumText"></span>
							</div>
						</div>
						
						<div class="box">
						    <div class="select-ui li-slt">
								<h3><a href="#select-list">결제 수단을 선택하세요.</a></h3>
						        <ul id="select-list">
						            <li><a href="#none" id="">무통장입금</a></li>
						            <li><a href="#none" id="">신용카드</a></li>
						            <li><a href="#none" id="">카카오페이</a></li>
						        </ul>
						    </div>					    
						</div>					
						<script type="text/javascript"> /* 결제수단 리스트 스크립트 Start */
							$.extend($.fn, {
							    selectUi : function(opts){
	
							        $.fn.selectUi.defaults = {
							            showToTop: false, // list 위에서 보여질때 true, 디폴트는 아래도 나옴
							            arrow : true, // 화살표 활성화 (css class on 으로 설정)
							            duration: 400, // 슬라이드 속도 컨트롤
							            listDuration : 400, // 리스트 항목 클릭 후 사라질 때 속도 컨트롤
							            listItems :7, // 리스트 항목의 보여줄 갯수 설정
							            listWid : false, // 리스트 width 값이 클때 true로 설정 후 아래의 listWidVal 값으로 width 설정 (두가지 옵션은 셋트임)
							            listWidVal : 200
							        };
	
							        return this.each(function(){
	
							            opts = $.extend( {}, $.fn.selectUi.defaults, opts || {});
	
							            var _self = $(this),
							                target = _self.find('h3 > a');
							                list = _self.find('ul');
	
	
							            function listHide(drt) {
							                list.slideUp(drt)
							            }
	
							            function rmClass() {
							                if(opts.arrow) {
							                    target.removeClass('on')
							                }
							            }
	
							            target.on('click', function(){
	
							                if(list.is(':hidden')) {
							                    list.slideDown(opts.duration);
							                    var liHeight = list.find('li a').innerHeight();
							                    list.css({'max-height': (liHeight * opts.listItems) - 5 });
							                    if(opts.arrow) {
							                        $(this).addClass('on')
							                    }
							                } else {
							                    listHide(opts.duration);
							                    rmClass();
							                }
							                return false;
							            });
	
							            list.on('click','li a', function(){
							                listHide(opts.listDuration);
							                var clkText = $(this).text();
							                target.text(clkText);
							                rmClass();
							            });
	
							            if(opts.showToTop) {
							                list.css({bottom:50})
							            } else {list.css({top:50})}
	
							            if(opts.listWid) {
							                list.css({width: opts.listWidVal})
							            }
	
							            /* 셀렉터 컴포넌트를 벗어났을 때 */
							            _self.on({
							                'mouseleave' : function() {
							                    listHide(opts.duration);
							                    rmClass();
							                }
							            })
	
							        })
							    }
							});
							$('.li-slt').selectUi();		
					</script> <!-- 결제수단 리스트 스크립트 End -->

						<div class="payment"> 
							<a href="#" id="send_money"> 결제하기 </a>
						</div>										
						<script> /*  pay 결제 스크립트 영역 Start  */
						$('#send_money').click(function(){
							var IMP = window.IMP;
							IMP.init('imp33520161');
							IMP.request_pay({
							    pg : 'html5_inicis',
							    pay_method : 'vbank',
							    merchant_uid : 'merchant_' + new Date().getTime(),
							    name : '주문명:결제테스트',
							    amount : 1,
							    buyer_email : 'iamport@siot.do',
							    buyer_name : '구매자이름',
							    buyer_tel : '010-1234-5678',
							    buyer_addr : '서울특별시 강남구 삼성동',
							    buyer_postcode : '123-456'
							}, function(rsp) {
						    	if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다.';
						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
							    };
							});
						});
					</script> <!-- pay 결제 스크립트 영역 End -->
					</div> <!-- float right 영역 End  -->
				</div>
			</div> <!-- section end -->
		</div> <!-- wrapper end -->		
	</form>
</body>
</html>