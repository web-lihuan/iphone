<template>
    <!--阅读详情-->
    <div class="app-readinfo">
        <header id="header" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/read"></router-link>
			<h1 class="mui-title">love  is  all</h1>
		</header>
        <div class="readinfo-body">
            <h4>{{info.title}}</h4>
            <p>{{info.artist}}</p>
            <h6><pre>{{info.content}}</pre></h6>
        </div>
        <comment-box :id="this.id"></comment-box>
    </div>
</template>
<script>
    import comment from "../subcomponents/comment" 
    export default{
        data(){
            return {
                id:this.$route.params.id,
                info:{},    //保存当前商品详细信息
                newsinfo:{}  
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
            },
            findDetail(){
                var url="read/find?id="+this.id;
                this.$http.get(url).then(result=>{
                    //保存info对象中
                    this.info=result.body.msg[0];
                })
            }
        },
        created(){
            this.findDetail();
            this.getNewsDetail();
        },
        components:{
            'comment-box':comment 
        }
    }
</script>
<style>
    .app-readinfo{
        padding:10px;
    }
    .app-readinfo #header .mui-action-back{
        color:#ddd;
    }
    .app-readinfo #header .mui-title{
        color:#fff;
    }
    .app-readinfo h6{
        color:rgb(97, 93, 93);
        font-size:14px;
    }
    .app-readinfo p{
        font-size:12px;
        padding:15px 0 5px;
    }
</style>
