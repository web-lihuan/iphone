<template>
    <div class="app_shop">
        <div class="mui-input-row mui-search">
            <input type="search" class="mui-input-clear" placeholder="search">
        </div>
        <mt-navbar v-model="selected">
            <mt-tab-item id="1">采集</mt-tab-item>
            <mt-tab-item id="2">画板</mt-tab-item>
            <mt-tab-item id="3">平面</mt-tab-item>
        </mt-navbar>
        <!-- tab-container -->
        <mt-tab-container v-model="selected">
            <mt-tab-container-item id="1">
                <mt-cell v-for="n in 10" :title="'内容 ' + n"/>
            </mt-tab-container-item>
            <mt-tab-container-item id="2">
                <mt-cell v-for="n in 4" :title="'测试 ' + n"/>
            </mt-tab-container-item>
            <mt-tab-container-item id="3">
                <mt-cell v-for="n in 6" :title="'选项 ' + n"/>
            </mt-tab-container-item>
        </mt-tab-container>
        <!--<div class="mui-card">
            <div class="mui-card-header">购物车</div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner" v-for="item in list" :key="item.id">
                    {{item.name}}  ￥{{item.price}}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
		</div>-->
    </div>
</template>
<script>
    export default{  
        name:'page-navbar',
        data(){
            return {
                list:[],
                selected:1
            }
        },
        methods:{
            setSub(id){
                for(var item of this.list){  
                    if(item.id==id){
                        if(item.count<=1){
                            break;
                        }
                        item.count--;
                    }
                }
            },
            setAdd(id){
                //console.log("购物车数量增加"+id);
                //当前购物车id，依据id将对应count自增操作
                for(var item of this.list){
                    if(item.id==id){
                        item.count++;
                    }
                }
            },
            getCartlist(){
                this.$http.get("cartlist/list").then(result=>{
                    this.list=result.body.msg;
                    //console.log(this.list);
                })
            }
        },
        created(){
            this.getCartlist();
        },
        computed:{
            //计算属性  计算多个数据变化
            getsubtotal:function(){
                var sum=0;
                for(var item of this.list){
                    sum+=item.price *item.count;
                }
                return sum;
            }
        }
    }
</script>
<style>
    .mui-input-clear{
        margin:0;
    }
</style>