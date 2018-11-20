const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/list",(req,res)=>{
    var sql="SELECT id,img_url,title,artist,content FROM i_read";
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
})
//功能二：依据商品编号查询商品信息
router.get("/find",(req,res)=>{
    var id=req.query.id;
    var sql="SELECT img_url,title,artist,content FROM i_read WHERE id=?"
    pool.query(sql,[id],(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
})
module.exports=router; 