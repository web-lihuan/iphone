//下拉列表
const express=require("express");
const router=express.Router();
const pool=require("../pool");
//json：占空间少，易于处理  
router.get("/load",(req,res)=>{
    var sql="SELECT id,img_url,title,content,ctime FROM xz_download";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});     
    })
});
module.exports=router;