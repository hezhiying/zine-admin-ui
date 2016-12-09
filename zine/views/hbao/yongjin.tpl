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
            $('.yongjin li').click(function() {
                $(this).addClass('hot').siblings('li').removeClass('hot');
                var idx = $(this).index();
                $('.yongjin_con').eq(idx).show().siblings('.yongjin_con').hide();
            });

        });
    </script>
</head>
<body style="background: #ba0816;">
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

        <div class="yongjin">
            <ul class="fix">
                <li class="hot"><a href="#">我的佣金</a></li>
                <li><a href="#">佣金领取记录</a></li>
            </ul>
            <div class="yongjin_con">
                <a class="look_exp" href="http://dsfasf.cn/index/index/yongjin2.html">【点击查看推广佣金赚钱说明】</a>
                <p class="sming">提示：佣金需达到30元以上才可领取</p>
                <p class="sming">您目前的佣金为：<i>0.00</i>元</p>

                <div class="idx_pt7" style="padding:2em;">
                    <a  href="#">点击领取</a>
                </div>

                <p class="sming">分享右上角【我的推广二维码】获取佣金</p>
            </div>
            <div class="yongjin_con" style="display: none;">
                <p class="sming">暂无领取记录</p>
            </div>
        </div>

    </section>
    <div class="footer">
        <ul>
            <li class="f01"><a href="/zine/hbao"><i></i><span>去支付</span></a></li>
            <li class="f02"><a href="/zine/hbao/hongbao" class=""><i></i><span>拆红包</span></a></li>
            <li class="f03"><a href="/zine/hbao/daili" class=""><i></i><span>代理</span></a></li>
            <li class="f04"><a href="/zine/hbao/yongjin" class="hot"><i></i><span>佣金</span></a></li>
            <li class="f05"><a href="/zine/hbao/kefu" class=""><i></i><span>客服</span></a></li>
        </ul>
    </div>
    <!-- end -->
</div>
</body>
</html>