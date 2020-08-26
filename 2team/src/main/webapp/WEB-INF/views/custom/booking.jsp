<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 예약 페이지 </title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> <!-- font-family:'NanumSquare', sans-serif; -->
<link href="../resources/css/custom/booking/base.css" rel="stylesheet" type="text/css" />
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="../resources/js/custom/booking/booking.js"></script>

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
						    <div id="reserve2">
							    <script>$("#select_date").text($("#reserve1").val());</script>
							    <!--// 예약날짜 -->
								<div class="calendar-title">
									<a href="javascript:f_ChangeMonth( '20200710' );" class="prev">이전달</a>
									<span>2020 08</span>
									<a href="javascript:f_ChangeMonth( '20200910' );" class="next">다음달</a>
								</div>
					
							<div class="calendar-data">
							<!-- 요일 표시 START -->
							<table>
								<colgroup><col width="14.28%" span="7"></colgroup>
								<thead>
									<tr>
										<th>Sun</th> <th>Mon</th> <th>Tue</th> <th>Wed</th> <th>Thu</th> <th>Fri</th> <th>Sat</th>
									</tr>
								</thead>
								<tbody>
								<!-- 요일 표시 END //-->
								<!-- 일자 표시 START -->
								
	            				<!-- week-start -->
					            <tr>
						            <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
					            	<td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">1</a></td>
					            </tr>
					            <!-- week-end -->
	
					            <!-- week-start -->
								<tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">2</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">3</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">4</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">5</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">6</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">7</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">8</a></td>
					            </tr>
					            <!-- week-end -->
	
					            <!-- week-start -->
					            <tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">9</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">10</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">11</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">12</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">13</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">14</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">15</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">16</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">17</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">18</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200819', 'SD289045', 'Y', '0900' , '수','day19');" id="day19" class="live_red" style="cursor:pointer;">19</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200820', 'SD289054', 'Y', '0900' , '목','day20');" id="day20" class="live_red" style="cursor:pointer;">20</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200821', 'SD289063', 'Y', '0900' , '금','day21');" id="day21" class="live_red" style="cursor:pointer;">21</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200822', 'SD289072', 'Y', '0900' , '토','day22');" id="day22" class="live_red" style="cursor:pointer;">22</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200823', 'SD289081', 'Y', '0900' , '일','day23');" id="day23" class="live_red" style="cursor:pointer;">23</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200824', 'SD289090', 'Y', '0900' , '월','day24');" id="day24" class="live_red" style="cursor:pointer;">24</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200825', 'SD289099', 'Y', '0900' , '화','day25');" id="day25" class="live_red" style="cursor:pointer;">25</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200826', 'SD289108', 'Y', '0900' , '수','day26');" id="day26" class="live_red" style="cursor:pointer;">26</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200827', 'SD289117', 'Y', '0900' , '목','day27');" id="day27" class="live_red" style="cursor:pointer;">27</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200828', 'SD289126', 'Y', '0900' , '금','day28');" id="day28" class="live_red" style="cursor:pointer;">28</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200829', 'SD289135', 'Y', '0900' , '토','day29');" id="day29" class="live_red" style="cursor:pointer;">29</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200830', 'SD289144', 'Y', '0900' , '일','day30');" id="day30" class="live_red" style="cursor:pointer;">30</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200831', 'SD289153', 'Y', '0900' , '월','day31');" id="day31" class="live_red" style="cursor:pointer;">31</a></td>
						            <td class="end"></td> <td class="end"></td> <td class="end"></td> <td class="end"></td> <td class="end"></td>
					            </tr>
					            <!-- week-end -->
					
					            <tr>
									<td>&nbsp;</td>
					            </tr>
								<!-- 일자 표시 END -->
							</tbody>
						</table>
						</div>
						</div>
					</div>
												
					<div class="box">
					    <div class="select-ui li-slt">
					        <h3><a href="#select-list">예약시간</a></h3>
					        <ul id="select-list">
					            <li><a href="#none" name="" id="">17:30</a></li>
					            <li><a href="#none" name="" id="">18:30</a></li>
					            <li><a href="#none" name="" id="">19:30</a></li>
					            <li><a href="#none" name="" id="">20:30</a></li>
					        </ul>
					    </div>					    
					</div>
					<script type="text/javascript">
							$.extend($.fn, {
							    selectUi : function(opts){
	
							        $.fn.selectUi.defaults = {
							            showToTop: false, // list 위에서 보여질때 true, 디폴트는 아래도 나옴
							            arrow : true, // 화살표 활성화 (css class on 으로 설정)
							            duration: 400, // 슬라이드 속도 컨트롤
							            listDuration : 200, // 리스트 항목 클릭 후 사라질 때 속도 컨트롤
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
					</script>	

					
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
					<div class="right">
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
								<strong id="selectDay"></strong>
								<br>
								<span class="sumText"></span>
							</div>
						</div>
						
					</div>
				</div>
			</div> <!-- section end -->	
		</div> <!-- wrapper end -->
	</form>
	
</body>
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 예약 페이지 </title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> <!-- font-family:'NanumSquare', sans-serif; -->
<link href="../resources/css/custom/booking/base.css" rel="stylesheet" type="text/css" />
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="../resources/js/custom/booking/booking.js"></script>

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
						    <div id="reserve2">
							    <script>$("#select_date").text($("#reserve1").val());</script>
							    <!--// 예약날짜 -->
								<div class="calendar-title">
									<a href="javascript:f_ChangeMonth( '20200710' );" class="prev">이전달</a>
									<span>2020 08</span>
									<a href="javascript:f_ChangeMonth( '20200910' );" class="next">다음달</a>
								</div>
					
							<div class="calendar-data">
							<!-- 요일 표시 START -->
							<table>
								<colgroup><col width="14.28%" span="7"></colgroup>
								<thead>
									<tr>
										<th>Sun</th> <th>Mon</th> <th>Tue</th> <th>Wed</th> <th>Thu</th> <th>Fri</th> <th>Sat</th>
									</tr>
								</thead>
								<tbody>
								<!-- 요일 표시 END //-->
								<!-- 일자 표시 START -->
								
	            				<!-- week-start -->
					            <tr>
						            <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
					            	<td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">1</a></td>
					            </tr>
					            <!-- week-end -->
	
					            <!-- week-start -->
								<tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">2</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">3</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">4</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">5</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">6</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">7</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">8</a></td>
					            </tr>
					            <!-- week-end -->
	
					            <!-- week-start -->
					            <tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">9</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">10</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">11</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">12</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">13</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">14</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">15</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">16</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">17</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">18</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200819', 'SD289045', 'Y', '0900' , '수','day19');" id="day19" class="live_red" style="cursor:pointer;">19</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200820', 'SD289054', 'Y', '0900' , '목','day20');" id="day20" class="live_red" style="cursor:pointer;">20</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200821', 'SD289063', 'Y', '0900' , '금','day21');" id="day21" class="live_red" style="cursor:pointer;">21</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200822', 'SD289072', 'Y', '0900' , '토','day22');" id="day22" class="live_red" style="cursor:pointer;">22</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200823', 'SD289081', 'Y', '0900' , '일','day23');" id="day23" class="live_red" style="cursor:pointer;">23</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200824', 'SD289090', 'Y', '0900' , '월','day24');" id="day24" class="live_red" style="cursor:pointer;">24</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200825', 'SD289099', 'Y', '0900' , '화','day25');" id="day25" class="live_red" style="cursor:pointer;">25</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200826', 'SD289108', 'Y', '0900' , '수','day26');" id="day26" class="live_red" style="cursor:pointer;">26</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200827', 'SD289117', 'Y', '0900' , '목','day27');" id="day27" class="live_red" style="cursor:pointer;">27</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200828', 'SD289126', 'Y', '0900' , '금','day28');" id="day28" class="live_red" style="cursor:pointer;">28</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200829', 'SD289135', 'Y', '0900' , '토','day29');" id="day29" class="live_red" style="cursor:pointer;">29</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200830', 'SD289144', 'Y', '0900' , '일','day30');" id="day30" class="live_red" style="cursor:pointer;">30</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200831', 'SD289153', 'Y', '0900' , '월','day31');" id="day31" class="live_red" style="cursor:pointer;">31</a></td>
						            <td class="end"></td> <td class="end"></td> <td class="end"></td> <td class="end"></td> <td class="end"></td>
					            </tr>
					            <!-- week-end -->
					
					            <tr>
									<td>&nbsp;</td>
					            </tr>
								<!-- 일자 표시 END -->
							</tbody>
						</table>
						</div>
						</div>
					</div>
												
					<div class="box">
					    <div class="select-ui li-slt">
					        <h3><a href="#select-list">예약시간</a></h3>
					        <ul id="select-list">
					            <li><a href="#none" name="" id="">17:30</a></li>
					            <li><a href="#none" name="" id="">18:30</a></li>
					            <li><a href="#none" name="" id="">19:30</a></li>
					            <li><a href="#none" name="" id="">20:30</a></li>
					        </ul>
					    </div>					    
					</div>
					<script type="text/javascript">
							$.extend($.fn, {
							    selectUi : function(opts){
	
							        $.fn.selectUi.defaults = {
							            showToTop: false, // list 위에서 보여질때 true, 디폴트는 아래도 나옴
							            arrow : true, // 화살표 활성화 (css class on 으로 설정)
							            duration: 400, // 슬라이드 속도 컨트롤
							            listDuration : 200, // 리스트 항목 클릭 후 사라질 때 속도 컨트롤
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
					</script>	

					
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
					<div class="right">
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
								<strong id="selectDay"></strong>
								<br>
								<span class="sumText"></span>
							</div>
						</div>
						
					</div>
				</div>
			</div> <!-- section end -->	
		</div> <!-- wrapper end -->
	</form>
	
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 예약 페이지 </title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> <!-- font-family:'NanumSquare', sans-serif; -->
<link href="../resources/css/custom/booking/base.css" rel="stylesheet" type="text/css" />
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="../resources/js/custom/booking/booking.js"></script>

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
						    <div id="reserve2">
							    <script>$("#select_date").text($("#reserve1").val());</script>
							    <!--// 예약날짜 -->
								<div class="calendar-title">
									<a href="javascript:f_ChangeMonth( '20200710' );" class="prev">이전달</a>
									<span>2020 08</span>
									<a href="javascript:f_ChangeMonth( '20200910' );" class="next">다음달</a>
								</div>
					
							<div class="calendar-data">
							<!-- 요일 표시 START -->
							<table>
								<colgroup><col width="14.28%" span="7"></colgroup>
								<thead>
									<tr>
										<th>Sun</th> <th>Mon</th> <th>Tue</th> <th>Wed</th> <th>Thu</th> <th>Fri</th> <th>Sat</th>
									</tr>
								</thead>
								<tbody>
								<!-- 요일 표시 END //-->
								<!-- 일자 표시 START -->
								
	            				<!-- week-start -->
					            <tr>
						            <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
					            	<td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">1</a></td>
					            </tr>
					            <!-- week-end -->
	
					            <!-- week-start -->
								<tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">2</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">3</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">4</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">5</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">6</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">7</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">8</a></td>
					            </tr>
					            <!-- week-end -->
	
					            <!-- week-start -->
					            <tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">9</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">10</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">11</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">12</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">13</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">14</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">15</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">16</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">17</a></td>
						            <td class="end" title="예약가능 기간이 아닙니다"><a href="javascript:void(0);" class="">18</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200819', 'SD289045', 'Y', '0900' , '수','day19');" id="day19" class="live_red" style="cursor:pointer;">19</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200820', 'SD289054', 'Y', '0900' , '목','day20');" id="day20" class="live_red" style="cursor:pointer;">20</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200821', 'SD289063', 'Y', '0900' , '금','day21');" id="day21" class="live_red" style="cursor:pointer;">21</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200822', 'SD289072', 'Y', '0900' , '토','day22');" id="day22" class="live_red" style="cursor:pointer;">22</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200823', 'SD289081', 'Y', '0900' , '일','day23');" id="day23" class="live_red" style="cursor:pointer;">23</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200824', 'SD289090', 'Y', '0900' , '월','day24');" id="day24" class="live_red" style="cursor:pointer;">24</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200825', 'SD289099', 'Y', '0900' , '화','day25');" id="day25" class="live_red" style="cursor:pointer;">25</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200826', 'SD289108', 'Y', '0900' , '수','day26');" id="day26" class="live_red" style="cursor:pointer;">26</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200827', 'SD289117', 'Y', '0900' , '목','day27');" id="day27" class="live_red" style="cursor:pointer;">27</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200828', 'SD289126', 'Y', '0900' , '금','day28');" id="day28" class="live_red" style="cursor:pointer;">28</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200829', 'SD289135', 'Y', '0900' , '토','day29');" id="day29" class="live_red" style="cursor:pointer;">29</a></td>
					            </tr>
					            <!-- week-end -->
					
					            <!-- week-start -->
					            <tr>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200830', 'SD289144', 'Y', '0900' , '일','day30');" id="day30" class="live_red" style="cursor:pointer;">30</a></td>
						            <td class="live_red"><a href="javascript:f_SelectDate('20200831', 'SD289153', 'Y', '0900' , '월','day31');" id="day31" class="live_red" style="cursor:pointer;">31</a></td>
						            <td class="end"></td> <td class="end"></td> <td class="end"></td> <td class="end"></td> <td class="end"></td>
					            </tr>
					            <!-- week-end -->
					
					            <tr>
									<td>&nbsp;</td>
					            </tr>
								<!-- 일자 표시 END -->
							</tbody>
						</table>
						</div>
						</div>
					</div>
												
					<div class="box">
					    <div class="select-ui li-slt">
					        <h3><a href="#select-list">예약시간</a></h3>
					        <ul id="select-list">
					            <li><a href="#none" name="" id="">17:30</a></li>
					            <li><a href="#none" name="" id="">18:30</a></li>
					            <li><a href="#none" name="" id="">19:30</a></li>
					            <li><a href="#none" name="" id="">20:30</a></li>
					        </ul>
					    </div>					    
					</div>
					<script type="text/javascript">
							$.extend($.fn, {
							    selectUi : function(opts){
	
							        $.fn.selectUi.defaults = {
							            showToTop: false, // list 위에서 보여질때 true, 디폴트는 아래도 나옴
							            arrow : true, // 화살표 활성화 (css class on 으로 설정)
							            duration: 400, // 슬라이드 속도 컨트롤
							            listDuration : 200, // 리스트 항목 클릭 후 사라질 때 속도 컨트롤
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
					</script>	

					
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
					<div class="right">
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
								<strong id="selectDay"></strong>
								<br>
								<span class="sumText"></span>
							</div>
						</div>
						
					</div>
				</div>
			</div> <!-- section end -->	
		</div> <!-- wrapper end -->
	</form>
	
</body>
>>>>>>> refs/heads/mypage
>>>>>>> refs/heads/newMaster
</html>