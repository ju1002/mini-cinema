<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Header CSSddddd -->
<style>
/* 폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
html {
    font-family: "notokrR", sans-serif, "Noto Sans KR";
}

/* 공통 라이브러리 CSS */
.con {
    margin: 0 auto;
    width: 980px;
}
.row::after {
    content: "";
    display: block;
    clear: both;
}
.cell {
    float: left;
    box-sizing: border-box;
 
    
}
.cell-right {
    float: right;
    box-sizing: border-box;
}
.cell-left img{
	width:100%;
	height:100%;

}
.cell-left {
	width:50px;
	height:50px;

}
.block {
    display: block;
}
.inline-block {
    display: inline-block;
}
.text-align-center {
    text-align: center;
}
.line-height-0-ch-only {
    line-height: 0;
}
.line-height-0-ch-only > * {
    line-height: normal;
}
.relative {
    position: relative;
}
.absolute-left {
    position: absolute;
    left: 0;
}
.absolute-right {
    position: absolute;
    right: 0;
}
.absolute-middle {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
}

/* 노말라이즈 */
body, ul, li, h1 {
    margin: 0;
    padding: 0;
    list-style: none;
}
a {
    color: inherit;
    text-decoration: none;
}
body {
    padding-top: 80px !important;
}

/* Header 스타일 */
.ttop {
    position: absolute;
    z-index: 2;
    width: 100%;
    height: 194px;
    top: 0;
    border-bottom: none;
    background-color: transparent;
    background: -moz-linear-gradient(top, rgba(29,29,31,1) 0%, rgba(0,0,0,0) 100%);
    background: -webkit-linear-gradient(top, rgba(29,29,31,1) 0%, rgba(0,0,0,0) 100%);
    background: linear-gradient(to bottom, rgba(29,29,31,1) 0%, rgba(0,0,0,0) 100%);
}

.menu-bar {
    margin-top: -80px;
    z-index: 10;
}

.menu-bar .menu-1 > ul > li > a {
    font-size: 14px;
    height: 14px;
    color: #afafaf;
}

.menu-bar .menu-1 > ul > li > a > img {
    display: inline-block;
    padding: 0 10px;
    font-size: 14px;
    height: 14px;
}

.menu-bar .menu-1 > ul > li:hover > a {
    color: white;
}

.menu-bar .search-box > ul > li {
    padding-left: 8px;
    font-size: 14px;
    color: darkgray;
}

.top-bar {
    border-top: 2px solid rgba(255, 255, 255, .3);
    border-bottom: 2px solid #fff;
    border-bottom-color: rgba(255, 255, 255, .3);
    color: white;
    top: 20px;
    left: 0;
    width: 100%;
    z-index: 10;
    margin-bottom: 50px;
}

.top-bar .menu-box-1 ul > li > a {
    display: block;
}

.top-bar .menu-box-1 > ul > li > a {
    position: relative;
    padding: 10px 40px;
    font-size: 15px;
}

.top-bar .menu-box-1 > ul > li > a::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 3px;
    background-color: #FF1744;
    display: none;
}

.top-bar .menu-box-1 > ul > li:hover > a::after {
    display: block;
}

.top-bar .menu-2 > div > ul > li > a {
    padding-left: 0;
    margin: 10px;
    font-size: 12px;
    font-weight: bold;
    text-align: left;
    color: darkgray;
}

.top-bar .menu-2 > div > ul > li > a:hover {
    color: #FFF;
}

.top-bar .logo {
    width: 70px;
    margin-left: 370px;
}

.top-bar .menu-box-2 {
    display: inline-block;
    margin-right: 346px;
}

.top-bar .menu-box-2 > ul > li > a {
    font-size: 11px;
    padding: 13px;
}

.top-bar > .menu-box-1 > ul > li:hover > div > div {
    display: block;
}

.top-bar > .menu-box-1 > ul > li > div > div {
    position: absolute;
    background-color: rgba(0, 0, 0, .7);
    left: 0;
    width: 100%;
    margin-bottom: 7px;
    height: 38px;
    display: none;
    z-index: 6;
}

.con-min-width {
    min-width: 1920px;
}

.top-bar .logo img {
    display: block;
    width: 100%;
}

#logo-img {
width: 100px;
height: 100px;
}
.logo inline-block{
width:}

#content_1{
margin-top:20px;
}
.menu-box-1 text-align-center line-height-0-ch-only con{
}</style>


<!-- Header HTML -->
<div class="ttop"></div>
<div class="menu-bar relative con text-align-center line-height-0-ch-only">
    <nav class="menu-1 absolute-left absolute-middle">
        <ul class="row">
            <li class="cell cell-left" ><img src="https://i.namu.wiki/i/EYm29AFq9eP2QqG9c7ns7UMD85CFFJeagte2DGY7rZlEsedVGGAt3b_WmEcs7GXEpf8E7yNGDvfq8Ou9-8cN8w.webp" alt="" width="50%" height="50%" ></li>
        </ul>
    </nav>
    <a class="logo inline-block" href="#" ><img src="${pageContext.request.contextPath}/resources/images/mainImage/main-logo4.png" alt="로고 사진" class="block" id="logo-img" ></a>
    <form class="search-box absolute-right absolute-middle">
        <ul class="row">
        
            <li class="cell"><a href="#">내정보</a></li>
            <li class="cell"><a href="#">로그아웃</a></li>
            
            
            <li class="cell"><a href="#">회원가입</a></li>
            <li class="cell"><a href="#">로그인</a></li>
            
        </ul>
    </form>
</div>

<div class="top-bar relative con-min-width">
    <nav class="menu-box-1 text-align-center line-height-0-ch-only con">
        <ul class="row inline-block">
            <li class="cell">
                <a href="/spring/movie" class="block">영화</a>
                <div>
                    <div class="menu-2 text-align-center line-height-0-ch-only">
                        <div class="inline-block">
                            <ul class="row">
                                <li class="cell"><a href="#">상영중인 영화</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <li class="cell">
                <a href="/spring/reserve" class="block">예매</a>
                <div>
                    <div class="menu-2 text-align-center line-height-0-ch-only">
                        <div class="inline-block">
                            <ul class="row">
                                <li class="cell"><a href="/spring/reserve">빠른예매</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
          
            <li class="cell">
                <a href="#" class="block">공지사항& 이벤트 </a>
                <div>
                    <div class="menu-2 text-align-center line-height-0-ch-only">
                        <div class="inline-block">
                            <ul class="row">
                                <li class="cell"><a href="#">이벤트</a></li>
                                <li class="cell"><a href="#">공지사항</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </nav>
    
</div>