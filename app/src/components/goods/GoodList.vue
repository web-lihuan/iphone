<template>
    <div class="app-goods-list">
        <header id="header" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/home"></router-link>
			<h1 class="mui-title">love  is  all</h1>
		</header>
        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.id" @click="getDetail(item.id)">
                <a href="javascript:;">
                    <img class="mui-media-object mui-pull-left" :src="item.img_url">
                    <div class="mui-media-body">
                        <h5>{{item.title}}</h5>
                        <p class='mui-ellipsis'>{{item.question}}</p>
                    </div>
                </a>
            </li>
		</ul>
        <!--<div class="app-goods-item" v-for="item in list" :key="item.id" @click="getDetail(item.id)"> 
            <img :src="item.img_url" alt="">
            <h1 class="title">{{item.title}}</h1>
            <div class="info">
                <p class="price">
                    <span class="old">￥{{item.p_old}}</span>
                    <span class="now">￥{{item.p_now}}</span>
                </p>
                <p class="sell">  
                    <span>热卖中</span>
                    <span>剩{{item.sell}}}件</span>
                </p>
            </div>
        </div>
        <mt-button type="primary" size="large">加载更多</mt-button>-->
    </div>
</template>
<script>
    export default{
        data(){
            return {
                list:[]
            }
        },
        methods:{
            getDetail(id){   //e当前点击函数的事件
                this.$router.push({path:"/home/goodsinfo/"+id});
                //console.log(id);
                //console.log(e.target.dataset.id);
                //编程式导航一跳转
                //this.$router.push("/home/goodsinfo");
                //编程式导航二
                //this.$router.push({path:"/home/goodsinfo"});
                //编程式导航三
                //this.$router.push({name:"goodsinfo"});
            },
            getGoodsList(){
                this.$http.get("goodslist/list").then(result=>{
                    this.list=result.body.msg;
                    console.log(this.list);
                })
            }
        },
        created(){
            //console.log(123)
            this.getGoodsList();
        }
    }
</script>
<style>
    .app-goods-list{
        display:flex;
        flex-wrap:wrap;
        /*padding:5px;*/
        justify-content: space-between;
        /*border:1px solid red;*/
    }
    .app-goods-list .app-goods-item{
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
    .app-goods-list .app-goods-item img{
        width:100%;
    }
    .app-goods-list .app-goods-item .title{
        font-size:14px;
    }
    .app-goods-list .app-goods-item .info{
        background-color:#ddd;
    }
    .app-goods-list .app-goods-item .info p{
        margin:0;
        padding:5px;
    }
    .app-goods-list .app-goods-item .info .price .now{
        color:red;
        font-weight:bold;
        font-size:16px;
    }
    .app-goods-list .app-goods-item .info .price .old{
        text-decoration:line-through;
        font-size:12px;
        padding-right:15px;
    }
    .app-goods-list .app-goods-item .info .sell{
        display:flex;
        justify-content: space-between;
        font-size:12px;
    }
    .app-goods-list #header .mui-action-back{
        color:#ddd;
    }
    .app-goods-list #header .mui-title{
        color:#fff;
    }
</style>
