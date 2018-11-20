//下拉列表
const express=require("express");
const router=express.Router();
const pool=require("../pool");
//json：占空间少，易于处理  
router.get("/load",(req,res)=>{
    var sql="SELECT id,img_url,title,content,ctime FROM i_download";
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result});     
    })
});
module.exports=router;

//功能二：依据用户的id查找新闻详细信息
router.get("/find",(req,res)=>{
    //1.参数id
    var id=req.query.id;
    //1.1 偷懒操作所有参数过滤  正则表达式
    //2.sql
    var sql="SELECT `id`, `title`, `content`,";
        sql+="   `img_url`, ";
        sql+="   `ctime` FROM `i_download` ";
        sql+="  WHERE id=?";
    //3.json
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    })
});