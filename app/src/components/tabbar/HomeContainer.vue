<template>
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
                    <div class="mui-media-body">图片</div>
                </router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/home/goodslist">
                    <img src="../../img/b.png"/>
                    <div class="mui-media-body">问答</div>
                </router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <a href="#">
                    <img src="../../img/c.png"/>
                    <div class="mui-media-body">阅读</div>
                </a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <a href="#">
                    <img src="../../img/d.png"/>
                    <div class="mui-media-body">购物</div>
                </a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/movie">
                    <img src="../../img/e.png"/>
                    <div class="mui-media-body">影视</div>
                </router-link>
            </li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                <router-link to="/music">
                    <img src="../../img/f.png"/>
                    <div class="mui-media-body">音乐  </div>
                </router-link>
            </li>
        </ul> 
        <!--end-->
        <div class="mui-card" v-for="item in load" :key="item.id">
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
		</div>
    </div>
</template>
<script>
    //加载当前组件需要的第三方模块
    import {Toast} from "mint-ui";
    export default{
        data(){  
            return {
                list:[],
                load:[]
            }
        },
        methods:{
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
            getDownload(){
                var url="http://127.0.0.1:3000/download/load";
                this.$http.get(url).then(res=>{
                    if(res.body.code==1){
                        this.load=res.body.msg;
                    }else{
                        Toast("加载下拉图文失败...");
                    }
                })
            }
        },
        created(){
            this.getImageList();
            this.getDownload();
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
</style>