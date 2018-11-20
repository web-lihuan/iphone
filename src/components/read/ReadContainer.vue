<template>
    <!--阅读-->
    <div class="app-read">
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
                        <p class='mui-ellipsis'>{{item.artist}}</p>
                    </div>
                </a>
            </li>
		</ul>
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
            getDetail(id){
                this.$router.push(
                    {path:"/readinfo/"+id}
                )
            },
            getReadinfo(){
                this.$http.get("read/list").then(result=>{
                    this.list=result.body.msg;
                })
            }
        },
        created(){
            this.getReadinfo();
        }
    }
</script>
<style>
    .app-read #header .mui-action-back{
        color:#ddd;
    }
    .app-read #header .mui-title{
        color:#fff;
    }
    .app-read .mui-ellipsis{
        font-size:10px;
    }
    .app-read .mui-media-body h5{
        color:#000;
    }
</style>
