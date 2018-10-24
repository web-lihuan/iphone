//图片轮播
const express=require("express");
const router=express.Router();
const pool=require("../pool");
//json：占空间少，易于处理  
// router.get("/list",(req,res)=>{
//     var sql="SELECT id,img_url,title FROM xz_imagelist";
//     pool.query(sql,(err,result)=>{
//         if(err) throw err;
//         res.send({code:1,msg:result});     
//     })
// });
router.get("/list",(req,res)=>{
    /*var obj=[
        {id:1,img_url:"http://127.0.0.1:3000/img/1.jpg",title:"魅族6",p_old:"3000.00",p_now:"2100.00",sell:1},
        {id:2,img_url:"http://127.0.0.1:3000/img/2.jpg",title:"360 N7",p_old:"1100.00",p_now:"333.33",sell:1},
        {id:3,img_url:"http://127.0.0.1:3000/img/3.jpg",title:"联想",p_old:"3000.00",p_now:"2100.00",sell:1},
        {id:4,img_url:"http://127.0.0.1:3000/img/4.jpg",title:"华为",p_old:"1100.00",p_now:"333.33",sell:1},
        {id:5,img_url:"http://127.0.0.1:3000/img/1.jpg",title:"苹果",p_old:"3000.00",p_now:"2100.00",sell:1},
        {id:6,img_url:"http://127.0.0.1:3000/img/2.jpg",title:"锤子",p_old:"1100.00",p_now:"333.33",sell:1},
        {id:7,img_url:"http://127.0.0.1:3000/img/3.jpg",title:"OPPO",p_old:"3000.00",p_now:"2100.00",sell:1},
        {id:8,img_url:"http://127.0.0.1:3000/img/4.jpg",title:"VIVO",p_old:"1100.00",p_now:"333.33",sell:1},
    ];*/
    var sql="SELECT id,img_url,title,question,content,ctime FROM xz_goodslist";
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
})
//功能二：依据商品编号查询商品信息
router.get("/find",(req,res)=>{
    var obj={id:"9",title:"小辣椒 10",p_old:2199,p_now:2099,p_sn:"2199282",p_type:"青春款"};
    res.send(obj);
})
module.exports=router; 
//http://127.0.0.1:3000/goodslist/list