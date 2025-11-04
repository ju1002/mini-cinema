<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Body CSS -->
<style>

/* 박스오피스 섹션 */
.prod-box-1 {
    background: black;
    min-height: 821px;
    padding-bottom: 50px;
}

.prod-box-1 > .menu-box-1 > ul > li > a {
    padding: 30px;
    padding-top: 80px;
    color: darkgray;
}

.prod-box-1 > .menu-box-1 > ul > li.active > a {
    color: #FFF;
}

.prod-box-1 > .menu-box-1 > ul > li > a {
    position: relative;
}

.prod-box-1 > .menu-box-1 > ul > li > a::after {
    content: "";
    position: absolute;
    bottom: 20px;
    right: 20px;
    width: calc(100% - 70px);
    height: 3px;
    background-color: #FF1744;
    display: none;
}

.prod-box-1 > .menu-box-1 > ul > .dd > a::after {
    width: calc(100% - 42px);
}

.prod-box-1 > .menu-box-1 > ul > .dc > a::after {
    width: calc(100% - 67px);
}

.prod-box-1 > .menu-box-1 > ul > li.active > a::after {
    display: block;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item .img-box {
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    width: 245px;
    height: 352px;
    position: relative;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > .sun {
    display: none;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun {
    display: block;
    position: absolute;
    width: 245px;
    height: 352px;
    top: 0;
    background-color: rgba(0,0,0,0.8);
    color: white;
    font-size: 13px;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun > div:nth-child(1) {
    margin-top: 20px;
    font-size: 15px;
    margin-left: 20px;
    margin-right: 20px;
    height: 195px;
    font-weight: 200;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun > div:nth-child(2) {
    border-top: 1px solid #FFF;
    margin-top: 85px;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun > div:nth-child(2) > .pre > .number {
    padding-left: 65px;
    display: block;
    font-weight: bold;
    margin-top: 3px;
    font-size: 24px;
    color: #59BEC9;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun > div:nth-child(2) > .pre > .tit {
    margin-left: 10px;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun > div:nth-child(2) > span {
    font-size: 25px;
    font-weight: bold;
    padding-left: 18px;
    vertical-align: text-bottom;
    line-height: 34px;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun > div:nth-child(2) > .pree > .number {
    color: #C698F4;
    padding-right: 68px;
    margin-top: 3px;
    font-weight: bold;
    font-size: 24px;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item:hover > .sun > div:nth-child(2) > .pree > .tit {
    margin-right: 10px;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > .img-box::after {
    content: "";
    display: block;
    padding-top: 100%;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li:first-child {
    margin-right: 5px;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li > .t {
    display: none;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li:hover > .t {
    display: block;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li:hover > .t > h4 {
    color: red;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li:hover > .g {
    display: none;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li > a > h4 {
    color: #FFF;
    width: 79px;
    height: 36px;
    text-align: center;
    border: 1px solid #FFF;
    border-radius: 5px;
    font-weight: 300;
    font-size: 13px;
    padding-top: 5px;
    margin: 0;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li:last-child:hover > a > h4 {
    background: #037B94;
    font-weight: bold;
}

.prod-box-1 > .my-carousel-box-1 > .owl-carousel .owl-stage-outer .owl-stage .owl-item .item > ul > li:last-child > a > h4 {
    width: 159px;
    height: 36px;
    border-radius: 5px;
    padding-top: 5px;
    font-size: 13px;
    color: #FFF;
    text-align: center;
    font-weight: 300;
    border: 1px solid #037B94;
}

.owl-theme .owl-dots .owl-dot span {
    opacity: 0;
}

/* 중간바 */
.middle-bar .menu-box-1 {
    margin-right: 50px;
    margin-bottom: -190px;
}

.middle-bar .menu-box-1 > ul > li {
    vertical-align: middle;
}

.middle-bar .menu-box-1 > ul > li > ul::before {
    content: "";
    display: block;
    position: absolute;
    bottom: 100%;
    left: 0;
    width: 100%;
}

.middle-bar .menu-box-1 > ul > li > ul {
    top: calc(100% + 10px);
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    display: block;
    white-space: nowrap;
}

.middle-bar .menu-box-1 > ul > li > ul > li {
    display: inline-block;
    float: none;
    width: 275px;
    line-height: 80px;
}

.middle-bar .menu-box-1 > ul > li > ul > li:hover > a {
    color: red;
}

.middle-bar .menu-box-1 > ul > li > ul > li > a {
    background-color: rgba(255,255,255,0.1);
    color: white;
    font-weight: lighter;
    font-size: 15px;
    position: relative;
}

.middle-bar .menu-box-1 .input-text {
    width: 100%;
    height: 100%;
    border: 0;
    background-color: transparent;
    color: #fff;
}

.middle-bar .menu-box-1 > ul > li > ul > li > a > .input-text {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
}

.middle-bar .menu-box-1 > ul > li > ul > li:not(:last-child) > a::after {
    content: "";
    background-color: darkgray;
    display: block;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 0;
    width: 0.6px;
    height: 40px;
}

/* 이벤트바 */
.gfd {
    background-color: #fdfcf0;
    margin-top: 150px;
    padding-top: 20px;
    padding-bottom: 20px;
}

h3 {
    height: 41px;
    margin: 30px 0 15px;
    background: url(http://img.cgv.co.kr/R2014/images/common/bg/bg_h3_line.jpg) repeat-x 0 50%;
    line-height: 41px;
    text-align: center;
    font-weight: 500;
}

/* 메인그리드 */



.main-grid {
    background-color: #fdfcf0;
}

.main-grid > div {
    position: relative;
    top: 50px;
    height: 700px;
    cursor: pointer;
}

.main-grid .grid-box div {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.main-grid .grid-box > .grid-item1 {
    width: 240px;
    height: 200px;
}

.main-grid .grid-box > .grid-item2 {
    position: absolute;
    left: 310px;
    width: 240px;
    height: 200px;
}

.main-grid .grid-box > .grid-item3 {
    position: absolute;
    width: 240px;
    height: 200px;
    left: 630px;
}

.main-grid .grid-box > .grid-item4 {
    position: absolute;
    width: 240px;
    height: 200px;
    left: 940px;
}

.main-grid .grid-box > .grid-item5 {
    position: absolute;
    top: 250px;
    left: 0;
    z-index: 10;
    width: 240px;
    height: 273px;
    padding: 3px;
    text-align: center;
    border: 3px solid #241d1e;
}

.main-grid .grid-box > .grid-item5 > div {
    position: absolute;
    width: 226px;
    height: 259px;
    border: 1px solid #241d1e;
    margin-left: 3px;
    margin-top: 3px;
}

.main-grid .grid-box > .grid-item6 {
    position: absolute;
    width: 486px;
    height: 273px;
    top: 250px;
    left: 350px;
}

.main-grid .grid-box > .grid-item7 {
    position: absolute;
    top: 250px;
    z-index: 10;
    width: 240px;
    height: 273px;
    padding: 3px;
    text-align: center;
    border: 3px solid #241d1e;
    left: 940px;
}

.main-grid .grid-box > .grid-item7 > div {
    position: absolute;
    width: 226px;
    height: 259px;
    border: 1px solid #241d1e;
    margin-left: 3px;
    margin-top: 3px;
}

.main-grid .grid-box .grid-item-base {
    position: relative;
    background-position: center;
    background-size: cover;
}

@keyframes size-up-down-1 {
    0% {
        transform: scale(1);
    }
    50% {
        opacity: 1;
        transform: scale(1.05);
    }
    100% {
        transform: scale(1);
    }
}

.main-grid .grid-box .grid-item-hover {
    text-align: center;
    vertical-align: middle;
}

.main-grid .grid-box div .grid-item-hover {
    display: none;
}

.main-grid .grid-box div:hover .grid-item-hover {
    display: block;
    animation-name: size-up-down-1;
    animation-duration: .3s;
    animation-iteration-count: 1;
    z-index: 100;
}

.main-grid .grid-box .grid-item1 .grid-item-hover-table,
.main-grid .grid-box .grid-item2 .grid-item-hover-table,
.main-grid .grid-box .grid-item3 .grid-item-hover-table,
.main-grid .grid-box .grid-item4 .grid-item-hover-table,
.main-grid .grid-box .grid-item5 .grid-item-hover-table,
.main-grid .grid-box .grid-item6 .grid-item-hover-table,
.main-grid .grid-box .grid-item7 .grid-item-hover-table {
    background-color: rgba(0,0
    ,0,0.7);
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.main-grid .grid-box .grid-item1 .grid-item-hover-table .hover-title-1 {
    display: inline-block;
    font-size: 16px;
    font-weight: 500;
    color: #ffffff;
    border-bottom: 1px solid #ffffff;
    padding-bottom: 3px;
}

.main-grid .grid-box .grid-item1 .grid-item-hover-table .hover-text-1 {
    display: block;
    font-size: 2.875rem;
    font-weight: 300;
    color: #ffffff;
    margin-top: 1.563rem;
}

.main-grid .grid-box .grid-item2 .grid-item-hover-table .hover-title-2,
.main-grid .grid-box .grid-item3 .grid-item-hover-table .hover-title-3,
.main-grid .grid-box .grid-item4 .grid-item-hover-table .hover-title-4,
.main-grid .grid-box .grid-item5 .grid-item-hover-table .hover-title-5,
.main-grid .grid-box .grid-item6 .grid-item-hover-table .hover-title-6,
.main-grid .grid-box .grid-item7 .grid-item-hover-table .hover-title-7 {
    display: inline-block;
    font-size: 16px;
    font-weight: 500;
    color: #ffffff;
    border-bottom: 1px solid #ffffff;
    padding-bottom: 3px;
}

.main-grid .grid-box .grid-item2 .grid-item-hover-table .hover-text-2,
.main-grid .grid-box .grid-item3 .grid-item-hover-table .hover-text-3,
.main-grid .grid-box .grid-item4 .grid-item-hover-table .hover-text-4,
.main-grid .grid-box .grid-item5 .grid-item-hover-table .hover-text-5,
.main-grid .grid-box .grid-item6 .grid-item-hover-table .hover-text-6,
.main-grid .grid-box .grid-item7 .grid-item-hover-table .hover-text-7 {
    display: block;
    font-size: 1.875rem;
    font-weight: 300;
    color: #ffffff;
    margin-top: 1.563rem;
}

.main-grid .grid-box .grid-item4 .grid-item-hover-table .hover-title-4 img {
    width: 100px;
}


/* CGV 안내 */
.box-1-title {
    padding-top: 40px;
}

.ddf {
    display: flex;
    justify-content: space-between;
}

.box-1 {
    width: 170px;
    margin-top: 90px;
}

.box-1 > div > .img-box {
    background-image: url(https://www.megabox.co.kr/static/pc/images/main/bg-main-megainfo-boutique.png);
    background-position: 0 0;
    background-repeat: no-repeat;
    background-size: 100% auto;
    transition: background-position .3s;
    border-radius: 10px;
    box-shadow: 5px 5px 10px 0px rgba(0, 0, 0, 0.2);
}

.box-1 > div > .img-box-1 {
    background-image: url(https://www.megabox.co.kr/static/pc/images/main/bg-main-megainfo-mx.png);
}

.box-1 > div > .img-box-2 {
    background-image: url(https://www.megabox.co.kr/static/pc/images/main/bg-main-megainfo-comfort.png);
}

.box-1 > div > .img-box-3 {
    background-image: url(https://www.megabox.co.kr/static/pc/images/main/bg-main-megainfo-kids.png);
}

.box-1 > div > .img-box-4 {
    background-image: url(https://www.megabox.co.kr/static/pc/images/main/bg-main-megainfo-first.png);
}

.box-1 > div > .img-box::after {
    content: "";
    display: block;
    padding-top: 100%;
}

.box-1 > div > .img-box:hover {
    background-position: 0 100%;
}

   /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 1200px;
        height: 500px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
</style>



	
<!-- Body HTML -->

<!-- 슬라이더 섹션 -->
<div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>

    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true 
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
    </script>

<!-- 영화 박스오피스 섹션 -->
<div class="prod-box-1">
    <div class="menu-box-1 text-align-center line-height-0-ch-only">
        <ul class="row inline-block">
            <li class="cell dd active"><a href="#" class="block">박스오피스순</a></li>
            <li class="cell dc"><a href="#" class="block"> ． 누적관객순</a></li>
            <li class="cell"><a href="#" class="block"> ． 메가스코어순</a></li>
        </ul>
    </div>
    <div class="my-carousel-box-1 con">
        <div class="owl-carousel owl-theme">
            <div class="item" data-no="1">
                <div class="img-box" style="background-image:url(https://img.megabox.co.kr/SharedImg/2020/02/12/HfBNyNAVc9oEmh7veJ27GuspWVIKdFWg_316.jpg);"></div>
                <div class="sun">
                    <div>[모든 것은 돈 가방과 함께 시작되었다.]<br><br>사라진 애인 때문에 사채 빚에 시달리며 한 탕을 꿈꾸는 태영.<br>아르바이트로 가족의 생계를 이어가는 가장 중만.</div>
                    <div>
                        <div class="pre cell">
                            <p class="tit cell">기대평</p>
                            <p class="number">8.5</p>
                        </div>
                        <span class="sign"> 〉</span>
                        <div class="pree cell-right">
                            <p class="tit cell-right">관람평</p>
                            <p class="number">7.7</p>
                        </div>
                    </div>
                </div>
                <ul class="">
                    <li class="cell">
                        <a href="#" class="g">
                            <h4>♡ 869</h4>
                        </a>
                        <a href="#" class="t">
                            <h4>♥ 869</h4>
                        </a>
                    </li>
                    <li class="cell">
                        <a href="#">
                            <h4>예매</h4>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="item" data-no="2">
                <div class="img-box" style="background-image:url(https://img.megabox.co.kr/SharedImg/2020/02/21/IyeZJvAzV3QgEoW4F7HzdS97zfLYfcni_316.jpg);"></div>
                <div class="sun">
                    <div>두 명의 병사, 하나의 미션!<br>그들이 싸워야 할 것은 적이 아니라 시간이었다!<br><br>제1차 세계대전이 한창인 1917년.</div>
                    <div>
                        <div class="pre cell">
                            <p class="tit cell">기대평</p>
                            <p class="number">8.3</p>
                        </div>
                        <span class="sign"> 〉</span>
                        <div class="pree cell-right">
                            <p class="tit cell-right">관람평</p>
                            <p class="number">8.7</p>
                        </div>
                    </div>
                </div>
                <ul class="">
                    <li class="cell">
                        <a href="#" class="g">
                            <h4>♡ 1k</h4>
                        </a>
                        <a href="#" class="t">
                            <h4>♥ 1k</h4>
                        </a>
                    </li>
                    <li class="cell">
                        <a href="">
                            <h4>예매</h4>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="item" data-no="3">
                <div class="img-box" style="background-image:url(https://img.megabox.co.kr/SharedImg/2020/02/12/8h3sIafHZ4V9auz4WwxE0i9zJkguGEq0_316.jpg);"></div>
                <div class="sun">
                    <div>그날, 우리는 놈의 사냥감이 되었다<br><br>희망 없는 도시, 감옥에서 출소한 '준석'(이제훈)</div>
                    <div>
                        <div class="pre cell">
                            <p class="tit cell">기대평</p>
                            <p class="number">9.3</p>
                        </div>
                        <span class="sign"> 〉</span>
                        <div class="pree cell-right">
                            <p class="tit cell-right">관람평</p>
                            <p class="number">0</p>
                        </div>
                    </div>
                </div>
                <ul class="">
                    <li class="cell">
                        <a href="#" class="g">
                            <h4>♡ 286</h4>
                        </a>
                        <a href="#" class="t">
                            <h4>♥ 286</h4>
                        </a>
                    </li>
                    <li class="cell">
                        <a href="">
                            <h4>예매</h4>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="item" data-no="4">
                <div class="img-box" style="background-image:url(https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/FE3E8F-2BF8-4720-8A56-E625A3326173.large.jpg);"></div>
                <div class="sun">
                    <div>어제까진 뻥쟁이, 오늘부턴 정직한 후보?!<br><br>거짓말이 제일 쉬운 3선 국회의원 '주상숙'</div>
                    <div>
                        <div class="pre cell">
                            <p class="tit cell">기대평</p>
                            <p class="number">8.4</p>
                        </div>
                        <span class="sign"> 〉</span>
                        <div class="pree cell-right">
                            <p class="tit cell-right">관람평</p>
                            <p class="number">8.4</p>
                        </div>
                    </div>
                </div>
                <ul class="">
                    <li class="cell">
                        <a href="#" class="g">
                            <h4>♡ 1.1k</h4>
                        </a>
                        <a href="#" class="t">
                            <h4>♥ 1.1k</h4>
                        </a>
                    </li>
                    <li class="cell">
                        <a href="">
                            <h4>예매</h4>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- 나머지 영화 아이템들... (5~12번) 동일한 패턴으로 추가 -->
        </div>
    </div>
</div>

<!-- 중간바 -->
<div class="middle-bar text-align-center">
    <nav class="menu-box-1">
        <ul class="row">
            <li class="relative">
                <ul class="row">
                    <li class="cell"><a href="#" class="block"><input type="text" placeholder="영화명을 입력해 주세요" title="영화 검색" class="input-text" id="movieName"></a></li>
                    <li class="cell tt"><a href="#" class="block"><i class="far fa-calendar-alt"></i> 상영시간표</a></li>
                    <li class="cell"><a href="#" class="block"><i class="fas fa-film"></i> 박스오피스</a></li>
                    <li class="cell"><a href="#" class="block"><i class="fas fa-receipt"></i> 빠른예매</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>

<!-- 이벤트 -->
<div class="gfd">
    <div class="ght con text-align-center">
        <h3><img src="http://img.cgv.co.kr/R2014/images/title/h3_event.gif" alt="EVENT"></h3>
    </div>
</div>

<!-- 메인 그리드 -->
<div class="main-grid">
    <div class="con">
        <div class="grid-box row">
            <div class="grid-item1 cell">
                <div class="grid-item-base" style="background-image:url(http://img.cgv.co.kr/Front/Main/2020/0218/15819873526160.jpg)">
                </div>
                <div class="grid-item-hover">
                    <div class="grid-item-hover-table">
                        <a href="">
                            <span class="hover-title-1">기생충 포스터</span>
                            <br>
                            <span class="hover-text-1">ONLY CGV</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="grid-item2 cell">
                <div class="grid-item-base" style="background-image:url(http://img.cgv.co.kr/Front/Main/2019/1224/15771764068110.jpg)">
                </div>
                <div class="grid-item-hover">
                    <div class="grid-item-hover-table">
                        <a href="">
                            <span class="hover-title-2">SPHERE X</span>
                            <br>
                            <span class="hover-text-2">신규오픈</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="grid-item3 cell">
                <div class="grid-item-base" style="background-image:url(http://img.cgv.co.kr/Front/Main/2020/0217/15819309757910.jpg)">
                </div>
                <div class="grid-item-hover">
                    <div class="grid-item-hover-table">
                        <a href="">
                            <span class="hover-title-3">1917 4DX 이벤트</span>
                            <br>
                            <span class="hover-text-2">신규오픈</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="grid-item4 cell">
                <div class="grid-item-base" style="background-image:url(http://img.cgv.co.kr/Front/Main/2020/0217/15819309758060.jpg)">
                </div>
                <div class="grid-item-hover">
                    <div class="grid-item-hover-table">
                        <a href="">
                            <span class="hover-title-4"><img src="http://www.disney.co.kr/home/images/main/logo.png" alt="월트디즈니"></span>
                            <br>
                            <span class="hover-text-4">프린세스 기획전</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="grid-item5 cell">
                <div class="grid-item-base" style="background-image:url(http://img.cgv.co.kr/Front/Main/2019/1104/15728438029070.jpg)">
                </div>
                <div class="grid-item-hover">
                    <div class="grid-item-hover-table">
                        <a href="">
                            <span class="hover-title-5">현대오일뱅크</span>
                            <br>
                            <span class="hover-text-5">보너스뱅크</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="grid-item6 cell">
                <div class="grid-item-base" style="background-image:url(http://img.cgv.co.kr/R2014/images/main/main_moviecollage.jpg)">
                </div>
                <div class="grid-item-hover">
                    <div class="grid-item-hover-table">
                        <a href="">
                            <span class="hover-title-6">CGV ARTHOUSE, A Good Movie, A Better Life</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="grid-item7 cell">
                <div class="grid-item-base" style="background-image:url(http://adimg.cgv.co.kr/images/201709/house/0929_226X259.jpg)">
                </div>
                <div class="grid-item-hover">
                    <div class="grid-item-hover-table">
                        <a href="">
                            <span class="hover-title-7">광고-CGV</span>
                            <br>
                            <span class="hover-text-7">기프트 카드</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- CGV 안내 -->
<div class="box-1-title con" style="text-align:left;">
    <h1>CGV 안내</h1>
<<<<<<< HEAD
<div id="map" style="width:700px;height:700px;"></div>
=======
<div id="map" style="width:500px;height:500px;"></div>
>>>>>>> 4576a68d7fb704bf69de1d99e73503c1fc196698
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32768b61b72672bff487bc496c4a8901"></script>
	
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.5678806424, 126.9829739869), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.5678806424, 126.9829739869); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);


</script>
<<<<<<< HEAD
<div>
<!-- 이미지 넣을거 생각해보자 -->

=======

<div >
<!-- 이미지 넣을거 생각해보자 -->
	<!--  
	<img src="${pageContext.request.contextPath }/resources/images/mainImage/"dd />
	-->
>>>>>>> 4576a68d7fb704bf69de1d99e73503c1fc196698
</div>


<!-- Body JavaScript -->
<script>
// 슬라이더 버튼 클릭


// Owl Carousel 관련 함수
function ProdBox1__updateMenuBox1LiActive() {
    var currentItemNo = $('.prod-box-1 > .my-carousel-box-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item.active > .item').attr('data-no');
    $('.prod-box-1 > .menu-box-1 > ul > li.active').removeClass('active');
    
    if ( currentItemNo < 5 ) {
        $('.prod-box-1 > .menu-box-1 > ul > li:nth-child(1)').addClass('active');
    }
    else if ( currentItemNo >= 5 && currentItemNo < 9 ) {
        $('.prod-box-1 > .menu-box-1 > ul > li:nth-child(2)').addClass('active');
    }
    else {
        $('.prod-box-1 > .menu-box-1 > ul > li:nth-child(3)').addClass('active');
    }
}

// 메뉴 클릭
$('.prod-box-1 > .menu-box-1 > ul > li').click(function() {
    $(this).siblings('.active').removeClass('active');
    $(this).addClass('active');
    var index = $(this).index();
    var no = index * 4;
    $('.prod-box-1 > .my-carousel-box-1 > .owl-carousel').trigger('to.owl.carousel', [no, 100]);
});

// Owl Carousel 초기화
$('.prod-box-1 > .my-carousel-box-1 > .owl-carousel').owlCarousel({
    smartSpeed: 100,
    slideBy: 4,
    loop: true,
    margin: 0,
    nav: true,
    responsive: {
        0: {
            items: 4
        }
    },
    onInitialized: ProdBox1__updateMenuBox1LiActive,
    onTranslated: ProdBox1__updateMenuBox1LiActive,
});
<<<<<<< HEAD
</script>
=======
</script>
>>>>>>> 4576a68d7fb704bf69de1d99e73503c1fc196698
