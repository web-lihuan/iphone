<template>
    <!--问答详情-->
    <div class="app-goodsinfo">
        <header id="header" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/home/goodslist"></router-link>
			<h1 class="mui-title">love  is  all</h1>
		</header>
        <h4>{{info.title}}</h4>
        <p>极爱App工作室问：</p>
        <h6>{{info.title}}</h6>
        <p>网友答：</p>
        <h6><pre>{{info.content}}</pre></h6>
        <comment-box :id="this.id"></comment-box>
    </div>
</template>
<script>
    import comment from "../subcomponents/comment" 
    export default{
        data(){
            return {
                imagelist:[],
                id:this.$route.params.id,
                info:{},    //保存当前商品详细信息
                num:1,
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
                var url="goodslist/find?id="+this.id;
                this.$http.get(url).then(result=>{
                    //保存info对象中
                    this.info=result.body.msg[0];
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
            this.getImageList();
            this.findDetail();
            this.getNewsDetail();
        },
        components:{
            'comment-box':comment 
        }
    }
</script>
<style>
    .app-goodsinfo{
        padding:10px;
    }
    .app-goodsinfo #header .mui-action-back{
        color:#ddd;
    }
    .app-goodsinfo #header .mui-title{
        color:#fff;
    }
    .app-goodsinfo p{
        font-size:12px;
    }
    .app-goodsinfo h6{
        color:rgb(75, 75, 75);
        font-size:16px;
    }
</style>
