<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>微信抢红包</title>
    <meta name="viewport" content="width=320,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection">
    <link href="/wechat/css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="/wechat/js/All.js"></script>
    <script language="javascript">
        var payurl   = "http://dsfasf.cn/index/pay/weixin.html";
        var checkurl = "http://dsfasf.cn/index/pay/check.html";
        var timer, timer1;
        var vipType  = 1;
        var orderno  = '';
        $(function () {
            if (getCookie('open')) {
                $('.top_bg,.top_txt').fadeOut(0);
            }
            $(".fix li").click(function () {
                if ($(this).data('id') != vipType) {
                    $('.login_in').show();
                    vipType = $(this).data('id');
                    if (vipType == 1) {
                        $(".dierbu p").html("第二步：<em>长按</em> 识别二维码支付<i>10元</i>抢<i>200元</i>以内红包");
                    } else if (vipType == 2) {
                        $(".dierbu p").html("第二步：<em>长按</em> 识别二维码支付<i>30元</i>抢<i>300元</i>以内红包");
                    } else {
                        $(".dierbu p").html("第二步：<em>长按</em> 识别二维码支付<i>50元</i>抢<i>500元</i>以内红包");
                    }
                    $.get(payurl, { "vipType": vipType }, function (data) {
                        if (data.url) {
                            $("#ewm").attr('src', data.url);
                            orderno = data.orderno;
                            hide2();
                        }
                    }, "json");
                }
            });
//            $('.login_in').show();
            $.get(payurl, { "vipType": vipType}, function (data) {
                if (data.url) {
                    $("#ewm").attr('src', data.url);
                    orderno = data.orderno;
                    hide2();
                }
            }, "json");

            timer = setInterval(function () {
                if (!orderno) {
                    return false;
                }
                //alert(o);
                $.get(checkurl,{ "orderno":orderno}, function (data) {
                    if (data.code == 1) {
                        //alert(data.code);
                        clearInterval(timer);
                        $(".idx_pt7 a").addClass("hot").attr("href", "http://dsfasf.cn/index/index/kaijiang.html?id=" + data.id);
                        $('.top_bg,.pay_ready').fadeIn(200);
                        clearInterval(timer1);
                        $.get(payurl,{ "vipType":1});
                        $.get(payurl,{ "vipType":2});
                        $.get(payurl,{ "vipType":3});
                        timer1 = setInterval(function () {
                            $.get(payurl,{ "vipType":1});
                            $.get(payurl,{ "vipType":2});
                            $.get(payurl,{ "vipType":3});
                        }, 300000);
                    }

                }, 'json');
            }, 5000);
            $.get(payurl,{ "vipType":2});
            $.get(payurl,{ "vipType":3});
            timer1 = setInterval(function () {
                $.get(payurl,{ "vipType":1});
                $.get(payurl,{ "vipType":2});
                $.get(payurl,{ "vipType":3});
            }, 300000);

            $('.top_txt button').click(function () {
                $('.top_bg,.top_txt').fadeOut(200);
                setCookie("open", 1, 1);
            });
            $('.pay_ready').click(function () {
                $('.top_bg,.pay_ready').fadeOut(200);
                window.location = $(".idx_pt7 a").attr("href");
            });
        });

        function getCookie(c_name) {
            if (document.cookie.length > 0) {
                c_start = document.cookie.indexOf(c_name + "=");
                if (c_start != -1) {
                    c_start = c_start + c_name.length + 1;
                    c_end   = document.cookie.indexOf(";", c_start);
                    if (c_end == -1) c_end = document.cookie.length;
                    return unescape(document.cookie.substring(c_start, c_end));
                }
            }
            return ""
        }
        function setCookie(c_name, value, expiredays) {
            var exdate = new Date()
            exdate.setDate(exdate.getDate() + expiredays)
            document.cookie = c_name + "=" + escape(value) +
                    ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
        }
        function hide2() {
            setTimeout("$('.login_in').hide();", 800);
        }
    </script>
    <style type="text/css">
        .login_in {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            z-index: 10;
            background: rgba(0, 0, 0, 0.8);
            padding-top: 55%;
            display: none;
        }

        .spinner {
            margin: 100px auto 0;
            width: 150px;
            text-align: center;
        }

        .spinner p {
            text-align: center;
            color: #fff;
            line-height: 3em;
        }

        .spinner > div {
            width: 20px;
            height: 20px;
            background-color: #fff;
            border-radius: 100%;
            display: inline-block;
            -webkit-animation: bouncedelay 1.4s infinite ease-in-out;
            animation: bouncedelay 1.4s infinite ease-in-out;
            /* Prevent first frame from flickering when animation starts */
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
        }

        .spinner .bounce1 {
            -webkit-animation-delay: -0.32s;
            animation-delay: -0.32s;
        }

        .spinner .bounce2 {
            -webkit-animation-delay: -0.16s;
            animation-delay: -0.16s;
        }

        @-webkit-keyframes bouncedelay {
            0%, 80%, 100% {
                -webkit-transform: scale(0.0)
            }
            40% {
                -webkit-transform: scale(1.0)
            }
        }

        @keyframes bouncedelay {
            0%, 80%, 100% {
                transform: scale(0.0);
                -webkit-transform: scale(0.0);
            }
            40% {
                transform: scale(1.0);
                -webkit-transform: scale(1.0);
            }
        }
    </style>
</head>
<body>
<div class="mobile_wrap">
    <!-- start -->

    <section>
        <div class="news" id="notice">
            <div class="nw">
                <ul>
                    <li><a href="#">恭喜会员[3005]在30元区抢得红包288.36 元 !</a></li>
                    <li><a href="#">恭喜会员[97881]在30元区抢得红包267.01 元 !</a></li>
                    <li><a href="#">恭喜会员[67590]在50元区抢得红包498.96 元 !</a></li>
                    <li><a href="#">恭喜会员[17923]在10元区抢得红包168.23 元 !</a></li>
                </ul>
            </div>
        </div>
    </section>

    <section class="maincont">
        <div class="idx_pt1">
            <a href="#">投诉举报　　　</a>
            <a href="#">会员ID：898679</a>
            <a href="http://dsfasf.cn/index/index/daili.html">我的推广二维码</a>
        </div>
        <div class="idx_pt2">
            <h2>【 微信安全支付 】</h2>
        </div>
        <div class="idx_pt3">
            <h2><i><img src="/wechat/images/icon/b01.png" alt=""></i>选择付款金额<i><img
                            src="/wechat/images/icon/b02.png" alt=""></i></h2>
        </div>
        <div class="idx_pt4">
            <ul class="fix">
                <li class="hot" data-id="1">10元</li>
                <li class="" data-id="2">30元</li>
                <li class="" data-id="3">50元</li>

            </ul>
        </div>
        <div class="idx_pt5 dierbu">
            <p>第二步：<em>长按</em> 识别二维码支付<i>10元</i>抢<i>200元</i>以内红包</p>
        </div>

        <div class="idx_pt6">
            <img src="" alt="" id="ewm">
        </div>

        <div class="idx_pt5">
            <p>第三步：支付完成后1~3秒即可拆红包</p>
        </div>

        <div class="idx_pt7">
            <a class="hot" href="/zine/hbao/kj">支付完点这拆红包</a>
        </div>

        <div class="idx_pt8">
            <img src="/wechat/images/icon_jingxi.png" alt="">
            <div class="line">
                <p>那么好玩的红包游戏怎能没惊喜呢？<br>
                    即日起，凡是抽到1.11元-9.99元任意豹子红包的额外奖励所抽红包金额的<i>100倍现金红包返还</i>。<br>
                    如：<i>1.11元奖励111元、9.99元奖励999元</i><br>
                    还有:抽到金额为<i>8.88元红包的除奖励888元现金红包外再送iphone7 plus 128G一部</i>（名额不限），所有额外奖励请联系客服马上兑现！</p>
            </div>

        </div>
    </section>
    <div class="footer">
        <ul>
            <li class="f01"><a class="hot" href="/zine/hbao"><i></i><span>去支付</span></a></li>
            <li class="f02"><a href="{'zine/hbao/hongbao'|app}" class=""><i></i><span>拆红包</span></a></li>
            <li class="f03"><a href="/zine/hbao/daili" class=""><i></i><span>代理</span></a></li>
            <li class="f04"><a href="/zine/hbao/yongjin" class=""><i></i><span>佣金</span></a></li>
            <li class="f05"><a href="/zine/hbao/kefu" class=""><i></i><span>客服</span></a></li>
        </ul>
    </div>
    <!-- end -->
</div>

<div class="tops" style="">
    <div class="top_bg"></div>
    <div class="top_txt">
        <h2>【游戏玩法介绍】</h2>
        <p>长按识别二维码支付<i>10元</i>，系统随机发送一组<i>12个红包</i>给您选拆一个，红包金额<i>200元</i>以内随机。</p><br>
        <h2>【抽到红包怎么给我】</h2>
        <p>您所拆得的红包系统将自动以<i>"零钱入账"</i>的形式发送微信支付到您的零钱账户，您可以在微信支付查询该笔红包收入。</p>
        <a href="http://dsfasf.cn/index/index/xieyi.html">用户协议</a>
        <button>开启红包</button>
    </div>

    <div class="pay_ready">
        <img src="/wechat/images/pay_ready.jpg" alt="">
    </div>
    <div class="login_in" style="display:none">
        <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
            <p>正在生成支付二维码...</p>
        </div>
    </div>
</div>

</body>
</html>