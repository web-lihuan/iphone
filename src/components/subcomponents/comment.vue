<template>
    <div class="app_subcomment">
        <h1>发表评论</h1>
        <hr/>
        <textarea placeholder="请输入评论的内容(最多吐槽120字)" maxlength="120" v-model="msg">

        </textarea>
        <mt-button size="large" type="primary" @click="postComment()">发表评论</mt-button>
        <div class="cmt-list">
            <div class="cmt-list-item"  v-for="(item,i) in list" :key="item.id">
                <div class="cmt-title">
                    第{{i+1}}楼&nbsp;&nbsp; 用户:{{item.user_name}}发表时间: {{item.ctine|dataFormat}}
                </div>
                <div class="cmt-body">
                    {{item.content}}
                </div>
            </div>
        </div>
        <mt-button type="danger" size="large" @click="getCommentList()">加载更多</mt-button>
    </div>
</template>
<script>
    import {Toast} from "mint-ui";
    export default{
        data(){
            return {
                list:[],
                msg:"",   //双向绑定的留言
                pageIndex:0 //当前显示的页码
            }
        },
        methods:{
            getCommentList(){
                //1.对象成功创建成功以后加载第一页
                //2.点击加载更多按钮加载下一页
                //3.添加新评论，看第一条内容
                this.pageIndex++;  //当前页+1
                //#url
                var url="newslist/commentlist?nid="+this.id;
                    url+="&pno="+this.pageIndex;
                this.$http.get(url).then(result=>{  //用的父组件的props
                    //console.log(result.body.data)
                    this.list=this.list.concat(result.body.data);
                })
            },
            postComment(){
                //发表评论
                var username="匿名用户";//用户名
                var nid=this.id;   //新闻编号
                var content=this.msg;  //双向绑定的内容
                //对留言内容进行验证 大于2
                //console.log(username+":"+nid+":"+content)
                var url="newslist/saveComment";
                var obj={nid:nid,content:content,user_name:username};
                this.$http.post(url,obj).then(result=>{
                    //console.log(result);
                    if(result.body.code== 1){
                        //1.添加完成之后清空输入内容
                        this.msg="";
                        //2.提示
                        Toast(result.body.msg);
                        this.pageIndex=0;   //将当前页码清零
                        this.list=[];      //数据值清空
                        this.getCommentList();  //加载第一页
                    }else{
                        Toast(result.body.msg); 
                    }
                })
            }
        },
        created(){
            this.getCommentList();
            //console.log(123) 
            //console.log(this.id);  //在程序中直接使用this.id用的props
        },
        props:["id"]   //接收父组件传递的参数
    }
</script>
<style>
    .app_subcomment h1{
        font-size:18px;
    }
    .app_subcomment textarea{
        font-size:14px;
        height:85px;
        margin:0;
    }
    .app_subcomment .cmt-list{
        margin:5px 0;
    }
    .app_subcomment .cmt-list .cmt-list-item{
        font-size:13px;
    }
    .app_subcomment .cmt-list .cmt-list-item .cmt-title{
        line-height:30px;
        background-color:#ccc;
    }
    .app_subcomment .cmt-list .cmt-list-item .cmt-body{
        line-height:30px;
        text-indent:2em;
    }
</style>
