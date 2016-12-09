<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>微信抢红包</title>
    <meta name="viewport" content="width=320,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection">
    <link href="/wechat/css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="/wechat/js/All.js"></script>
    <script language="javascript">
        $(function(){
            $('.red_bao_list li').click(function() {
                $(this).addClass('hot');
                $.get("http://dsfasf.cn/index/index/kaijiang_do.html",{ "id":"3469"},function(data){
                    if(data.code == 1){
                        $(".img span").text(data.money+"元");
                        $('.top_bg,.tan_hongbao').fadeIn(400);
                        $.get("http://dsfasf.cn/index/index/pay_do.html",{ "id":"3469"});
                    }else{
                        alert(data.msg);
                        history.go(-1);
                    }
                },"json");
            });
            $('.tan_hongbao .close,.tan_hongbao .btn').click(function() {
                $('.top_bg,.tan_hongbao').fadeOut(200);
                window.location = "http://dsfasf.cn/";
            });
        });
    </script>
</head>
<body>
<div class="mobile_wrap">
    <!-- start -->

    <section>
        <div class="news" id="notice">
            <div class="nw">
                <ul>
                    <li><a href="#">恭喜会员[3005]在30元区抢得红包288.36 元 !</a> </li>
                    <li><a href="#">恭喜会员[97881]在30元区抢得红包267.01 元 !</a> </li>
                    <li><a href="#">恭喜会员[67590]在50元区抢得红包498.96 元 !</a> </li>
                    <li><a href="#">恭喜会员[17923]在10元区抢得红包168.23 元 !</a> </li>
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
            <h2><i><img src="/wechat/images/icon/b01.png" alt=""></i>本轮开出以下红包<i><img src="/wechat/images/icon/b02.png" alt=""></i></h2>
        </div>

        <div class="red_bao">
            <ul class="fix">
                <li><span>153.81元</span></li>
                <li><span>4.21元</span></li>
                <li><span>77.32元</span></li>
                <li><span>6.80元</span></li>
                <li><span>4.57元</span></li>
                <li><span>5.91元</span></li>
                <li><span>119.93元</span></li>
                <li><span>126.03元</span></li>
                <li><span>39.72元</span></li>
                <li><span>188.70元</span></li>
                <li><span>6.13元</span></li>
                <li><span>61.37元</span></li>
            </ul>
        </div>

        <div class="red_bao_list">
            <ul class="fix">
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>

                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>

                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
                <li><img src="/wechat/images/hongbao.png" alt=""></li>
            </ul>
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

<div class="tops">
    <div class="top_bg" style="display:;"></div>
    <div class="tan_hongbao" style="display:;">
        <div class="img">
            <img src="/wechat/images/hongbao_tan.png" alt="">
            <span>0.00元</span>
            <div class="close"><img src="/wechat/images/icon_close.png" alt=""></div>
        </div>
        <div class="btn"><img src="/wechat/images/hongbao_btn.png" alt=""></div>
    </div>
</div>
</body>
</html>