<template>
    <div class="app_goodsinfo">
        <!--第一部分：商品轮播区域-->
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <swipe-box :list="imagelist"></swipe-box>
                </div>
            </div>
		</div>        
        <!--第二部分：商品购买区域-->
        <div class="mui-card">
            <div class="mui-card-header">{{info.title}}</div>
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
                    <mt-button type="danger" size="small">加入购物车</mt-button>
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
                    <p>商品类型：{{info.p_type}}</p>
                </div>
            </div>
            <div class="mui-card-footer">
                按钮 图文介绍 商品评论
            </div>
        </div>
    </div>
</template>
<script>
    //1.导入轮播子组件
    import swiper from "../subcomponents/swiper.vue"
    //2.引入mui js 组件完成数字切换
    //由于mui.js  与脚手架严格模式有冲突所以放弃
    //import mui from "../../lib/mui/js/mui.js"
    export default{
        data(){
            return {
                imagelist:[],
                //id:this.$route.params.id
                info:{},    //保存当前商品详细信息
                num:1
            }
        },
        methods:{
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
                this.$http.get("goodslist/find").then(result=>{
                    //保存info对象中
                    this.info=result.body;
                    //console.log(this.info);
                })
            },
            getImageList(){
                this.$http.get("imagelist/list").then(result=>{
                    if(result.body.code==1){
                        this.imagelist=result.body.msg;
                    }
                })
            }
        },
        created(){
            //console.log(123)
            //console.log(this.id);
            this.getImageList();
            this.findDetail();
        },
        components:{
            "swipe-box":swiper   //注册子组件
        }
    }
</script>
<style>
    .now_price{
        font-weight:bold;
        color:red;
        font-size:16px;
    }
</style>
