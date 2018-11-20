<template>
    <!--注册-->
    <div class="app_register">
        <header id="header" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/search"></router-link>
            <!--<h1 class="mui-title">love  is  all</h1>-->
            <div class="register_title">
                <p class="first_title">LOVE 极爱</p>
                <p class="last_title">love is all</p>
            </div>
		</header>
        <div class="register_list"  id="appsearch">
            <div class="register_item">
                <span class="iconfont icon-ios-yonghu iconfirst"></span>
                <input type="text" name="uname" placeholder="用户名" v-model="uname" @blur="unameblur()" style="textIndent:17px;fontSize:14px">
            </div>
            <div class="register_item">
                <span class="iconfont icon-mima iconlast"></span>
                <input type="password" name="upwd" placeholder="请输入6~9位密码"  v-model="upwd" style="textIndent:17px;fontSize:14px">
            </div>
            <div class="register_item">
                <span class="iconfont icon-mima iconlast"></span>
                <input type="password" name="cpwd" placeholder="请确认密码"  v-model="cpwd" style="textIndent:17px;fontSize:14px">
            </div>
            <mt-button type="default" size="large" @click="myregister">注册</mt-button>
        </div>  
    </div> 
</template>
<script>
    import {Toast} from "mint-ui";
    export default{
        name:"register",
        data(){
            return {
                uname:"",
                upwd:"",
                cpwd:"",
                regnews:"",
                isReg:false
            }
        },
        
        methods:{
            myregister(){
                if(this.uname=="" ||this.upwd=="" ||this.cpwd==""){
                    Toast("请完善信息")
                }else if(this.isReg){
                    let _this=this;
                    let url="http://127.0.0.1:3000/user/register";
                    let data={'uname':this.uname,'upwd':this.upwd,'cpwd':this.cpwd}
                    this.$http.post(url,data).then(result=>{
                        if(result.body.code==1){
                            Toast("注册成功");
                            setTimeout(function(){
                                _this.$router.push({path:"/search"})
                            },500)
                        }else{
                            Toast(result.body.msg)
                        }
                    })
                }
            },
             unameblur(){
                if(!this.uname==""){
                    let _this=this;
                    let url="http://127.0.0.1:3000/user/checkUname";
                    let data={'uname':this.uname}
                    this.$http.post(url,data).then(result=>{
                        if(result.body.code==1){
                            _this.regnews="用户名已存在"
                            Toast(_this.regnews)
                            _this.isReg=false;
                        }else{
                            _this.regnews="";
                            _this.isReg=true;
                        }
                    })
                }
            },

         } ,   
       
        created(){
            
        } 
    }
</script>
<style scoped>
    *{
        box-sizing:border-box;
    }
    .app_user{
        margin:0 20px 0 20px;
    }
     .search_title{
        text-align:center;
        padding-bottom:20px;
    }
     .search_title p{
        color:black;
        font-size:16px;
    }
     .search_login{
        padding-top:25px;
        display:flex;
        justify-content: space-between;
    }
    .search_tip{
        text-align: center;
        padding-top:20px;
    }
    .search_other{
        display:flex;
        justify-content: space-around;
        padding-top:50px;
    }
     .search_other img{
        width:32px;
        height:32px;
    }
   
    .mui-table-view-cell {
        padding: 15px 15px;
    }
    .app_register #header .mui-action-back{
        color:#ddd;
    }
    .app_register #header .mui-title{
        color:#fff;
    }
    .app_register #header{
        background:url(../../img/ja.jpg) no-repeat;
        background-size:100% 200px;
        width:100%;
        height:200px;
    }
    .register_list{
        margin-top:165px;
        margin-left:15px;
        margin-right:15px;
    }
    .register_list input{
        border: 0;
        background: #EFEFF4;
        border-bottom: 1px solid #ddd
    }
    .app_register .register_item{
        position:relative
    }
    .app_register .register_item .iconfirst{
        position:absolute;
        top:9px;
        left:7px;
    }
    .app_register .register_item .iconlast{
        position:absolute;
        top:10px;
        left:7px;
    }
    .register_title{
        width:100%;
        position:relative;
        top:70px;
        left:0px;
        text-align: center;
    }
    .register_title .first_title,.last_title{
        color:#ddd;
    }
    .register_title .first_title{
        font-size:20px;
    }
    .register_title .last_title{
        font-size:20px;
    }
</style>
