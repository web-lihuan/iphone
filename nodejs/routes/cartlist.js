const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/list",(req,res)=>{
    var obj={col:1,msg:[
        {id:1,name:'华为',price:2200,count:1},
        {id:2,name:'联想',price:5000,count:2},
        {id:3,name:'苹果',price:4800,count:1}
    ]};
    res.send(obj);
})
module.exports=router;