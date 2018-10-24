//图片轮播
const express=require("express");
const router=express.Router();
const pool=require("../pool");
//json：占空间少，易于处理  
router.get("/list",(req,res)=>{
    var sql="SELECT id,img_url,title FROM xz_imagelist";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});     
    })
});
module.exports=router;