<template>
    <!--首页-->
    <div class="app">
        <!--主页组件HomeContainer.vue-->
        <header id="header" class="mui-bar mui-bar-transparent">
			<!--<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>-->
			<h1 class="mui-title">love  is  all</h1>
		</header>
        <!--1.轮播图-->
        <mt-swipe :auto="3000">
            <mt-swipe-item v-for="item in list" :key="item.id">   <!--加:key提高排序顺序-->
                <a href="#">
                    <img :src="item.img_url"/>
                    <p class="mui-slider-title">{{item.title}}</p>
                </a>
            </mt-swipe-item>
        </mt-swipe>
        <!--2.六宫格 start-->
        <ul class="mui-table-view mui-grid-view mui-grid-9">
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/home/newslist">
                    <img src="../../img/a.png"/>
                    <div class="mui-media-body">图文</div>
                </router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/home/goodslist">
                    <img src="../../img/b.png"/>
                    <div class="mui-media-body">问答</div>
                </router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/read">
                    <img src="../../img/c.png"/>
                    <div class="mui-media-body">阅读</div>
                </router-link>
            </li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/pay">
                    <img src="../../img/d.png"/>
                    <div class="mui-media-body">购物</div>
                </router-link>
            </li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/movie">
                    <img src="../../img/e.png"/>
                    <div class="mui-media-body">影视</div>
                </router-link>
            </li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/music">
                    <img src="../../img/f.png"/>
                    <div class="mui-media-body">音乐</div>
                </router-link>
            </li>
        </ul> 
        <!--more and more-->
        <!--<div class="mui-card" v-for="item in load" :key="item.id">
            <div class="mui-card-header mui-card-media" style="height:40vw;">
                <a href="#">
                    <img :src="item.img_url" alt="">
                </a>
            </div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <a href="#">
                        <p style="color: #333;" >{{item.title}}</p>
                    </a>
                </div>
            </div>
		</div>-->
        <div class="mui-card">
            <div class="mui-card-header mui-card-media" style="text-align:center">
                <p>推荐阅读</p>
            </div>
            <div class="mui-card-content" style="height:40vw;">
                <div class="mui-card-content-inner cart-hot" >
                    <div>
                        <a-player autoplay :music="{
                            title: 'secret base~君がくれたもの~',
                            artist: 'Silent Siren',
                            src: 'http://127.0.0.1:3000/img/bg.mp3',
                            pic: 'http://127.0.0.1:3000/img/1.jpg'
                        }" mini 
                        />
                    </div>
                    
                    <div style="text-align:center">
                        <router-link to="/pay"><p>《倾城之恋》</p></router-link>
                        <router-link to="/pay"><p>《海子的诗》</p></router-link>
                        <router-link to="/pay"><p>《送你一匹马》</p></router-link>
                    </div>  
                </div>
            </div>
		</div>
        <div class="mui-card">
            <div class="mui-card-header mui-card-media" style="text-align:center">
                <p>推荐阅读</p>
            </div>
            <div class="mui-card-content" style="height:80vw;">
                <div class="mui-card-content-inner two-show" >
                    <div class="app-img">
                        <img src="../../img/shuijiao.jpg" alt="">
                        <p>摄影 | 未知</p>
                    </div>
                    <div class="app-content">
                        <p>分手是走一段长长的路,一个路灯的影子踩着另一个路灯的脑袋。</p>
                    </div>
                    <div class="app-title">
                        <p>《另一个你》</p>
                    </div>
                </div>
            </div>
		</div>
        <div class="mui-card">
            <div class="mui-card-header mui-card-media" style="text-align:center">
                <p @click="changeContent(0)">{{text[0].title}}</p>
            </div>
            <div class="mui-card-content box" style="height:75vw;" v-show="text[0].showContent">
                <div class="mui-card-content-inner two-show">
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell mui-media" v-for="item in read" :key="item.id" @click="getDetail(item.id)">
                            <a href="javascript:;">
                                <img class="mui-media-object mui-pull-left" :src="item.img_url">
                                <div class="mui-media-body">
                                    <h5>{{item.title}}</h5>
                                    <p class='mui-ellipsis'>{{item.artist}}</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mui-card">
            <div class="mui-card-content">
                <vue-scroll :ops="ops">
                    <ul class="content">
                        <li v-for="item in list" :key="item.id" style="width:300px;height:150px;position:relative;overflow:hidden">
                            <img :src="item.img_url" style="width:250px;height:150px">
                            <div class="cart-position">
                                <p style="color:#fff">{{item.title}}</p>
                            </div>
                            <div class="cart-subject">
                                <p style="fontSize:11px;color:#fff">专题</p>
                            </div>
                        </li>  
                    </ul>
                </vue-scroll>
            </div>
        </div>
    </div>
</template>
<script>
    //加载当前组件需要的第三方模块
    import VueAplayer from 'vue-aplayer'
    import {Toast} from "mint-ui";
    export default{
        components: {
            'a-player': VueAplayer
        },
        data(){  
            return {
                list:[],
                load:[],
                text:[{title:"Love Story ...",showContent:false}],
                read:[],
                ops: {
                    vuescroll: {},
                    scrollPanel: {
                        scrollingX: true,
                        scrollingY:false
                    },
                    rail: {},
                    bar: {
                        opacity:0
                    }
                }
            }
        },
        methods:{
            changeContent(index){                       //通过index拿到当前值
                this.text[index].showContent=!this.text[index].showContent;
            },
            getImageList(){
                //获取图片的轮播数据 
                var url="http://127.0.0.1:3000/imagelist/list";
                this.$http.get(url).then(res=>{
                    if(res.body.code==1){ 
                        //node.js发送的是json的字符串
                        //通过vueresource接收自动将json字符串转换
                        //js对象
                        this.list=res.body.msg;
                    }else{
                        //出错提示 Toast() 
                        Toast("加载轮播图片失败...");
                    }
                })
            },
            /*getDownload(){
                var url="http://127.0.0.1:3000/download/load";
                this.$http.get(url).then(res=>{
                    if(res.body.code==1){
                        this.load=res.body.msg;
                    }else{
                        Toast("加载下拉图文失败...");
                    }
                })
            }*/
            getDetail(id){
                this.$router.push(
                    {path:"/readinfo/"+id}
                )
            },
            getReadinfo(){
                this.$http.get("read/list").then(result=>{
                    this.read=result.body.msg.splice(0,4);
                })
            }
        },
        created(){
            this.getImageList();
            /*this.getDownload();*/
            this.getReadinfo();
        }
    }

</script>
<style scoped>
    /* 图片轮播的组件高度为0 */
    .app .mint-swipe{
        height:200px;
    }
    .app .mint-swipe img{
        width:100%;
        height:100%;
    }
    .app .mui-table-view.mui-grid-9{
        background-color:#fff;
    }
    .app .mui-grid-view.mui-grid-9 .mui-table-view-cell{
        border:0;
    }
    .app .mui-grid-view.mui-grid-9 .mui-table-view-cell img{
        width:60px;
        height:60px;
    }
    .app .mui-table-view .mui-media-body{
        font-size:10px!important;
        margin:0!important;
    }
    .mint-header{
        /*background:#F3F4F6;*/
    }
    #header .mui-title{
        color:#fff;
    }
    .mui-slider-title{
        background:transparent;
    }
    .mui-card-header{
        padding:0!important;
    }
    .mui-card-header img{
        width:100%!important;
        height:100%!important;
    }
    .cart-hot{
        display:flex;
        justify-content: space-around;
    }
    .app-img img{
        width:100%;
        height:200px;
    }
    .app-img{
        text-align:center;
    }
    .app-content{
        padding:5px 27px 5px;
    }
    .app-title{
        text-align:center;
    }
    .two-show{
        padding:0;
    }
    .mui-card-header.mui-card-media {
        display: flex;
        justify-content: center;
        align-items: center
    }
    .content{
        width: 1075px;
        height:150px;
        list-style: none;
        display: flex;
        justify-content: space-between;
        padding-left:15px;
    }
    .cart-subject{
        position:absolute;
        top:-25px;
        left:-25px;
        width:50px;
        height:50px;
        line-height:84px;
        transform: rotate(-45deg);
        background-color:rgba(146,146,151,.5);
        text-align: center;
    }
    .cart-position{
        position:absolute;
        top:0px;
        left:0px;
        width:250px;
        height:150px;
        line-height: 150px;
        text-align:center;
        background-color:rgba(0,0,0,.2);
    }
</style>