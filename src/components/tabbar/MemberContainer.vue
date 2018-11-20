<template>
    <!--首页搜索-->
    <div class="app_member">
         <vue-particles color="#939395" :particleOpacity="0.7" :particlesNumber="80" shapeType="circle" :particleSize="4"
        linesColor="#dedede" :linesWidth="2" :lineLinked="true" :lineOpacity="0.4" :linesDistance="150" :moveSpeed="3"
        :hoverEffect="true" hoverMode="grab" :clickEffect="true" clickMode="push">
         </vue-particles>
         <header id="head" class="mui-bar mui-bar-transparent">
			<div class="mui-input-row mui-search">
                <input type="search" class="mui-input-clear" placeholder="search" v-model="kw" @focus="showAll()" @blur="hiddenAll">
           </div>
		</header> 
        <!--商品列表-->
        <div class="mui-card" v-show="showSearch">
            <div class="mui-card-header">搜索结果</div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    {{noproduct}}
                    <ul class="mui-table-view" v-for="item in search" :key="item.index">
                        <li class="mui-table-view-cell mui-media">
                            <a href="javascript:;">
                                <img class="mui-media-object mui-pull-left" :src="item.img_url">
                                <div class="mui-media-body">
                                    <p class='mui-ellipsis'>
                                        {{item.title}}
                                    </p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="show_all" v-show="showList">
            <mt-navbar v-model="selected">
                <mt-tab-item id="1">图文</mt-tab-item>
                <mt-tab-item id="2">问答</mt-tab-item>
                <mt-tab-item id="3">阅读</mt-tab-item>
                <mt-tab-item id="4">购物</mt-tab-item>
                <mt-tab-item id="5">影视</mt-tab-item>
                <mt-tab-item id="6">音乐</mt-tab-item>
            </mt-navbar>
            <!-- tab-container -->
            <mt-tab-container v-model="selected">
                <mt-tab-container-item id="1"><!--图文 -->
                    <div class="mui-content mypic" style="background-color:#fff">
                        <ul class="mui-table-view mui-grid-view">
                            <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="item in pic" :key="item.id">
                                <router-link :to="'/newsdetail/'+item.id">
                                    <img class="mui-media-object" :src="item.img_url">
                                    <div class="mui-media-body">{{item.ctime|dataLoad}}</div>
                                </router-link>
                            </li>
                        </ul>    
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="2"><!--问答 -->
                    <div class="mui-content" style="background-color:#fff">
                       <ul class="mui-table-view">
                            <li class="mui-table-view-cell mui-media" v-for="item in question" :key="item.id" @click="getDetail(item.id)">
                                <a href="javascript:;">
                                    <img class="mui-media-object mui-pull-left" :src="item.img_url">
                                    <div class="mui-media-body">
                                        <h5>{{item.title}}</h5>
                                        <p class='mui-ellipsis'>{{item.question}}</p>
                                    </div>
                                </a>
                            </li>
                        </ul> 
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="3"><!--阅读 -->
                    <div class="mui-content" style="background-color:#fff">
                        <ul class="mui-table-view">
                            <li class="mui-table-view-cell mui-media" v-for="item in read" :key="item.id" @click="getReadDetail(item.id)">
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
                </mt-tab-container-item>
                <mt-tab-container-item id="4" class="pay_shop"><!--购物 -->
                    <div class="app-goods-item" v-for="item in shop" :key="item.id" @click="getPayDetail(item.id)"> 
                        <img :src="item.img_url" alt="">
                        <h1 class="title">{{item.title}}</h1>
                        <div class="info">
                            <p class="price">
                                <span class="old">￥{{item.p_old}}</span>
                                <span class="now">￥{{item.p_now}}</span>
                            </p>
                            <p class="sell">  
                                <span>热卖中</span>
                                <span>剩{{item.sell}}件</span>
                            </p>
                        </div>
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="5" class="movie_title"><!--影视 -->
                    <div class="movie_mp">
                        <ul>
                            <li v-for="item in movie" :key="item.id">
                                <video :src="item.movie_url" controls muted preload="metadata"></video>
                                <p>{{item.title}}</p>
                            </li>
                        </ul>
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="6"><!--音乐 -->
                    <a-player autoplay :music="{
                        title: 'secret base~君がくれたもの~',
                        artist: 'Silent Siren',
                        src: 'http://127.0.0.1:3000/img/bg.mp3',
                        pic: 'http://127.0.0.1:3000/img/1.jpg'
                    }"
                    :list=music
                    />
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
    </div>
</template>
<script>
    import VueAplayer from 'vue-aplayer'
    /*节流函数 */
    const delay = (function() {
        let timer = 0;
        return function(callback, ms) {
            clearTimeout(timer);
            timer = setTimeout(callback, ms);
        };
    })();
    export default{
        components: {
            'a-player': VueAplayer
        },
        data(){
            return {
                kw:"",
                selected:'1',
                pic:[],
                movie:[],
                music:[],
                shop:[],
                read:[],
                question:[],
                search:[],
                noproduct:"",
                showList:true,
                showSearch:false
            }
        },
        watch: {
        //watch title change
            kw(){
                delay(() => {
                    this.fetchData();
                }, 300);
            },
        },
        methods:{
            showAll(){
                this.showList=false;
                this.showSearch=true;
            },
            hiddenAll(){
                this.showList=true;
                this.showSearch=false;
                this.kw=""
            },
            getPayDetail(id){ 
                this.$router.push({path:"/paylist/"+id});
            },
            getReadDetail(id){
                this.$router.push(
                    {path:"/readinfo/"+id}
                )
            },
            getDetail(id){
                this.$router.push({path:"/home/goodsinfo/"+id});
            },
            getGoodsList(){
                this.$http.get("goodslist/list").then(result=>{
                    this.question=result.body.msg;
                })
            },
            getReadinfo(){
                this.$http.get("read/list").then(result=>{
                    this.read=result.body.msg;
                })
            },
            getPaysList(){
                this.$http.get("pay/list").then(result=>{
                    this.shop=result.body.msg;
                })
            },
            getMusic(){
                var url="musiclist/list"
                this.$http.get(url).then(result=>{
                    this.music=result.body.msg;
                })
            },
            getNewsList(){
                var url="download/load";
                this.$http.get(url).then(result=>{
                    this.pic=result.body.msg;
                })
            },
            getMovieList(){
                var url="movielist/list";
                this.$http.get(url).then(result=>{
                    this.movie=result.body.msg.splice(0,2);
                });
            },
            fetchData() {
                if(this.kw){
                    var url="http://127.0.0.1:3000/searchlist/list?kw="+this.kw
                    this.$http.get(url).then(res=>{
                        if(res.body.code==1){
                            this.search=res.body.msg;
                            this.noproduct=""
                        }else{
                            this.search=[];
                            this.noproduct="未查询到相关商品"
                        }
                    }) 
                }else{
                    this.search=[];
                }   
            }
        },
        created(){
            this.getNewsList();
            this.getMovieList();
            this.getMusic();
            this.getPaysList();
            this.getReadinfo();
            this.getGoodsList();
        }
    }
</script>
<style>
    .app_member .mint-navbar .mint-tab-item.is-selected {
        border-bottom: 3px solid #11a2d8;
    }
    .app_member .mint-tab-item-label {
        color: #45453d;
    }
    .app_member #head .mui-action-back{
        color:#ddd;
    }
    .app_member #head .mui-title{
        color:#fff;
    }
    .app_member #head .mui-input-row .mui-input-clear{
        margin-top:20px;
    }
    .app_member .particles-js-canvas-el{
        height:561px !important;
    }
    .app_member{
        position:relative;
    }
    .app_member .mui-card{
        width:95%;
        position:absolute;
        top:10px;
        left:0;
    }
    .app_member .pay_shop{
        display:flex;
        flex-wrap:wrap;
        padding:7px;
        justify-content: space-between;
        /*border:1px solid red;*/
    }
    .app_member .pay_shop .app-goods-item{
        width:49%;
        /*height:320px;*/
        border:1px solid #ccc;
        box-shadow:0 0 8px #ccc;
        margin:4px 0;
        padding:2px;
        display:flex;   /*商品内容弹性布局*/
        flex-direction: column;  /*布局方向垂直*/
        justify-content: space-between;
        min-height:293px;
    }
    .app_member .pay_shop .app-goods-item img{
        width:100%;
    }
    .app_member .pay_shop .app-goods-item .title{
        font-size:14px;
    }
    .app_member .pay_shop .app-goods-item .info{
        background-color:#ddd;
    }
    .app_member .pay_shop .app-goods-item .info p{
        margin:0;
        padding:5px;
    }
    .app_member .pay_shop .app-goods-item .info .price .now{
        color:red;
        font-weight:bold;
        font-size:16px;
    }
    .app_member .pay_shop .app-goods-item .info .price .old{
        text-decoration:line-through;
        font-size:12px;
        padding-right:15px;
    }
    .app_member .pay_shop .app-goods-item .info .sell{
        display:flex;
        justify-content: space-between;
        font-size:12px;
    }
    .app_member .movie_title .movie_mp{
        padding-left:10px;
        padding-right:10px;
    }
    .app_member .movie_title .movie_mp video{
        width:100%;
        height:200px;
        border-radius:5px;
    }
    .app_member .movie_title .movie_mp ul{
        list-style-type: none;
        display:flex;
        flex-wrap: wrap;
        padding:0;
    }
    .app_member .show_all{
        width:100%;
        position:absolute;
        top:20px;
        left:0;
        background:#fff;
    }
    .app_member .mypic .mui-media-object{
        height:126px !important;
    }
</style>