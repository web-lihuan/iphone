const express=require("express");
const router=express.Router();
const pool=require("../pool");
var session=[];
router.post("/signin",(req,res)=>{
    var uname=req.body.uname;
    var upwd=req.body.upwd;
    var sql="select * from i_user where uname=? and upwd=?";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
            session.uid=result[0].uid;//放入session
            res.send({code:1,msg:result})
        }else{
            res.send({code:2,msg:"账户密码不正确"})
        }
    })
})  
router.post("/isLogin",(req,res)=>{
    if(session.uid!==undefined){
        var uid=session.uid;   //检查时取出session 
        var sql="select * from i_user where uid=?"
        pool.query(sql,[uid],(err,result)=>{
            if(err) console.log(err) 
            res.send({ok:1,msg:result})
        })
    }else{
        res.send({ok:2,msg:"未登录"})
    }
});
router.get("/signout",(req,res)=>{
    session.uid=undefined;
    res.send({ok:1});
})
router.post("/register",(req,res)=>{
    var $uname=req.body.uname; 
	var $upwd=req.body.upwd; 
	var $cpwd=req.body.cpwd;
	var reg=/^(\w{3,12})|([\u4e00-\u9fa5]{1,6})$/;
	if(!reg.test($uname)){
		res.send({code:3,msg:"用户名限制为3~12个汉字或字符"})
		return
	}
	if($upwd.length<6||$upwd.length>16){
		res.send({code:4,msg:"密码限制为6~15个字符"})
		return
	}
	if(!$cpwd===$upwd){
		res.send({code:5,msg:"密码确认错误"})
		return
	}
    var sql='insert into i_user values(null,?,?,?)';
		pool.query(sql,[$uname,$upwd,$cpwd],(err,result)=>{
			if(err) console.log(err);
			if(result.affectedRows>0){
				res.send({code:1,msg:"注册成功"})
			}else{
				res.send({code:2,msg:"注册失败"})
			}					
		})
});
router.post("/checkUname",(req,res)=>{
    var $uname=req.body.uname;
    var sql='select uid from i_user where uname=?';
		pool.query(sql,[$uname],(err,result)=>{
			if(err) console.log(err);
			if(result.length>0){
				res.send({code:1,msg:"用户名已存在"})
			}else{
				res.send({code:2,msg:"用户名可用"})
			}					
		})
});
module.exports=router;