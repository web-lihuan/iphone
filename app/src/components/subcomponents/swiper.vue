<template>
    <div class="app_subcomp_swipt">
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="item in list" :key="item.id">
                <img :src="item.img_url" /> 
            </mt-swipe-item>
        </mt-swipe>
    </div>
</template>
<script>
    export default{
        data(){
            return{
                //list:[]  不要在props声明过了以后再次声明
            }
        },
        methods:{

        },
        created(){
            
        },
        props:["list"]  //接收父组件传的list
    }
</script>
<style>
    .app_subcomp_swipt .mint-swipe{
        height:200px;
    }
    .app_subcomp_swipt .mint-swipe .mint-swipe-item{
        text-align:center;
    }
    .app_subcomp_swipt .mint-swipe img{
        width:100%;
    }
</style>
