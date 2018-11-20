<template>
    <!--购物车详情-->
    <div class="app_paylist">
        <header id="header" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/pay"></router-link>
			<h1 class="mui-title">love  is  all</h1>
		</header>
        <!--第一部分：商品轮播区域
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <swipe-box :list="imagelist"></swipe-box>
                </div>
            </div>
		</div>-->        
        <!--第二部分：商品购买区域-->
        <div class="mui-card">
            <div class="mui-card-header">
                <img :src="info.img_url" alt="">
                <p class="paylist_one">
                    <span>作者：{{info.artist}}</span> <br>
                    <span>书名：{{info.title}}</span>
                </p>
            </div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <p class="price">
                        市场价：<del>￥{{info.p_old}}</del>
                        销售价：<span class="now_price">
                            ￥{{info.p_now}}
                        </span>
                    </p>
                    <p>购买数量</p>
                    <div class="mui-numbox">
                        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="goSub">-</button>
                        <input id="test" class="mui-input-numbox" type="number" v-model="num" />
                        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="goAdd">+</button>
                    </div>
                </div>
            </div>
            <div class="mui-card-footer">
                <p>
                    <mt-button type="primary" size="small">立即购买</mt-button>
                    <mt-button type="danger" size="small" @click="addCart()">加入购物车</mt-button>
                </p>
            </div>
        </div>
        <!--第三部分：商品参数区域-->
        <div class="mui-card">
            <div class="mui-card-header">商品参数</div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <p>商品货号：{{info.p_sn}}</p>
                    <p>商品类型：{{info.p_type}}</p>
                </div>
            </div>
            <div class="mui-card-footer">
                <img :src="info.img_url" alt="">
            </div>
        </div>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui';
    //1.导入轮播子组件
    import swiper from "../subcomponents/swiper.vue"
    //2.引入mui js 组件完成数字切换
    //由于mui.js  与脚手架严格模式有冲突所以放弃
    //import mui from "../../lib/mui/js/mui.js"
    export default{
        data(){
            return {
                //imagelist:[],
                id:this.$route.params.id,
                info:{},    //保存当前商品详细信息
                num:1
            }
        },
        methods:{
             addCart(){
                 Toast("添加成功")
                //修改Vuex共享数据,参数方法名称
                this.$store.commit("increment",this.num);
                this.$store.commit("addCarpanelData",this.info);
                //console.log(this.info);
            },
            goAdd(){ 
                if(this.num>=99){
                    return;
                }
                this.num++;
            },
            goSub(){
                if(this.num<=1){
                    return;
                }
                this.num--;
            },
            findDetail(){
                this.$http.get("pay/find?id="+this.id).then(result=>{
                    //保存info对象中
                    this.info=result.body.msg[0];
                    //console.log(this.info.id);
                })
            },
            /*getImageList(){
                this.$http.get("imagelist/list").then(result=>{
                    if(result.body.code==1){
                        this.imagelist=result.body.msg;
                    }
                })
            }*/
        },
        created(){
            /*this.getImageList();*/
            this.findDetail();
        }/*,
        components:{
            "swipe-box":swiper //注册子组件
        }*/
    }
</script>
<style>
    .app_paylist .now_price{
        font-weight:bold;
        color:red;
        font-size:16px;
    }
    .app_paylist #header .mui-action-back{
        color:#ddd;
    }
    .app_paylist #header .mui-title{
        color:#fff;
    }
    .app_paylist .mui-card-header > img:first-child{
        width:150px;
        height:150px;
    }
    .app_paylist .paylist_one{
        margin-bottom:0px;
    }
</style>
