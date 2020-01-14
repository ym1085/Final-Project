<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>

<style type="text/css">
   .top1 {height: 450px;padding: 30px;width: 75%;margin: 30px;}
   .top2 {height: 100%;width: 400px;float: left;margin-left: 15px;}
   .top1>img {height: 100%;width: 250px;float: left;}
   .top2>div{border: 1px solid #dfd5d5;width:10px;height:50px;margin-right: 5px;}
   label {padding-left: 15px;line-height: 1.7em;padding-right: 30px;font-family: 맑은고딕;color:#000;}
   #performtitle{text-align: center;font-family: 맑은고딕; font-weight: bold; margin-top: 25px;}
   .type{margin-left:27px;}
   span{color:#000;}
   #home{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;}
   #home>a>img{z-index:-1;margin: 10px 0px 0px 12px;}
   #like{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;}
   #like>a>img{z-index:-1;margin: 10px 0px 0px 12px;}
   #likecount{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;}
   #likecount>div{z-index:-1;text-align: center;line-height: 3.5em; font-weight: 600;}
   div#refundInfo {float: left;width: 140px;height: 63px;z-index:1;margin-top: 115px;}
   div#calandar {width: 420px;height: 389px;position: absolute;top: 162px;left: 1045px; border:1px solid #efcece;} /* 수정필요 */
   #refundInfo>a>img{z-index:-1;margin: 10px 0px 0px 5px;}
   #refundInfosub{font-size: 13px;font-weight: 400;}
   .body{height:100%; padding:30px;width:75%;margin:30px;;border:1px solid #efcece;overflow: hidden;}
   .section {width:70%;height:100%;float:left; padding: 5px 5px 5px 5px;}
   .aside{width:25%;height:100%; border: 1px solid #e8cac8;float:left;margin-left:50px;padding: 5px 5px 5px 5px;}
   img.imgbox {margin: 10px 10px 10px 40px;}
   span.util {padding-left: 60px;}
   ul,li { list-style:none; }
   a{ text-decoration:none; color:#000; }
   .tab { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden; }
   .tab li { float:left; width:33.3%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
   .tab li { display:inline-block; padding:20px; cursor:pointer; }
   .tab li.on { background-color:#eee; color:#f00; }
   .tab_con { clear:both; margin-top:5px; border:1px solid #ddd; }
   .tab_con div { display:none; height:100px; background:#fff; line-height:100px; text-align:center; }

	ul{list-style:none;}
	.tabmenu{width:100%; margin: 0 auto; position:relative; }
	.tabmenu ul li{display:inline-block;width:25%; float:left;  text-align:center; background:#f9f9f9;line-height:40px;}
	.tabmenu label{display:block;width:100%; height:40px;line-height:40px;}
	.tabmenu input{display:none;}
	.tabCon{display:none; text-align:left; padding: 20px;position:absolute; left:0; top:40px; box-sizing:border-box;}
	.tabmenu input:checked ~ label{background:white;border: 0.2px solid red; border-bottom: none;}
	.tabmenu input:checked ~ .tabCon{display:block;}

}
</style>
<script type="text/javascript">
		
</script>

   <!-- 페이지 만들떄마다 복붙 -->
   <div style="width: 13%; float: left; height: 100%;">
      <!-- left side -->
      <aside class="left-sidebar" style="width: 13%;">
         <div class="logo" style="margin-bottom: 63%;">
            <a href="#welcome" style="color: white; 
               font-size: 2.5em; font-family: 'Limelight', cursive;">
               Delight 
            </a>
         </div>
         
         <nav class="left-nav" style="margin-top: 100%;">
            <ul id="nav">
               <li class="active"><a href="#contact-form">Contact Form</a></li>
               <li><a href="#subscription-form">Subscription Form</a></li>
               <li><a href="#video">Video Tutorial</a></li>
               <li><a href="#credit">Source and Credit</a></li>
               <li>
               <div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
            </ul>
         </nav>
      </aside>
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
   <!-- 페이지 만들떄마다 복붙 -->
   <!-- div안에서작업 그외엔 건들지말것 -->
   <div style="width: 87%;float: right;" class="pfdetail">
      
      <!----------구분---------->
      <h1 id="performtitle">공연 제목 영역</h1><br><hr>
      <div class="top1" style="border:1px solid #efcece;">
      <img alt="포스터 이미지 보여주기" src="<c:url value='/resources/images/theater.png' />">
      
      <div class="top2">
         <label id="performplace">공연장소</label>
         <span id="performplace">김포아트홀 기본 공연장</span>
         <br>
         
         <label id="performterm">공연기간</label>
         <span id="performterm">2020.01.17</span>~<span>2020.01.27</span>
         <br>
         
         <label id="limitage">입장연령</label>
         <span id = "limitage">전체관람가</span>
         <br>
         
         <label id="performtime">관람시간</label>
         <span id="performtime">120분</span>
         <br>
         
         <label id="performtype">장 르</label>
         <span id="performtype" class = "type">연 극</span>
         <br>
         
         <label id="ticketprice">티켓가격</label>
         <span id = "ticketprice">전석 30,000원</span>
         <br>
         
         <!-- 홈으로 -->
         <div id="home">
            <a href = "<c:url value = '#'/>">
               <img src="<c:url value ='/resources/images/home2.png'/>">
            </a>
         </div>
         
         <!-- 좋아요 -->
         <div id="like">
            <a href = "<c:url value= '#'/>">
               <img src="<c:url value ='/resources/images/like.png'/>">
            </a>
         </div>
         
         <!-- 좋아요 개수 -->
         <div id="likecount">
            <div>1000</div>
         </div>
         
         <div id="refundInfo">
            <a href = "<c:url value ='#'/>">
               <img src="<c:url value ='/resources/images/pointer.png'/>">
               <span id = "refundInfosub" onclick="showguideBook();">취소/환불안내</span>
            </a>
         </div>
         
         <div id = "calandar">
            <!-- 달력자리 -->
         </div>
      </div>
      </div>
   </div>      
   
   <div style="width: 87%;float: right;" class="pfdetail">
      <div class="body">
         <div class="section">		<!-- 영역만 조절해줌 -->
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon">
					<input type="radio" checked name="tabmenu" id="tabmenu1"> 
					<label for="tabmenu1" style="margin-bottom: 0;">소개</label>
						<div class="tabCon">
						Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been the
							industry's standard dummy text ever since the 1500s, when an
							unknown printer took a galley of type and scrambled it to make a
							type specimen book. It has survived not only five centuries, but
							also the leap into electronic typesetting, remaining essentially
							unchanged. It was popularised in the 1960s with the release of
							Letraset sheets containing Lorem Ipsum passages, and more
							recently with desktop publishing software like Aldus PageMaker
							including versions of Lorem Ipsum.</div>
					</li>
					<li id="tab2" class="btnCon">
					<input type="radio"name="tabmenu" id="tabmenu2"> 
					<label for="tabmenu2" style="margin-bottom: 0;">출연진</label>
						<div class="tabCon">
							It is a long established fact that a
							reader will be distracted by the readable content of a page when
							looking at its layout. The point of using Lorem Ipsum is that it
							has a more-or-less normal distribution of letters, as opposed to
							using 'Content here, content here', making it look like readable
							English. Many desktop publishing packages and web page editors
							now use Lorem Ipsum as their default model text, and a search for
							'lorem ipsum' will uncover many web sites still in their infancy.
							Various versions have evolved over the years, sometimes by
							accident, sometimes on purpose (injected humour and the like).</div>
					</li>
					<li id="tab3" class="btnCon">
					<input type="radio" name="tabmenu" id="tabmenu3"> 
					<label for="tabmenu3" style="margin-bottom: 0;">후기</label>
						<div class="tabCon">
							There are many variations of passages
							of Lorem Ipsum available, but the majority have suffered
							alteration in some form, by injected humour, or randomised words
							which don't look even slightly believable. If you are going to
							use a passage of Lorem Ipsum, you need to be sure there isn't
							anything embarrassing hidden in the middle of text. All the Lorem
							Ipsum generators on the Internet tend to repeat predefined chunks
							as necessary, making this the first true generator on the
							Internet. It uses a dictionary of over 200 Latin words, combined
							with a handful of model sentence structures, to generate Lorem
							Ipsum which looks reasonable. The generated Lorem Ipsum is
							therefore always free from repetition, injected humour, or
							non-characteristic words etc.</div>
					</li>
					<li id="tab4" class="btnCon">
					<input type="radio" name="tabmenu" id="tabmenu4"> 
					<label for="tabmenu4" style="margin-bottom: 0;">장소</label>
						<div class="tabCon">
							Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been the
							industry's standard dummy text ever since the 1500s, when an
							unknown printer took a galley of type and scrambled it to make a
							type specimen book. It has survived not only five centuries, but
							also the leap into electronic typesetting, remaining essentially
							unchanged. It was popularised in the 1960s with the release of
							Letraset sheets containing Lorem Ipsum passages, and more
							recently with desktop publishing software like Aldus PageMaker
							including versions of Lorem Ipsum</div>
					</li>
				</ul>
			</div>
		</div>
      
         
         <div class="aside">
            <h4 style="text-align: center">추천 공연 & 전시</h4>
            <ul>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/theater.png'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 우리연애할까</span><br>
                     </span>
                     <span>
                         <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/theater.png'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 연애의발견</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/theater.png'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 미이라</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/theater.png'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 지킬 앤 하이드</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/theater.png'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 캣츠</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
            </ul>
         </div>
         </div>
      </div>
   <!-- div안에서작업 그외엔 건들지말것 -->   
<%@ include file="../inc/main2Bottom.jsp" %>