<template>
    <!--首页购物车-->
    <div class="app_shop">
        <vue-particles color="#939395" :particleOpacity="0.7" :particlesNumber="80" shapeType="circle" :particleSize="4"
        linesColor="#dedede" :linesWidth="2" :lineLinked="true" :lineOpacity="0.4" :linesDistance="150" :moveSpeed="3"
        :hoverEffect="true" hoverMode="grab" :clickEffect="true" clickMode="push">
         </vue-particles>
        <header id="head" class="mui-bar mui-bar-transparent">
            <h1 class="mui-title">love  is  all</h1>
		</header>
		<div class="mui-card">
            <div class="mui-card-header">购物车</div>
            <div class="mui-cart-content" style="text-align:center" v-show="offShow">
                <img src="../../img/cart.jpg" alt="" style="width:25%;">
                <p>不管多忙，都别忘记犒劳自己~</p>
            </div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner" v-for="item in cartData" :key="item.id">
                    <div class="card-img">
                        <img :src="item.img_url" alt="">
                    </div>
                    <div class="card-detail">
                        <h5>{{item.title}}</h5>  
                        <p>￥{{item.p_now}}</p>
                    </div>
                    <div class="mui-numbox">
                        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="setSub(item.id)">-</button>
                        <input id="test" class="mui-input-numbox" type="number" :value="item.count"/>
                        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="setAdd(item.id)">+</button>
                    </div>
                </div>
            </div>
            <div class="mui-card-footer">
                小计：<span>￥{{getsubtotal}}</span>
            </div>
		</div>
    </div>
</template>
<script>
    export default{  
        data(){
            return {
                offShow:true,
                isLogin:false,
                list:[],
                num:1,
                //id:this.$route.params.id,
                //selected:1
                uid:0
            }
        },
        mounted(){
            var self=this;
            this.$http.post("user/isLogin").then(res=>{
                if(res.data.ok==1){
                    self.isLogin=true;
                    this.uid=res.body.msg[0].uid
                }else{
                    self.isLogin=false;
                }
            })
        },
        methods:{
            setSub(id){
                for(var item of this.cartData){  
                    if(item.id==id){
                        if(item.count<=1){
                            break;
                        }
                        item.count--;
                    }
                }
            },
            setAdd(id){
                for(var item of this.cartData){
                    if(item.id==id){
                        item.count++;
                    }
                }
            },
            compare(){
                if(this.cartData.length>0){
                    this.offShow=false
                }
            }
        },
        created(){
            this.compare()
        },
        computed:{
            getsubtotal:function(){
                var sum=0;
                for(var item of this.cartData){
                    sum+=item.p_now *item.count;
                }
                return parseInt(sum);
            },
            cartData(){
                return this.$store.state.carPanelData;
            }
        }
    }
</script>
<style>
    .app_shop .mui-input-clear{
        margin:0;
    }
    .app_shop #head .mui-title{
        color:#fff;
    }
    .app_shop .mui-card-content-inner{
        display:flex !important;
        justify-content:space-around !important;
        align-items:stretch
    }
    .app_shop .card-img img{
        width:70px;
        height:70px;
    }
    .app_shop .mui-numbox{
        align-self: flex-end;
    }
    .app_shop .card-detail h5{
        margin-top:0;
        margin-bottom:35px;
        font-size: 16px;
        color:#000;
    }
    .app_shop .card-detail p{
        margin:0;
    }
    .app_shop .mui-card-content-inner{
        border-top:1px solid #ddd;
    }
    .app_shop .particles-js-canvas-el{
        height:561px !important;
    }
    .app_shop{
        position:relative;
    }
    .app_shop .mui-card{
        width:95%;
        position:absolute;
        top:0px;
        left:0;
    }
</style>