//图片轮播
const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/goodlist",(req,res)=>{
    //1.参数 
    var pno = req.query.pno;    //start
    var pageSize = req.query.pageSize;   //count
    //2.设置参数默认值
    if(!pno){
        pno = 1;
    }
    if(!pageSize){
        pageSize = 6; 
    }
    //3.验证用户输入
    var reg = /^[0-9]{1,}$/;
    if(!reg.test(pno)){
        res.send({code:-1,msg:"页码格式不正确"});
        return;   //加return 
    }
    if(!reg.test(pageSize)){
        res.send({code:-1,msg:"页大小格式不正确"});
        return;
    }
    //4.创建两条sql发送 总记录数   
    //4.1创建空对象保存返回数据
    var obj={pno:pno,pageSize:pageSize};
    //4.2创建变量保存(sql语句完成)进度
    var progress=0;
    var sql="SELECT count(id) as c FROM i_news";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        //console.log(result[0].c);
        var pageCount=Math.ceil(result[0].c/pageSize);
        obj.pageCount=pageCount;   //保存总页数
        progress+=50;              //记录当前进度
        if(process==100){         //两条sql完成
            res.send({code:1,msg:obj});  //发送结果
        }
    })
    //5.创建两条sql发送 当前页内容
    //var sql="SELECT id,title,ctime,click FROM xz_news LIMIT ?,?";
    var sql="SELECT id,title,ctime,click";
        sql+=" FROM i_news";
        sql+=" LIMIT ?,?";
    var offset=parseInt((pno-1)*pageSize);
    pageSize= parseInt(pageSize);
    pool.query(sql,[offset,pageSize],(err,result)=>{
        if(err) throw err;
        //console.log(result);
        obj.data=result;      //保存当前页内容
        progress+=50;       //进度加50 
        if(progress==100){     //如果两条sql语句全部完成
            res.send({code:1,msg:obj})    //发送结果
        }
    })
    //6.将数据json发送
});
router.get("/list",(req,res)=>{
    var sql="SELECT id,img_url,title,question,content,ctime FROM i_goodslist";
    pool.query(sql,(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
})
//功能二：依据商品编号查询商品信息
router.get("/find",(req,res)=>{
    var id=req.query.id;
    var sql="SELECT img_url,title,question,content,ctime FROM i_goodslist WHERE id=?"
    pool.query(sql,[id],(err,result)=>{
        if(err) console.log(err);
        res.send({code:1,msg:result})
    })
})
module.exports=router; 