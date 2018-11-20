<template>
    <!--图片详情-->
    <div class="app_newdetail">
        <header id="head" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/home">
            </router-link>
            <h1 class="mui-title">love  is  all</h1>
		</header>
        <div class="newdetail-img">
            <img :src="newsinfo.img_url" alt="">
            <p>摄影 | 未知</p>
        </div>
        <div class="newdetail-content">
            <p>{{newsinfo.content}}</p>
        </div>
        <div class="newdetail-title">
            <p>《另一个你》</p>
        </div>
    </div>
</template>
<script>
    export default{
        data(){
            return {
                id:this.$route.params.id,
                newsinfo:{}     //保存当前新闻内容
            }
        },
        methods:{
            getNewsDetail(){
                //获取新闻的详细信息
                //var id=this.$route.params.id;
                var url="download/find?id="+this.id;
                this.$http.get(url).then(result=>{
                    this.newsinfo=result.body.msg[0]; 
                })
            }
        },
        created(){
            this.getNewsDetail();
        }
    }
</script>
<style>
    .app_newdetail #head .mui-action-back{
        color:#ddd;
    }
    .app_newdetail #head .mui-title{
        color:#fff;
    }
    .app_newdetail .newdetail-img img{
        width:100%;
        height:200px;
    }
    .app_newdetail .newdetail-img{
        text-align:center;
    }
    .app_newdetail{
        padding:0 4px;
    }
    .app_newdetail .newdetail-content{
        padding:27px;
    }
    .app_newdetail .newdetail-title{
        text-align:center;
    }
    .app_newdetail .title{
        font-size:16px;
        text-align:center;
        color:#25ad;
        margin:15px 0;
    }
    .app_newdetail .subtitle{
        font-size:13px;
        color:#226aff;
        display:flex;
        justify-content: space-between;
    } 
    .app_newdetail .container img{
        width:100%;
    }
</style>