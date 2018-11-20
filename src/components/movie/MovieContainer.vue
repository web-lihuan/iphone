<template>
    <!--视频-->
    <div class="app_movie">
        <header id="heade" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/home">
            </router-link>
            <h1 class="mui-title">love  is  all</h1>
        </header>
        <!--<div class="container">
            <my-video :sources="video.sources" :options="video.options"></my-video>
        </div>-->
        <div class="movie_mp">
            <ul>
                <li v-for="item in list" :key="item.id">
                    <video :src="item.movie_url" controls muted preload="metadata"></video>
                    <p>{{item.title}}</p>
                </li>
            </ul>
        </div>
    </div>
</template>
<script>
    /*import myVideo from 'vue-video'*/
    export default{
        data(){
            return {
                list:[],
                /*video:{
                    sources:[{
                        src:"http://video.artiz.com.cn/artiz.mp4",
                        type:'video/mp4'
                    }],
                    options:{
                        autoplay:false,
                        volume:0.6,
                        poster:"http://127.0.0.1:3000/img/1.jpg"
                    }
                }*/
            }
        },
        methods:{
            getMovieList(){
                var url="movielist/list";
                this.$http.get(url).then(result=>{
                    this.list=result.body.msg.splice(0,2);
                });
            }
        },
        created(){
            this.getMovieList();
        }/*,
        components:{
            myVideo
        },*/
    }
</script>
<style>
    .app_movie #heade .mui-action-back{
        color:#ddd;
    }
    .app_movie #heade .mui-title{
        color:#fff;
    }
    .app_movie .movie_mp{
        padding:10px;
    }
    .app_movie .movie_mp video{
        width:100%;
        height:200px;
        border-radius:5px;
    }
    .app_movie .movie_mp ul{
        list-style-type: none;
        display:flex;
        flex-wrap: wrap;
        padding:0;
    }
</style>
