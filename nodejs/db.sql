#db.sql 项目数据库脚本文件
#1:创建库 web1806
#window 不区分大小写，linux区分大小写
#2:进入 web1806
#3:创建用户名 xz_user
#DROP DATABASE IF EXISTS web1806;

SET NAMES UTF8;
CREATE DATABASE web1806 CHARSET=UTF8;
USE web1806;
CREATE TABLE xz_user(
    uid    INT PRIMARY KEY AUTO_INCREMENT,
    uname  VARCHAR(16),
    upwd   VARCHAR(32)
);
INSERT INTO xz_user VALUES(NULL,"huanhuan",md5("1122"));
INSERT INTO xz_user VALUES(NULL,"dongdong",md5("8512"));   
INSERT INTO xz_user VALUES(NULL,"xixi",md5("5205"));   

#功能一：登录（对数据库查询操作）
#SELECT * FROM xz_user WHERE uname="xixi" AND upwd=md5("123");
#建议：
#SELECT count(uid) as c FROM xz_user WHERE uname="xixi" AND upwd=md5("123");

#图片轮播表 xz_imagelist
#分析列 列类型
CREATE TABLE xz_imagelist(
     id       INT PRIMARY KEY AUTO_INCREMENT,
     img_url  VARCHAR(255),
     title    VARCHAR(50),
);
INSERT INTO xz_imagelist VALUES(NULL,"http://127.0.0.1:3000/img/banner1.png","图片1");
INSERT INTO xz_imagelist VALUES(NULL,"http://127.0.0.1:3000/img/banner2.png","图片2");
INSERT INTO xz_imagelist VALUES(NULL,"http://127.0.0.1:3000/img/banner3.png","图片3");
INSERT INTO xz_imagelist VALUES(NULL,"http://127.0.0.1:3000/img/banner4.png","图片4");
#查询图片轮播所有数据
SELECT id,img_url,title FROM xz_imagelist; 

#新闻表 id title content ctime click img_url price
#1货币数据要求不能任何出错，金融行业
#2为了提高数据健壮性[添加冗余列;mid;mtime]
#i1 INT,i2 INT,v1 VARCHAR,v2 VARCHAR
#防止以后系统升级，为以后打算。对系统影响比较小
#muid 修改数据用户编号 mtime修改时间
#         [添加删除历史记录表]
#xz_user(uid,uname,upwd)  xz_h_user(uid,uname,upwd)
#[删除用户] ->INSERT INTO
CREATE TABLE xz_news(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(255),
    content  VARCHAR(2000),
    click    INT,
    img_url  VARCHAR(255),
    price    DECIMAL(10,2),
    ctime    DATETIME
);
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner1.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner2.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner3.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner4.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner1.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner2.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner3.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner4.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner1.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner2.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner3.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner4.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner1.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner2.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner3.png',0,now());
INSERT INTO xz_news VALUES(NULL,'123','123',0,'http://127.0.0.1:3000/img/banner4.png',0,now());

#添加一个新列在原来的表中

#创建评论信息表
#xz_comment id nid ctime content user_name isdel[1:0]
CREATE TABLE xz_comment(
    id  INT PRIMARY KEY AUTO_INCREMENT,
    nid INT,
    ctine DATETIME,
    content VARCHAR(50),
    user_name  VARCHAR(25),
    isdel   INT
);
INSERT INTO xz_comment VALUES(NULL,1,now(),'111','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'551','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'154','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'042','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'356','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'452','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'387','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'954','wh',0);

INSERT INTO xz_comment VALUES(NULL,2,now(),'045','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'987','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'565','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'879','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'894','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'567','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'846','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'455','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'974','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'645','wh',0);

INSERT INTO xz_comment VALUES(NULL,2,now(),'876','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'348','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'670','wh',0);
INSERT INTO xz_comment VALUES(NULL,2,now(),'384','wh',0);
INSERT INTO xz_comment VALUES(NULL,1,now(),'520','wh',0);
/**首页下拉获取*/
CREATE TABLE xz_download(
     id INT PRIMARY KEY AUTO_INCREMENT,
     img_url VARCHAR(255),
     title VARCHAR(255),
     content VARCHAR(2000),
     ctime DATETIME
);
INSERT INTO xz_download VALUES(NULL,"http://127.0.0.1:3000/img/2.jpg","那些故事，就像夏日里一场迅疾的台风。","我的能量很少的，心也小小的，比不上那些像太阳一样光芒万丈的人，顶多是个太阳能热水器。这样的我，只好每天都很努力地吸收着生活中的点滴光芒，一点点攒起来起来，自己不舍得用，也不舍得分一点给别人。只想等天暗透了，再把这份温暖慢慢释放给你一个人。",now()),
(NULL,"http://127.0.0.1:3000/img/3.jpg","童心已逝，童心未泯","如果可以，我希望自己将来的儿女，不必这样“躲藏”，不必通过这样的奔跑，才可以得到被救赎。如果是真正“有家可归”的孩子，谁又愿意永无止尽地奔跑呢？当你不必与这个世界对抗，而是与之坦诚相待。你拥有自己的核心主线，任凭他日东升，他山坍塌，他河起风浪。哪怕这世界岌岌可危、风雨飘摇，你都不必担忧。",now()),
(NULL,"http://127.0.0.1:3000/img/4.jpg","没有一个夏天，会如今夏","高晓松在《奇葩说》的一段发言又火了，谈起什么是好的感情，他说，让彼此都成为更好的自己，两个自由的灵魂相爱，才是最好的爱情。这段话里其实没什么新的知识点，老生常谈而已，既保持自由又能在关系里变得更好，这种爱情当然是最好的，相当于公理，无需证明。",now()),
(NULL,"http://127.0.0.1:3000/img/1.jpg","真正的孤独是生活在一群无法让你做自己的好人中间。","过了某个特定的年纪，生活中便不会再有新人、新动物、新梦想、新面孔以及新事情出现了，因为一切均已发生过，所有人物以前全都露过面……一切都是陈年往事的回声和重复；甚至所有的哀伤，也都是许久以前封存于记忆中的伤心过往的重现。",now()),
(NULL,"http://127.0.0.1:3000/img/2.jpg","那些故事，就像夏日里一场迅疾的台风。","我的能量很少的，心也小小的，比不上那些像太阳一样光芒万丈的人，顶多是个太阳能热水器。这样的我，只好每天都很努力地吸收着生活中的点滴光芒，一点点攒起来起来，自己不舍得用，也不舍得分一点给别人。只想等天暗透了，再把这份温暖慢慢释放给你一个人。",now()),
(NULL,"http://127.0.0.1:3000/img/3.jpg","童心已逝，童心未泯","如果可以，我希望自己将来的儿女，不必这样“躲藏”，不必通过这样的奔跑，才可以得到被救赎。如果是真正“有家可归”的孩子，谁又愿意永无止尽地奔跑呢？当你不必与这个世界对抗，而是与之坦诚相待。你拥有自己的核心主线，任凭他日东升，他山坍塌，他河起风浪。哪怕这世界岌岌可危、风雨飘摇，你都不必担忧。",now()),
(NULL,"http://127.0.0.1:3000/img/4.jpg","没有一个夏天，会如今夏","高晓松在《奇葩说》的一段发言又火了，谈起什么是好的感情，他说，让彼此都成为更好的自己，两个自由的灵魂相爱，才是最好的爱情。这段话里其实没什么新的知识点，老生常谈而已，既保持自由又能在关系里变得更好，这种爱情当然是最好的，相当于公理，无需证明。",now()),
(NULL,"http://127.0.0.1:3000/img/1.jpg","真正的孤独是生活在一群无法让你做自己的好人中间。","过了某个特定的年纪，生活中便不会再有新人、新动物、新梦想、新面孔以及新事情出现了，因为一切均已发生过，所有人物以前全都露过面……一切都是陈年往事的回声和重复；甚至所有的哀伤，也都是许久以前封存于记忆中的伤心过往的重现。",now())
/*goodlist*/
CREATE TABLE xz_goodslist(
     id INT PRIMARY KEY AUTO_INCREMENT,
     img_url VARCHAR(255),
     title VARCHAR(255),
     question VARCHAR(255),
     content VARCHAR(2000),
     ctime DATETIME
);
INSERT INTO xz_goodslist VALUES
(NULL,"http://127.0.0.1:3000/img/1.png","如果让现在的你跟前任说一句话，你最想说什么？","棺材要滑盖的吗？","@魏公子的诗：滚。
@油尖旺纳爱斯：你真好，不过是因为被我喜欢才好，如果我不喜欢你的话，那你也就一般。
@林轻夕舟：无话可讲，没有情绪。
@chiilia：爱情是一场因果报应。
@i铅笔爸爸：我养猫了，希望你可以过得好。
@每天得不到救赎：祝你平平安安吧，幸福的话就不说了。
@喜欢信箱：不算前任，算以前喜欢过的人。想说不要再偷看我微博了，还有你女朋友也在看我微博。何必呢。
@锤锤__ljc：我还是会经常想你。无论爱与不爱，都值得被怀念吧。
@2月22：你还好吗？不管之前你有多令我伤心 我始终都希望你开心呢。
@L-Psychedelic：哟？还没死呢？
@一支甜畅-：希望你最后得到的东西，值得你放弃了我们。
@我的头发开蔷薇：多亏了分开的时候你说我不好，所以我现在才特别好。
@红蕊又满枝：耽误你了，不好意思。
@陈圣利于民：与你保持几百公里的距离才能感觉到安全感。
@bibleery：秋天该很好，你若尚在场。
@柒月一路向北：你说人心怎么说变就变了，15年啊，我们最好的青春年华，所以没办法原谅你了，因为我连自己都恨。
@丢在床角的外套：有空一起出来吃碗瘦肉丸吧，我再随便唱首《月亮之上》助助兴。
@写诗的叶子：你爱上的人，别太像我。
@于是614：你给予的爱和温柔，足够我挥霍一生了。
@Ill_joker：对不起啊，别恨我了。
@脚脚板儿：我真没有用过你的洗衣粉洗我衣服。
@多崎作的弹子球：新婚快乐噢。
@albee呀：恨你新娘子，为何荣幸至此。
@比卢zzz：我现在的宝贝说感谢你眼瞎，才有了现在的我们。
@袁思灵：曾经和你在一起，我以为我是个负担，直到现在有人告诉我，我做得够多了，只是你不懂欣赏而已。行您嘞，抱紧您的新欢吧，我也解脱了。
@66_3：有个恋爱和你没谈够……
@Asprin不是很酷：三只小猫都很想你，但我不想你。
@_希米各_：哦？喔。呵呵。
@Miss吴_很穷：没有原谅，只是算了。
@死鸟不会飞：棺材要滑盖的吗？
@用户Utopia：你快出现吧！！！我还没见过你！！！
@凉茶清欢无别事：三百块钱什么时候还！
@李代盼：谢谢你。
@Joe木木_：不值得我说任何一个字。",now()),
(NULL,"http://127.0.0.1:3000/img/2.png","你和朋友可以好到什么程度？","很默契，她找不到对象，我也找不到。真好！","@尤不苦_：每天都在聊天，换了手机第一个想到要备份的是跟她的聊天记录。
@王东去：高中时候一起吃晚饭，我咬了一块红烧肉，他在我嘴边咬去了一半。差点亲到，然后被全校腐女当作本。
@甦叶：每一次说的“爱你”都是真心的。
@雅姜韩：即便已经很长时间没聊天了，但是双方的距离一点都没有拉远。
@-可乐不是汽水味儿：穿同款也超开心。
@zzxxxdass：她永远只看到我的付出，我也永远只看到她的付出。
@健哥的小甜心Pee：风雨交加的夜晚骑着小黄车给她送药！
@胖河马ai长颈鹿：我在里面做手术，九个小时里她一直陪着我父母在外面等我。
@你看我真好看：她结婚了，房子指纹锁有设有我指纹，我可以直接进去。
@宥宥死了啊：从小就认识，已经当做亲情了。
@一位艺术家丶：好到用她的洗头盆洗脚。
@不在她方_：能一起长胖的都是真爱啊。
@方圆几里没有门：我能原谅她吃香菜，她能容忍我吃葱花。
@Cue_SS：一个拉屎、一个洗澡。
@Sso_Kaa：好到我们绝对不会让彼此孤独挂科。
@cathy_heha：吵架当作没吵过，没有和好的过程。
@科学先生的桃子茶：“即使隔了千山万水，也像一同走过万水千山。”
@Plut0-：我愿意分我最喜欢的食物给她吃。
@蔊菜水水：示范怎么用卫生棉条。
@你讲述的梦境_：被误认为是les， 也被误以为是双胞胎。
@小凤凤同学：互有Touch ID。
@一只酒窝哎：很默契，她找不到对象，我也找不到。真好！
@Lingfir：好到绝交了我天天梦见她。
@TATTOO阿雪：她离开我后，我再也没和任何女生做闺蜜。",now()),
(NULL,"http://127.0.0.1:3000/img/3.png","如何用你的专业来表白？","你的尸体我亲自来解剖？","@Qiiiurr：受益人写你。
@丠廴：呐！多巴胺给你！
@魚淆淺：人为损坏，官方不保，我来保你。 
@大可醒醒：你睡吧，我帮你画图。
@張子高-：如果我是一列和谐号，你就是受电弓。没有你，我将无法前行。 
@帅气人设不能崩：对你的爱没有边际递减效应。
@YingQi的长岛冰茶-：你愿意和我爸妈一样，成为我的第一顺位继承人吗？
@枫叶与七顆星星_：我和你一起做共产主义接班人，实现中华民族伟大复兴中国梦，全面建成社会主义现代化强国，全面建成小康社会。
@栋哥的啦啦啦：新闻是真实的，爱你也是。
@吐神大曹：你要不爱我，我分分钟让你上头条。
@倒喜倒喜：我就问你吃啥？
@因为_梦见你离开：爱上你是最美的不当得利。
@璘生：写出来的故事情节都想与你出演一遍。
@Shu楠啊楠：我不追热点了，只追你。 
@无梦之锦：我想和你拍一个长镜头，时常一辈子，不要蒙太奇。
@小野孟柯：Coffee，tea or me？
@NNiee：你是我的根本大法。
@illusion_正在输入：我把自己的所有权转移给你，你可不可以把你生活的经营权让渡给我。
@因斯坦没有爱：爱上你不是故意，是不可抗力。
@二院的射手儿：我只想让你做我的受众人群。
@诗琪__LQ：给你做婚纱。 
@唐小祥13305735545：我们一起套牢一辈子。
@只只的猫：糟了，是广泛前壁ST段抬高型急性心肌梗死伴左心衰的感觉。
@若非蜉蝣：你的出现调动我身体的所有细胞倾向于非稳态。
@映言_NewWorld：我只做你的需求。
@等着_乔：恭喜您通过了我的面试，请于60秒内带上您的余生前来报到。入职岗位：我的女友（发展方向：女友-子-老伴儿）；合同期限：无固定期限；试用期：无；薪资：我的全部。
@佳腻吕：我已为您办理好入住手续，请您携带好您的爱与希望，欢迎入住我的心房，祝您生活愉快。
@吕一丨一丨一：我有两套房，都给你，左心房，右心房。
@Meam_小明：我们排支双人舞吧。
@3FreeJam：除了你以外我看别的都虚焦。
@不被Justin翻牌不改ID：你就像白颜料一样珍贵。
@8DCD2C：让我们联手，从此告别单身税吧。 
@何秋道长：你的尸体我亲自来解剖？",now()),
(NULL,"http://127.0.0.1:3000/img/4.png","怎么接纳自身的不完美？","常常觉得自己不够好，怎么才能接纳自己的不完美，和有一堆缺点的自己和平相处？","“接纳”这个词，听起来逼格挺高的，显得一个人好像读过很多书一样。比如常见的“接纳你自己”“接纳自己的不完美”“接纳孩子”“接纳真实的他人”“接纳孩子的不完美”，仿佛接纳是治疗某些痛苦的一剂良药。然而很多人的“接纳”，只能像三藏法师念咒一样，不停地重复，企图催眠自己，最后也还是做不到。你有没有想过：人们为什么总说“接纳不完美”，而很少说“接纳完美”呢？因为真的不够好。长得不够高，身材有点胖，智商有点障，性格有点不像样，情商经常不在线，能力经常拖后腿等等。自己很多糟糕的地方都让人觉得痛苦，于是自卑、自暴自弃。为了缓解这种痛苦，我们要学会“自我接纳”。但是越强迫自己，越觉得压抑和痛苦，最后又开始责怪自己接纳不了。所谓的接纳，对很多人来说，只是一种压抑。于是有些人就发展出了：接纳我的不接纳。接纳别人跟自己的不同，是对人的一种基本尊重。但这种尊重，在亲密关系中做起来困难又痛苦：接纳他就是这么不上进？不洗澡？整天玩游戏？接纳他就是懒惰自私没责任心？那我要他干吗？这种“尊重”做起来，太痛苦，需要极大的意志力来说服自己，需要忍了又忍。你甚至会分不清这到底是不是纵容和失望。人们常说接纳后就会平和、喜悦、轻松，在你这里是一点都感觉不到。道理都知道，但就是做不到。因为“接纳”对你来说，可能一直都只是个口号。接纳的反义词，就是改变。不接纳就是排斥，排斥就是想改变。改变自己的意思，就是我不接受现在的自己，我要变得更好。改变别人的意思亦然，我要让别人变得更好。改变本身就是对现实的抗拒。",now()),
(NULL,"http://127.0.0.1:3000/img/1.png","如果让现在的你跟前任说一句话，你最想说什么？","棺材要滑盖的吗？","@魏公子的诗：滚。
@油尖旺纳爱斯：你真好，不过是因为被我喜欢才好，如果我不喜欢你的话，那你也就一般。
@林轻夕舟：无话可讲，没有情绪。
@chiilia：爱情是一场因果报应。
@i铅笔爸爸：我养猫了，希望你可以过得好。
@每天得不到救赎：祝你平平安安吧，幸福的话就不说了。
@喜欢信箱：不算前任，算以前喜欢过的人。想说不要再偷看我微博了，还有你女朋友也在看我微博。何必呢。
@锤锤__ljc：我还是会经常想你。无论爱与不爱，都值得被怀念吧。
@2月22：你还好吗？不管之前你有多令我伤心 我始终都希望你开心呢。
@L-Psychedelic：哟？还没死呢？
@一支甜畅-：希望你最后得到的东西，值得你放弃了我们。
@我的头发开蔷薇：多亏了分开的时候你说我不好，所以我现在才特别好。
@红蕊又满枝：耽误你了，不好意思。
@陈圣利于民：与你保持几百公里的距离才能感觉到安全感。
@bibleery：秋天该很好，你若尚在场。
@柒月一路向北：你说人心怎么说变就变了，15年啊，我们最好的青春年华，所以没办法原谅你了，因为我连自己都恨。
@丢在床角的外套：有空一起出来吃碗瘦肉丸吧，我再随便唱首《月亮之上》助助兴。
@写诗的叶子：你爱上的人，别太像我。
@于是614：你给予的爱和温柔，足够我挥霍一生了。
@Ill_joker：对不起啊，别恨我了。
@脚脚板儿：我真没有用过你的洗衣粉洗我衣服。
@多崎作的弹子球：新婚快乐噢。
@albee呀：恨你新娘子，为何荣幸至此。
@比卢zzz：我现在的宝贝说感谢你眼瞎，才有了现在的我们。
@袁思灵：曾经和你在一起，我以为我是个负担，直到现在有人告诉我，我做得够多了，只是你不懂欣赏而已。行您嘞，抱紧您的新欢吧，我也解脱了。
@66_3：有个恋爱和你没谈够……
@Asprin不是很酷：三只小猫都很想你，但我不想你。
@_希米各_：哦？喔。呵呵。
@Miss吴_很穷：没有原谅，只是算了。
@死鸟不会飞：棺材要滑盖的吗？
@用户Utopia：你快出现吧！！！我还没见过你！！！
@凉茶清欢无别事：三百块钱什么时候还！
@李代盼：谢谢你。
@Joe木木_：不值得我说任何一个字。",now()),
(NULL,"http://127.0.0.1:3000/img/2.png","你和朋友可以好到什么程度？","很默契，她找不到对象，我也找不到。真好！","@尤不苦_：每天都在聊天，换了手机第一个想到要备份的是跟她的聊天记录。
@王东去：高中时候一起吃晚饭，我咬了一块红烧肉，他在我嘴边咬去了一半。差点亲到，然后被全校腐女当作本。
@甦叶：每一次说的“爱你”都是真心的。
@雅姜韩：即便已经很长时间没聊天了，但是双方的距离一点都没有拉远。
@-可乐不是汽水味儿：穿同款也超开心。
@zzxxxdass：她永远只看到我的付出，我也永远只看到她的付出。
@健哥的小甜心Pee：风雨交加的夜晚骑着小黄车给她送药！
@胖河马ai长颈鹿：我在里面做手术，九个小时里她一直陪着我父母在外面等我。
@你看我真好看：她结婚了，房子指纹锁有设有我指纹，我可以直接进去。
@宥宥死了啊：从小就认识，已经当做亲情了。
@一位艺术家丶：好到用她的洗头盆洗脚。
@不在她方_：能一起长胖的都是真爱啊。
@方圆几里没有门：我能原谅她吃香菜，她能容忍我吃葱花。
@Cue_SS：一个拉屎、一个洗澡。
@Sso_Kaa：好到我们绝对不会让彼此孤独挂科。
@cathy_heha：吵架当作没吵过，没有和好的过程。
@科学先生的桃子茶：“即使隔了千山万水，也像一同走过万水千山。”
@Plut0-：我愿意分我最喜欢的食物给她吃。
@蔊菜水水：示范怎么用卫生棉条。
@你讲述的梦境_：被误认为是les， 也被误以为是双胞胎。
@小凤凤同学：互有Touch ID。
@一只酒窝哎：很默契，她找不到对象，我也找不到。真好！
@Lingfir：好到绝交了我天天梦见她。
@TATTOO阿雪：她离开我后，我再也没和任何女生做闺蜜。",now()),
(NULL,"http://127.0.0.1:3000/img/3.png","如何用你的专业来表白？","你的尸体我亲自来解剖？","@Qiiiurr：受益人写你。
@丠廴：呐！多巴胺给你！
@魚淆淺：人为损坏，官方不保，我来保你。 
@大可醒醒：你睡吧，我帮你画图。
@張子高-：如果我是一列和谐号，你就是受电弓。没有你，我将无法前行。 
@帅气人设不能崩：对你的爱没有边际递减效应。
@YingQi的长岛冰茶-：你愿意和我爸妈一样，成为我的第一顺位继承人吗？
@枫叶与七顆星星_：我和你一起做共产主义接班人，实现中华民族伟大复兴中国梦，全面建成社会主义现代化强国，全面建成小康社会。
@栋哥的啦啦啦：新闻是真实的，爱你也是。
@吐神大曹：你要不爱我，我分分钟让你上头条。
@倒喜倒喜：我就问你吃啥？
@因为_梦见你离开：爱上你是最美的不当得利。
@璘生：写出来的故事情节都想与你出演一遍。
@Shu楠啊楠：我不追热点了，只追你。 
@无梦之锦：我想和你拍一个长镜头，时常一辈子，不要蒙太奇。
@小野孟柯：Coffee，tea or me？
@NNiee：你是我的根本大法。
@illusion_正在输入：我把自己的所有权转移给你，你可不可以把你生活的经营权让渡给我。
@因斯坦没有爱：爱上你不是故意，是不可抗力。
@二院的射手儿：我只想让你做我的受众人群。
@诗琪__LQ：给你做婚纱。 
@唐小祥13305735545：我们一起套牢一辈子。
@只只的猫：糟了，是广泛前壁ST段抬高型急性心肌梗死伴左心衰的感觉。
@若非蜉蝣：你的出现调动我身体的所有细胞倾向于非稳态。
@映言_NewWorld：我只做你的需求。
@等着_乔：恭喜您通过了我的面试，请于60秒内带上您的余生前来报到。入职岗位：我的女友（发展方向：女友-子-老伴儿）；合同期限：无固定期限；试用期：无；薪资：我的全部。
@佳腻吕：我已为您办理好入住手续，请您携带好您的爱与希望，欢迎入住我的心房，祝您生活愉快。
@吕一丨一丨一：我有两套房，都给你，左心房，右心房。
@Meam_小明：我们排支双人舞吧。
@3FreeJam：除了你以外我看别的都虚焦。
@不被Justin翻牌不改ID：你就像白颜料一样珍贵。
@8DCD2C：让我们联手，从此告别单身税吧。 
@何秋道长：你的尸体我亲自来解剖？",now()),
(NULL,"http://127.0.0.1:3000/img/4.png","怎么接纳自身的不完美？","常常觉得自己不够好，怎么才能接纳自己的不完美，和有一堆缺点的自己和平相处？","“接纳”这个词，听起来逼格挺高的，显得一个人好像读过很多书一样。比如常见的“接纳你自己”“接纳自己的不完美”“接纳孩子”“接纳真实的他人”“接纳孩子的不完美”，仿佛接纳是治疗某些痛苦的一剂良药。然而很多人的“接纳”，只能像三藏法师念咒一样，不停地重复，企图催眠自己，最后也还是做不到。你有没有想过：人们为什么总说“接纳不完美”，而很少说“接纳完美”呢？因为真的不够好。长得不够高，身材有点胖，智商有点障，性格有点不像样，情商经常不在线，能力经常拖后腿等等。自己很多糟糕的地方都让人觉得痛苦，于是自卑、自暴自弃。为了缓解这种痛苦，我们要学会“自我接纳”。但是越强迫自己，越觉得压抑和痛苦，最后又开始责怪自己接纳不了。所谓的接纳，对很多人来说，只是一种压抑。于是有些人就发展出了：接纳我的不接纳。接纳别人跟自己的不同，是对人的一种基本尊重。但这种尊重，在亲密关系中做起来困难又痛苦：接纳他就是这么不上进？不洗澡？整天玩游戏？接纳他就是懒惰自私没责任心？那我要他干吗？这种“尊重”做起来，太痛苦，需要极大的意志力来说服自己，需要忍了又忍。你甚至会分不清这到底是不是纵容和失望。人们常说接纳后就会平和、喜悦、轻松，在你这里是一点都感觉不到。道理都知道，但就是做不到。因为“接纳”对你来说，可能一直都只是个口号。接纳的反义词，就是改变。不接纳就是排斥，排斥就是想改变。改变自己的意思，就是我不接受现在的自己，我要变得更好。改变别人的意思亦然，我要让别人变得更好。改变本身就是对现实的抗拒。",now());

#视频获取
CREATE TABLE xz_movie(
     id INT PRIMARY KEY AUTO_INCREMENT,
     movie_url VARCHAR(255),
     title VARCHAR(255)
);
INSERT INTO xz_movie VALUES 
(null,"http://127.0.0.1:3000/img/x.mp4","这是一群可爱的愤怒的小鸟的故事"),
(null,"http://127.0.0.1:3000/img/x.mp4","这是一群可爱的愤怒的小鸟的故事"),
(null,"http://127.0.0.1:3000/img/x.mp4","这是一群可爱的愤怒的小鸟的故事"),
(null,"http://127.0.0.1:3000/img/x.mp4","这是一群可爱的愤怒的小鸟的故事")