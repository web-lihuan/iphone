const express=require("express");
const router=express.Router();
const pool=require("../pool");
//json：占空间少，易于处理  
router.get("/list",(req,res)=>{
    //1.参数  pno pageSize key[关键词]
    //2.  SELECT id,Iname,price FROM i_laptop WHERE Iname LIKE '%小%' 
    //    SELECT count(id) as c
    //3.json 
    var kw=req.query.kw;
    var sql=`SELECT * FROM i_search WHERE title LIKE '%${kw}%'`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
            res.send({code:1,msg:result});
        }else{
            res.send({code:2,msg:"查询结果为空"});
        }
        
    })
});
module.exports=router;