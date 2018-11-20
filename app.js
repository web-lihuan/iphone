//app.js
//1:加载模块 express  
//2:创建express
//3:绑定监听端口 3000
//4:指定静态目录 public
const express=require("express");
const session=require("express-session");
//1.2加载处理post参数的第三方模块
const bodyParser=require("body-parser");
//1.1加载图片轮播(路由模块一个文件<包含了一组功能>)
const routerImageList=require("./routes/imagelist");
const routerNewsList=require("./routes/newslist");
const routerGoodsList=require("./routes/goodslist");
const routerCartList=require("./routes/cartlist");
const routerSearchList=require("./routes/searchlist");
const routerDownLoad=require("./routes/download");
const routerMovieList=require("./routes/movielist");
const routerMusicList=require("./routes/musiclist");
const routerReadInfo=require("./routes/readinfo");
const routerPayList=require("./routes/paylist");
const User=require("./routes/user");

//2.创建express
const app=express();
//2.0配置模块
app.use(bodyParser.urlencoded({
    extended:false
}))
//2.1加载处理跨域模块
const cors=require("cors");
//2.2允许哪些地址跨域访问
//配置哪些程序可以跨域访问
app.use(cors({
    origin:["http://127.0.0.1:3001"],
    credentials:true  //服务器接收cookie
}))
app.listen(3000,()=>{
    console.log("good");
});

//__dirname 当前程序所有目录完整路径
app.use(express.static(__dirname+"/public"));
//配置session在静态资源之后，配置路由之前
app.use(session({
    secret:'sadfsadfdsaf',
    resave:false,
    saveUninitialized:true
}))
//将图片轮播模块加载当前应用中指定访问路径
//http://127.0.0.1:3000/imagelist/list
app.use('/imagelist',routerImageList);
app.use('/newslist',routerNewsList);
app.use('/goodslist',routerGoodsList);
app.use('/cartlist',routerCartList);
app.use('/searchlist',routerSearchList);
app.use('/download',routerDownLoad);
app.use('/movielist',routerMovieList);
app.use('/musiclist',routerMusicList);
app.use('/read',routerReadInfo);
app.use('/pay',routerPayList);
app.use('/user',User);