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
                <p>热门推荐</p>
            </div>
            <div class="mui-card-content" style="height:40vw;">
                <div class="mui-card-content-inner">
                    <a-player autoplay :music="{
                        title: 'secret base~君がくれたもの~',
                        artist: 'Silent Siren',
                        src: 'http://127.0.0.1:3000/img/bg.mp3',
                        pic: 'http://127.0.0.1:3000/img/1.jpg'
                    }"
                    />
                </div>
            </div>
		</div>
        <div class="mui-card" style="text-align:center">
            <div class="mui-card-header mui-card-media">
                <p>服务中心</p>
            </div>
            <div class="mui-card-content" style="height:40vw;">
                <div class="mui-card-content-inner">
                    <a href="#">
                        
                    </a>
                </div>
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
        },
        created(){
            this.getImageList();
            /*this.getDownload();*/
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
                        <p>《小王子》</p>
                        <p>《追风筝的人》</p>
                        <p>《原来你还在这里》</p>
                    </div>  
                </div>
            </div>
		</div>
        <div class="mui-card">
            <div class="mui-card-header mui-card-media" style="text-align:center">
                <p>推荐阅读</p>
            </div>
            <div class="mui-card-content" style="height:80vw;">
                <div class="mui-card-content-inner" >
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
                <p>极爱</p>
            </div>
            <div class="mui-card-content" style="height:80vw;">
                <div class="mui-card-content-inner" >
                    
                </div>
            </div>
            <ul>
                <li v-for="(item,index) in text" :key="item.id">
                    <p @click="changeContent(index)">{{item.title}}</p>
                        <div class="box" v-show="item.showContent">
                            <p>hadfhalkdfadf</p>
                        </div>
                </li>
            </ul>
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
                text:[
                    {title:"我是段落部分的内容",showContent:false},
                    {title:"我是段落部分的内容",showContent:false}
                ]
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
        },
        created(){
            this.getImageList();
            /*this.getDownload();*/
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
</style>