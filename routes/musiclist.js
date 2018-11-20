//音频获取
const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/list",(req,res)=>{
    var sql="SELECT src,title,pic,artist FROM i_music";
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
});
module.exports=router;