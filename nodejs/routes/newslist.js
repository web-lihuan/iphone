const express=require("express");
const router=express.Router();
const pool=require("../pool");
//GET 请求方式  意义 获取数据
router.get("/list",(req,res)=>{
    //1.参数 
    var pno = req.query.pno;    //start
    var pageSize = req.query.pageSize;   //count
    //2.设置参数默认值
    if(!pno){
        pno = 1;
    }
    if(!pageSize){
        pageSize = 10; 
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
    var sql="SELECT count(id) as c FROM xz_news";
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
        sql+=" FROM xz_news";
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
//功能二：依据用户的id查找新闻详细信息
router.get("/find",(req,res)=>{
    //1.参数id
    var id=req.query.id;
    //1.1 偷懒操作所有参数过滤  正则表达式
    //2.sql
    var sql="SELECT `id`, `title`, `content`,";
        sql+="   `click`, `img_url`, `price`,";
        sql+="   `ctime` FROM `xz_news` ";
        sql+="  WHERE id=?";
    //3.json
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    })
});
/*router.get("/test",(req,res)=>{
    //node.js 优点占位符大大提升了sql安全级别
    //1.参数id
    //2.sql
    //3.json
    var sql="SELECT count(uid) as c FROM xz_user";
    sql+="  WHERE uname = '"+uname+"' ";
    sql+="  AND upwd= md5('"+upwd+"')";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        var rs=result[0].c;
        if(rs<1){
            res.send("登录失败");
        }else{
            res.send("登录成功");
        }
    })
});*/
//功能三：分页显示评论列表
router.get("/commentlist",(req,res)=>{
    //1.参数 pno pageSize nid 
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    var nid=req.query.nid;
    if(!pno){
        pno=1
    }
    if(!pageSize){
        pageSize=5
    }
    //2.sql总记录数
    var obj={pno:pno,pageSize:pageSize};
    var progress=0;
    var sql="SELECT count(id) as c ";
        sql+=" FROM xz_comment";
        sql+=" WHERE nid=?";
    pool.query(sql,[nid],(err,result)=>{
        if(err) throw err;
        obj.pageCount=Math.ceil(result[0].c/pageSize);
        progress+=50;
        if(progress==100){
            res.send(obj);
        }
    })
    //当前页内容
    var offset=parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
    var sql="SELECT `id`, `nid`, ";
        sql+="   `ctine`, `content`,";
        sql+="   `content`, `user_name`,  `isdel`";
        sql+="    FROM `xz_comment` ";
        sql+="   WHERE nid=?";
        sql+="   ORDER BY id DESC";
        sql+="   LIMIT ?,?"; 
    pool.query(sql,[nid,offset,pageSize],(err,result)=>{
        if(err) throw err;
        obj.data=result;
        progress+=50;
        if(progress ==100){
            res.send(obj);
        }
    })
    //3.json   {code:1,msg:[],pno:2.pageCount:2,pageSize:5}

})
//功能四：添加一条评论
router.post("/saveComment",(req,res)=>{
    //1.参数 nid username content 
    //2.content 不为空 长度大于2
    // 3.sql INSERT INTO `xz_comment`(`id`, `nid`, `ctine`, `content`, `user_name`, `isdel`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6]) 
    //4.返回数据
    var nid=parseInt(req.body.nid);  //新闻编号
    var username=req.body.user_name;  //用户名
    var content=req.body.content;   //评论内容
    if(content.length<2){
        res.send({code:-1,msg:'亲，评论内容太少了哟'})
        return;
    }
    var sql="INSERT INTO `xz_comment`(`id`, `nid`, `ctine`, `content`, `user_name`, `isdel`) VALUES (null,?,now(),?,?,0)";
    pool.query(sql,[nid,content,username],(err,result)=>{
        if(err) throw err;
        //console.log(result);
        //INSERT ;UPDATE;DELETE
        //执行成功条件，影响行数
        if(result.affectedRows ==1){
            res.send({code:1,msg:"添加成功"});
        }else{
            res.send({code:-1,msg:"添加失败"});
        }
    })
});
module.exports=router;