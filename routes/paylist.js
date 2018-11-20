//图片轮播
const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/list",(req,res)=>{
    var sql="SELECT id,img_url,title,p_old,p_now,sell,count FROM i_pay";
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
})
//功能二：依据商品编号查询商品信息
router.get("/find",(req,res)=>{
    var id=req.query.id;
    var sql="SELECT id,img_url,title,p_old,p_now,p_sn,p_type,artist,count FROM i_pay WHERE id=?"
    pool.query(sql,[id],(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
})
module.exports=router; 