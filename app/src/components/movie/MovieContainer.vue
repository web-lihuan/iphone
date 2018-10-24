<template>
    <div class="app_movie">
        <header id="heade" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/home">
            </router-link>
            <h1 class="mui-title">love  is  all</h1>
        </header>
        <div class="movie_mp">
            <ul>
                <li v-for="item in list" :key="item.id">
                    <video :src="item.movie_url" controls></video>
                    <p>{{item.title}}</p>
                </li>
            </ul>
        </div>
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
            getMovieList(){
                var url="movielist/list";
                this.$http.get(url).then(result=>{
                    this.list=result.body.msg;
                })
            }
        },
        created(){
            this.getMovieList();
        }
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
