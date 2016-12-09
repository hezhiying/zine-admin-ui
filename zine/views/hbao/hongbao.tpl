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
            var page = 1;
            var pageurl = "http://dsfasf.cn/index/index/hongbao2.html";
            $(".idx_pt7").click(function(){
                $.get(pageurl,{ "page":page},function(data){
                    if(data.page <= page || data.lists == ''){ $('.idx_pt7').hide();}
                    var lists = data.lists.data;
                    if(lists != ''){
                        n = lists.length;
                        for(var i=0;i < n;i++){
                            $('.my_hongbao ul').append('<li class="fix"><p>恭喜您领到'+lists[i]['money']+'</p><span>已领取</span></li>');
                        }
                        page = data.page;
                    }
                },'json');
            });
            $.get(pageurl,{ "page":page},function(data){
                if(data.page <= page || data.lists == ''){ $('.idx_pt7').hide();}
                var lists = data.lists.data;
                if(lists != ''){
                    n = lists.length;
                    for(var i=0;i < n;i++){
                        $('.my_hongbao ul').append('<li class="fix"><p>恭喜您领到'+lists[i]['money']+'</p><span>已领取</span></li>');
                    }
                    page = data.page;
                }
            },'json');
            $(".my_hongbao ul li span").click(function(){

                window.location=$(this).data("href")
            });
            $('.my_hongbao li').slice(0, 5).show();
            var hbnum = $('.my_hongbao li').size();
            var m = 1;
            $('.idx_pt7 a').click(function() {
                // $('.my_hongbao li').show();
                m++;
                $('.my_hongbao li').slice(0, 5*m).show();

                if(5*m > hbnum){
                    $('.idx_pt7 a').removeClass('hot');
                }
            });
        });
    </script>
    <style type="text/css">
        body{ background: #BD0614; }
    </style>
</head>
<body>
<div class="mobile_wrap" style="padding-bottom: 5em;">

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

    <section class="maincont" style="height: 90%; padding-bottom: 0;">
        <div class="idx_pt1">
            <a href="#">投诉举报　　　</a>
            <a href="#">会员ID：898679</a>
            <a href="http://dsfasf.cn/index/index/daili.html">我的推广二维码</a>
        </div>
        <div class="idx_pt2">
            <h2>【 微信安全支付 】</h2>
        </div>
        <div class="idx_pt3">
            <h2><i><img src="/wechat/images/icon/b01.png" alt=""></i>我的红包<i><img src="/wechat/images/icon/b02.png" alt=""></i></h2>
        </div>

        <div class="my_hongbao">
            <ul>

            </ul>
        </div>

        <div class="idx_pt7">
            <a class="hot" href="#">加载更多</a>
        </div>

    </section>
    <div class="footer">
        <ul>
            <li class="f01"><a href="/zine/hbao"><i></i><span>去支付</span></a></li>
            <li class="f02"><a href="/zine/hbao/hongbao" class="hot"><i></i><span>拆红包</span></a></li>
            <li class="f03"><a href="/zine/hbao/daili" class=""><i></i><span>代理</span></a></li>
            <li class="f04"><a href="/zine/hbao/yongjin" class=""><i></i><span>佣金</span></a></li>
            <li class="f05"><a href="/zine/hbao/kefu" class=""><i></i><span>客服</span></a></li>
        </ul>
    </div>
    <!-- end -->
</div>

</body>
</html>