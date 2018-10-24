const express=require("express");
const router=express.Router();
const pool=require("../pool");
//json：占空间少，易于处理  
router.get("/list",(req,res)=>{
    //1.参数  pno pageSize key[关键词]
    //2.  SELECT id,Iname,price FROM xz.xz_laptop WHERE Iname LIKE '%小%' 
    //    SELECT count(id) as c
    //3.json 
});
module.exports=router;