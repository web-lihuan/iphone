const mysql=require('mysql');
var pool=mysql.createPool({
    host:'127.0.0.1',
    user:"root",  //连接mysql 用户名
    password:"",  //连接mysql密码
    database:"web1806",  //选择操作数据库名称
    port:3306,    //mysql端口 
    connectionLimit:10  //连接池10活动的连接
});
module.exports=pool;