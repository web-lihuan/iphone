<template>
    <!--登录，个人中心-->
    <div>
        <div class="app_search" v-show="islogin">
            <header id="header" class="mui-bar mui-bar-transparent">
                <!--<h1 class="mui-title">love  is  all</h1>-->
                <div class="search_title">
                    <p class="last_title">love is all</p>
                </div>
            </header>
            <div class="search_all">
                <div class="search_text">
                    <div class="text-list">
                        <span class="iconfont icon-ios-yonghu iconfirst"></span>
                        <input type="text" name="uname" placeholder="用户名" v-model="uname"
                        style="textIndent:17px;fontSize:14px">
                    </div>               
                    <div class="text-list">
                        <span class="iconfont icon-mima iconlast"></span>
                        <input type="password" name="upwd" placeholder="请输入6~15位密码"  v-model="upwd" style="textIndent:17px;fontSize:14px">
                    </div>
                    <mt-button type="default" size="large" @click="login()">登录</mt-button>
                </div>
                <div class="search_login">
                    <router-link to="/register"><p>手机注册</p></router-link>
                    <a href="#"><p>忘记密码?</p></a>
                </div>
                <div class="search_tip">
                    <p>第三方账号直接登录</p>
                </div>
                <div class="search_other">
                    <a href="#"><img src="../../img/xl.png" alt=""></a>
                    <a href="#"><img src="../../img/qq.png" alt=""></a>
                    <a href="#"><img src="../../img/wx.png" alt=""></a>
                </div>
            </div>
        </div>
        <div class="app_login" v-show="isLogin">
            <header class="mui-bar mui-bar-nav">
                <header id="head" class="mui-bar mui-bar-transparent">
                    <h1 class="mui-title">个人中心</h1>
                </header>
		    </header>
            <ul class="mui-table-view">
                <li class="mui-table-view-cell mui-media" style="margin-top:44px">
                    <a href="javascript:;">
                        <img class="mui-media-object mui-pull-left" src="">
                        <div class="mui-media-body">
                            <span v-text="uname">幸福</span>
                            <p>欢迎您登录极爱App</p>
                        </div>
                    </a>
                </li>
            </ul>
            <ul class="mui-table-view">
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right">我的图片</a>
                </li>
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right">我的文章</a>
                </li>
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right">我的视频</a>
                </li>
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right">我的音乐</a>
                </li>
                <div style="height:10px;background-color:#ddd;margin-top:-1px"></div>
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right">我的购物车</a>
                </li>
            </ul>
            <mt-button type="primary" size="large" @click="signout()">注销</mt-button>
        </div>   
    </div> 
</template>
<script>
    import {Toast} from "mint-ui";
    export default{
        name:"login",
        data(){
            return {
                islogin:true,
                isLogin:false,
                info:"",
                uname:"",
                upwd:""
            }
        },
        mounted(){
            var self=this;
            this.$http.post("user/isLogin").then(res=>{
                if(res.data.ok==1){
                    self.isLogin=true;
                    self.islogin=false;
                    self.info=res.body.msg[0].uname;
                    self.info=res.body.msg[0].upwd;
                }else{
                    self.isLogin=false;
                    self.islogin=true;
                }
            })
        },
        methods:{
            login(){
                var self=this;
                var uname=this.uname;
                var upwd=this.upwd;
                var obj={uname:uname,upwd:upwd}
                this.$http.post("user/signin",obj).then(res=>{
                    if(res.data.code==1){
                        Toast("登录成功")
                        this.islogin=false;
                        this.isLogin=true;
                    }else{
                        Toast("用户名或密码错误")
                    }
                })
            },
            signout(){
                this.$http.get("user/signout").then(res=>{
                    if(res.data.ok==1){
                        Toast("注销成功")
                        this.uname="",
                        this.upwd=""
                        this.islogin=true;
                        this.isLogin=false;
                    }  
                })
            }
            /*iphone(){
                var reg=/^1[3-8]\d{9}$/;
                if(reg.test(this.input)){
                    Toast("手机号输入正确");
                }else{
                    Toast("请重新输入手机号");
                    this.input=""
                }
            },
            upsw(){
                var reg=/^[0-9A-Za-z]{6,9}$/;
                if(!reg.test(this.psw)){
                    Toast("密码格式不正确");
                    this.psw=""   
                }
            },
            login(){
                var myiphone=/^1[3-8]\d{9}$/;
                var mypsw=/^[0-9A-Za-z]{6,9}$/;
                if(myiphone.test(this.input) && mypsw.test(this.psw)){
                    $("#applogin").removeClass("app_login");
                    $("#appsearch").addClass("app_login");
                }
            }*/
        },
        created(){
            
        } 
    }
</script>
<style scoped>
    *{
        box-sizing:border-box;
    }
    .app_search #header{
        padding:0
    }
    .app_search .search_text,.search_login,.search_tip,.search_other{
        margin:0 15px;
    }
    .search_all{
        z-index: 1000;
        position:relative;
        top:46px;
        left:0px;
    }
    .app_search .search_title{
        text-align:center;
        background:url(../../img/gray.jpg) no-repeat;
        background-size:100% 635px;
        height:635px;
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
    .mui-table-view-cell {
        padding: 15px 15px;
    }
    .search_text .text-list{
        position:relative;
    }
    .search_text .text-list input{
        border: 0;
        background: #EFEFF4;
        border-bottom: 1px solid #ddd
    }
    .search_text .text-list .iconfont{
        position:absolute;
        top:10px;
        left:7px;
    }
</style>
