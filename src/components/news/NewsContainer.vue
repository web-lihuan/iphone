<template>
    <!--图片-->
    <div class="app_newlist">
        <!--1.头部-->
        <header id="head" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/home">
            </router-link>
            <h1 class="mui-title">love  is  all</h1>
		</header>
        <div class="mui-content" style="background-color:#fff">
		    <ul class="mui-table-view mui-grid-view">
		        <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="item in load" :key="item.id">
		            <router-link :to="'/newsdetail/'+item.id">
		                <img class="mui-media-object" :src="item.img_url">
		                <div class="mui-media-body">{{item.ctime|dataLoad}}</div>
                    </router-link>
                </li>
		    </ul>    
		</div>
    </div>
</template>
<script>
    import {Toast} from "mint-ui";
    export default{
        data(){
            return {   //当前组件才可以使用
                list:[],
                pageIndex:0,  //页码
                load:[]
            }
        },
        methods:{
            getMore(){
                this.pageIndex++;  //页码加1
                var url="newslist/list?pno="+this.pageIndex;
                this.$http.get(url).then(result=>{
                    //赋值有问题，覆盖前一页数据
                    //this.list=result.body.msg.data;
                    //保存前一页 concat
                    this.list=this.list.concat(result.body.msg.data);
                    //完成功能 加一个提示 获取成功
                });
            },
            getNewsList(){
                var url="download/load";
                this.$http.get(url).then(result=>{
                    this.load=result.body.msg;
                })
            }
        },
        created(){
            this.getNewsList();
            this.getMore();
        }
    }
</script>
<style>
    .app_newlist .mui-table-view h1{
        font-size:14px;
    }
    .app_newlist li .mui-ellipsis{
        font-size:12px;
        color:#226aff;
        display:flex;
        justify-content:space-between;
    }
    .app_newlist #head .mui-action-back{
        color:#ddd;
    }
    .app_newlist #head .mui-title{
        color:#fff;
    }
    .app_newlist .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-object{
        height:126px;
    }
</style>