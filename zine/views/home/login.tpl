<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>It works</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    {*<!-- 引入样式 -->*}
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">
    {* 引入vue.js *}
    <script src="https://cdn.staticfile.org/vue/2.0.5/vue.min.js"></script>
    {*<script src="{'zine/assets/vue/vue.js'|res}"></script>*}

    {*<!-- 引入组件库 -->*}
    <script src="https://cdn.staticfile.org/element-ui/1.0.1/index.js"></script>
    {*<script src="{'zine/assets/element-ui/element-ui.js'|res}"></script>*}
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="{'zine/assets/bootstrap/css/bootstrap.min.css'|res}">

    <link rel="stylesheet" href="{'zine/assets/css/console.css'|res}">

    <link href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>

    {combinate file='abc/aaa.js'}
        <script src="{'zine/assets/bootstrap/js/bootstrap.min.js'|res}"></script>
        <script src="{'zine/assets/js/console.js'|res}"></script>
    {/combinate}
</head>
<style>
    body {
        position: relative;
        min-height: 800px;
        min-width: 1280px;
    }

    .app-login {
        position: fixed;
        width: 100%;
        height: 100%;
        background: -webkit-gradient(linear, 0% 0%, 0% 205%, from(#34cfff), to(#3b9aff));
        min-height: 800px;
    }

    .app-login-bg {
        position: absolute;
        width: 100%;
        height: 100%;
        left:0;
        top:0;
        background-size: contain;
        background-image: url("{'zine/assets/login/login_bg.png'|res}");
        background-repeat: no-repeat;
        background-position: bottom ;

    }
.app-login-body{
    width: 1290px;
    margin: 0 auto;
}
    .app-login-pic{
        width: 600px;
        margin: 0 0 0 44px;
        text-align: center;
        height: 100%;
        position: relative;
        float: left;
    }
    .app-login-img{
        width: 450px;
        margin: 50% 0;
        top: -200px;
        position: relative;
    }
</style>
<body>
<div class="app-login">
    <div class="app-login-bg"></div>

    <div class="app-login-body">
        <div class="app-login-pic">
            <img src="{'zine/assets/login/pic.png'|res}" alt="" class="app-login-img" >
        </div>
        <div class="app-login-form">
            <h2>齐齐乐手游运营平台</h2>
        </div>
    </div>
</div>


</body>
</html>