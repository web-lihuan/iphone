<template>
    
    <div class="app_search">
        <div class="search_title">
            <p>登录</p>
        </div>
        <div>
            <input type="text" placeholder="邮箱手机号"><br>
            <input type="password" placeholder="密码"><br>
            <mt-button type="primary" size="large">登录</mt-button>
        </div>
        <div class="search_login">
            <a href="#"><p>忘记密码?</p></a>
            <a href="#"><p>手机注册</p></a>
        </div>
        <div class="search_tip">
            <p>第三方账号直接登录</p>
        </div>
        <div class="search_other">
            <a href="#"><img src="../../img/xl.png" alt=""></a>
            <a href="#"><img src="../../img/qq.png" alt=""></a>
            <a href="#"><img src="../../img/wx.png" alt=""></a>
            <a href="#"><img src="../../img/db.png" alt=""></a>
        </div>
        <!--商品输入框-->
        <!--<div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <input type="text" value="" placeholder="国庆七天乐 好货天天抢"/>
                    <mt-button type="primary" size="small">搜索</mt-button>
                </div>
            </div>
        </div>-->
        <!--商品列表-->
        <!--<div class="mui-card">
            <div class="mui-card-header">搜索结果</div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell mui-media">
                            <a href="javascript:;">
                                <img class="mui-media-object mui-pull-left" src="../../img/shuijiao.jpg">
                                <div class="mui-media-body">
                                    华为手机
                                    <p class='mui-ellipsis'>
                                        华为手机，手机中的战斗机
                                    </p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mui-card-footer"></div>
        </div>-->
    </div>
</template>
<script>
    export default{
        data(){
            return {}
        },
        methods:{

        },
        created(){
            
        }
    }
</script>
<style>
    *{
        box-sizing:border-box;
    }
    .app_search .search_title{
        text-align:center;
        padding-bottom:20px;
    }
    .app_search .search_title p{
        color:black;
        font-size:16px;
    }
    .app_search .search_login{
        padding-top:25px;
        display:flex;
        justify-content: space-between;
    }
    .app_search .search_tip{
        text-align: center;
        padding-top:20px;
    }
    .app_search .search_other{
        display:flex;
        justify-content: space-around;
        padding-top:50px;
    }
    .app_search .search_other img{
        width:32px;
        height:32px;
    }
</style>
