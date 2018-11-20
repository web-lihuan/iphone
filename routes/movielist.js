//图片轮播
const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/list",(req,res)=>{
    var sql="SELECT id,movie_url,title FROM i_movie";
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
});
module.exports=router;