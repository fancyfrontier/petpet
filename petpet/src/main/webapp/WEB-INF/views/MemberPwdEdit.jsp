<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--navigation-------------------------------->
    <nav>
        <!--social-link-and-phont-number-->
        <div class="social-call">
            <!--social-links-->
            <div class="social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            <!--phone-number-->
            <div class="phone">
                <span>Call +123456789</span>
            </div>
        </div>

        <!--search-bar------------------------------->
        <div class="search-bar">
            <!--search-input-------->
            <div class="search-input">
                <!--input----->
                <input type="text" placeholder="Search For Product" />
                <!--cancel-btn-->
                <a href="javascript:void(0);" class="search-cancel">
                    <i class="fas fa-times"></i>
                </a>
            </div>
        </div>

        <!----------------------------------------------NEW!!Strat!!-------------------------------------------->


        <div class="block">
            <div class="dataBlock">
                <h1>密碼修改</h1>
                <form method="post" action="XXXXXXXXX">
                    <div>
                        <h4 class="MemberNum">
                            <input class="MemberNum MemberNumInput" readonly type="Hidden" id="memberid" name="memberid"
                                value="${member.memberid}">
                        </h4>
                    </div>
                    <div class="input-group input-group-lg div">
                        <span class="input-group-text ">密碼</span>
                        <input type="text" class="form-control" placeholder="請輸入密碼" name="fullname" value="">
                    </div>
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text">密碼確認</span>
                        <input type="text" class="form-control" placeholder="請再次輸入密碼" name="mobile" value="">
                    </div>
                    <div class="btnBlock gap-2 col-6 mx-auto container">
                            <input class="button btn btn-success" type="submit"
                                style="width:200px;height:40px;" value="修改">
                            <input class="button btn btn-success" type="button"
                                style="width:200px;height:40px;" value="返回" href="/jQuery/jQueryLabsrcEEIT(20210606)/TeamWork/MemberEdit.html">
                    </div>
                </form>
            </div>
        </div>

        <!--footer--------------------------------------->
        <footer>
            <!--copyright----------------->
            <span class="copyright">
                Copyright 2021 - EEIT31全端工程師課程第7組
            </span>
            <!--subscribe--->
            <div class="subscribe">
                <form>
                    <input type="email" placeholder="Example@gmail.com" required />
                    <input type="submit" value="Subscribe">
                </form>
            </div>
        </footer>


        <!--script-------->
        <script type="text/javascript">

            /*----For Search bar---------------------*/
            $(document).on('click', '.search', function () {
                $('.search-bar').addClass('search-bar-active')
            });

            $(document).on('click', '.search-cancel', function () {
                $('.search-bar').removeClass('search-bar-active')
            });

            /*--login-sign-up-form-----------------*/
            $(document).on('click', '.user,.already-acount', function () {
                $('.form').addClass('login-active').removeClass('sign-up-active')
            });

            $(document).on('click', '.sign-up-btn', function () {
                $('.form').addClass('sign-up-active').removeClass('login-active')
            });

            $(document).on('click', '.form-cancel', function () {
                $('.form').removeClass('login-active').removeClass('sign-up-active')
            });

            /*---full-slider-script--------------*/
            $(document).ready(function () {
                $('#adaptive').lightSlider({
                    adaptiveHeight: true,
                    auto: true,
                    item: 1,
                    slideMargin: 0,
                    loop: true
                });
            });
            /*--Feature-slider--------------------*/
            $(document).ready(function () {
                $('#autoWidth').lightSlider({
                    autoWidth: true,
                    loop: true,
                    onSliderLoad: function () {
                        $('#autoWidth').removeClass('cS-hidden');
                    }
                });
            });

            /*----for-fix-menu-when-scroll----------------------*/
            $(window).scroll(function () {
                if ($(document).scrollTop() > 50) {
                    $('.navigation').addClass('fix-nav');
                }
                else {
                    $('.navigation').removeClass('fix-nav');
                }
            })
            /*--for-responsive-menu-----------------*/
            $(document).ready(function () {
                $('.toggle').click(function () {
                    $('.toggle').toggleClass('active')
                    $('.navigation').toggleClass('active')
                })
            })

        </script>
</body>
</html>