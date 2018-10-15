<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php if($webconfig['title']): echo ($webconfig['title']); else: ?>扬州盛祥蝶形弹簧有限公司<?php endif; ?></title>
<meta name="robots" content="all" />
<meta name="keywords" content="<?php if($webconfig['keywords']): echo ($webconfig['keywords']); else: ?>扬州盛祥蝶形弹簧有限公司<?php endif; ?>"/>
<meta name="description" content="<?php if($webconfig['ndesc']): echo ($webconfig['ndesc']); else: ?>扬州盛祥蝶形弹簧有限公司<?php endif; ?>"/>
<meta name="Identifier-URL" content="http://www.yzsxth.com" />
<link rel="Shortcut Icon" href="/statics/home/Default/images/favicon.ico" type="image/x-icon" />
<link rel="Bookmark" href="/statics/home/Default/images/favicon.ico" type="image/x-icon" />
<link href="/statics/home/Default/css/reset.css" rel="stylesheet" type="text/css" />
<link href="/statics/home/Default/css/webmain.css" rel="stylesheet" type="text/css" />
<link href="/statics/home/Default/css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="/statics/home/Default/kf/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/statics/home/Default/kf/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/statics/home/Default/scripts/jquery.KinSlideshow-1.2.1.js"></script>
<script type="text/javascript" src="/statics/home/Default/scripts/webtry_roll.js"></script>
<script type="text/javascript" src="/statics/home/Default/scripts/ddsmoothmenu.js"></script>
<script type="text/javascript">
    ddsmoothmenu.init({
        mainmenuid: "MainMenu", //menu DIV id
        orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
        classname: 'ddsmoothmenu', //class added to menu's outer DIV
        //customtheme: ["#1c5a80", "#18374a"],
        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })
</script>
</head>
<body>
<div id="wrapper">
    <div class="top">
    <a href="/">
        <img src="/statics/home/Default/images/logo.png" style="height: 80px; margin-left: 2%; padding-top: 8px;" alt="<?php echo ($config["sitename"]); ?>"/>
    </a>
    <div id="lang" style="padding-top: 20px;">
        <p style="padding-left: 34px; font-size: 12px; color: #666666;letter-spacing: 4px;">全国销售热线电话</p>
        <a href="javascript:void(0)"  style="font-size: 14px; color:#dd2201; font-weight:600
        ; letter-spacing: 1px;">
            <img src="/statics/home/Default/images/phone.png"  style="width: 25px; margin-top: -21px; padding-right: 5px;" alt="服务热线"/><?php echo ($contact["phone"]); ?></a></div>
</div>
<div id="MainMenu" class="ddsmoothmenu">
    <ul>
        <li ><a <?php if((CONTROLLER_NAME) == "Index"): ?>id="menu_selected"<?php endif; ?> href="/" title="公司主页"><span>公司主页</span></a></li>
        <li><a <?php if((CONTROLLER_NAME) == "Abouts"): ?>id="menu_selected"<?php endif; ?> href="/abouts" title="公司简介"><span>公司简介</span></a></li>
        <li><a <?php if((CONTROLLER_NAME) == "Products"): ?>id="menu_selected"<?php endif; ?> href="/products" title="产品展示"><span>产品展示</span></a>
            <ul class="menulevel">
                <?php if(is_array($productcat)): $i = 0; $__LIST__ = $productcat;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo u('/products/index',array('cid'=>$vo['cate_id']));?>" title="<?php echo ($vo["cate_name"]); ?>"><?php echo ($vo["cate_name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </li>
        <li><a <?php if((CONTROLLER_NAME) == "Jscs"): ?>id="menu_selected"<?php endif; ?> href="/jscs" title="技术参数"><span>技术参数</span></a></li>
        <li><a <?php if((CONTROLLER_NAME) == "Scsb"): ?>id="menu_selected"<?php endif; ?> href="/scsb" title="生产设备"><span>生产设备</span></a></li>
        <li><a <?php if((CONTROLLER_NAME) == "Xswl"): ?>id="menu_selected"<?php endif; ?> href="/xswl" title="销售网络"><span>销售网络</span></a></li>
        <li><a <?php if((CONTROLLER_NAME) == "News"): ?>id="menu_selected"<?php endif; ?> href="/news" title="新闻资讯"><span>新闻资讯</span></a></li>
        <li><a <?php if((CONTROLLER_NAME) == "Message"): ?>id="menu_selected"<?php endif; ?> href="/message" title="客户留言"><span>客户留言</span></a></li>
    </ul>
</div>
<script type="text/javascript">
    $(function () {
        $("#banner").KinSlideshow({
            moveStyle: "right",
            titleBar: {titleBar_height: 32, titleBar_bgColor: "#000", titleBar_alpha: 0.7},
            titleFont: {TitleFont_size: 12, TitleFont_color: "#FFFFFF", TitleFont_weight: "normal"},
            btn: {
                btn_bgColor: "#2d2d2d",
                btn_bgHoverColor: "#1072aa",
                btn_fontColor: "#FFF",
                btn_fontHoverColor: "#FFF",
                btn_borderColor: "#4a4a4a",
                btn_borderHoverColor: "#1188c0",
                btn_borderWidth: 1
            }
        });
    })
</script>
<div id="banner">
    <?php if(is_array($banner)): $i = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a target="_blank" href="<?php echo ($vo["ad_link"]); ?>"><img src="<?php echo ($vo["ad_file"]); ?>" alt="<?php echo ($vo["ad_desc"]); ?>" width="950"
                         height="200"/></a><?php endforeach; endif; else: echo "" ;endif; ?>

</div>
    <div id="index_main" class="clearfix">
        <div class="index-left">
            <div class="index-newproducts">
                <h2><span>暂无信息</span><a href="products.html"><img src="/statics/home/Default/images/more.gif" width="32" height="5" alt="产品展示" /></a></h2>
                <div class="productsroll">
                    <div id="LeftArr1"></div>
                    <div id="RightArr1"></div>
                    <ul id="ScrollBox" class="clearfix">
                        <?php if(is_array($tj)): $i = 0; $__LIST__ = $tj;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo u('/products/detail',array('id'=>$vo['nid']));?>" title="<?php echo ($vo["title"]); ?>"><img src="<?php echo ($vo["thumb"]); ?>" alt="<?php echo ($vo["title"]); ?>" width="140" height="100" /><span><?php echo (cut_string($vo["title"],10)); ?></span></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                    <script language="javascript" type="text/javascript">
                        <!--//--><![CDATA[//><!--
                        var scrollPic_01 = new ScrollPic();
                        scrollPic_01.scrollContId   = "ScrollBox"; //内容容器ID
                        scrollPic_01.arrLeftId      = "LeftArr1";//左箭头ID
                        scrollPic_01.arrRightId     = "RightArr1"; //右箭头ID
                        scrollPic_01.frameWidth     = 648;//显示框宽度
                        scrollPic_01.pageWidth      = 162; //翻页宽度
                        scrollPic_01.speed          = 10; //移动速度(单位毫秒，越小越快)
                        scrollPic_01.space          = 5; //每次移动像素(单位px，越大越快)
                        scrollPic_01.autoPlay       = true; //自动播放
                        scrollPic_01.autoPlayTime   = 3; //自动播放间隔时间(秒)
                        scrollPic_01.initialize(); //初始化
                        //--><!]]>
                    </script>
                </div>
            </div>
            <div class="index-news">
                <h2><span>新闻资讯</span><a href="/news"><img src="/statics/home/Default/images/more.gif" width="32" height="5" alt="新闻资讯"/></a></h2>
                <ul>
                    <li class="clearfix">
                        <a target="_blank" href="<?php echo u('/news/detail',array('id'=>$vo['nid']));?>" title="<?php echo ($news['0']['title']); ?>">
                        <img src="<?php echo ($news['0']["thumb"]); ?>" alt="<?php echo ($news['0']['title']); ?>" width="110" height="80"/>
                        </a>
                        <h3><a target="_blank" href="<?php echo u('/news/detail',array('id'=>$vo['nid']));?>" title="<?php echo ($news['0']['title']); ?>"><?php echo ($news['0']['title']); ?></a></h3>
                        <p><?php echo (cut_string( $news['0']['ndesc'],50)); ?><a target="_blank" href="<?php echo u('/news/detail',array('id'=>$vo['nid']));?>" title="<?php echo ($news['0']['title']); ?>">[详细]</a>
                    </p></li>
                    <?php if(is_array($news)): $i = 0; $__LIST__ = array_slice($news,1,5,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo u('/news/detail',array('id'=>$vo['nid']));?>" title="<?php echo ($vo["title"]); ?>"><span><?php echo (date("Y/m/d",$vo["edittime"])); ?></span>-　<?php echo (cut_string( $vo["title"],20)); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="index-about">
                <h2><span>关于我们</span><a href="<?php echo u('/abouts');?>"><img src="/statics/home/Default/images/more.gif" width="32" height="5" alt="关于我们" /></a></h2>
                <p><img src="<?php echo ($abouts["thumb"]); ?>" alt="关于我们" width="145" height="181" /><a href="<?php echo u('/abouts');?>" title="关于我们"><?php echo (cut_string( $abouts["title"],210)); ?></a></p>
            </div>
            <div class="index-products">
                <h2><span>产品展示</span><a href="/products"><img src="/statics/home/Default/images/more.gif" width="32" height="5" alt="产品展示"/></a></h2>
                <ul class="clearfix">
                    <?php if(is_array($products)): $i = 0; $__LIST__ = $products;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo u('/products/detail',array('id'=>$vo['nid']));?>" title="<?php echo ($vo["title"]); ?>"><img src="<?php echo ($vo["thumb"]); ?>" alt="<?php echo ($vo["title"]); ?>" width="154" height="110"/><span><?php echo (cut_string( $vo["title"],10)); ?></span></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
        <div class="index-right">
            <div class="page-left">
    <div class="left-products">
        <h2><span>产品展示</span></h2>
        <div id="LeftMenu" class="ddsmoothmenu-v">
            <ul>
                <?php if(is_array($productcat)): $i = 0; $__LIST__ = $productcat;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a <?php if($vo['cate_id'] == $_GET['cid']): ?>id="menu_selected"<?php endif; ?>href="<?php echo u('/products/index',array('cid'=>$vo['cate_id']));?>" title="<?php echo ($vo["cate_name"]); ?>"><span><?php echo ($vo["cate_name"]); ?></span></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
        <script type="text/javascript">
            ddsmoothmenu.init({
                mainmenuid: "LeftMenu", //Menu DIV id
                orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
                //customtheme: ["#804000", "#482400"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })
        </script>
    </div>
    <div class="left-search">
        <h2><span>站内搜索</span></h2>
        <form action="<?php echo u('/products');?>" method="get" id="sitesearch" name="sitesearch">
            <p>
                <select id="searchid">
                    <option value="1" selected="selected">产品展示</option>
                    <option value="2">新闻资讯</option>
                </select>
            </p>
            <p>
                <input name="keyword" type="text" id="searchtext"/>
            </p>
            <p>
                <input type="submit" id="searchbutton" value=""/>
            </p>
        </form>
    </div>
    <div class="left-contact">
        <h2><span>联系我们</span></h2>
        <p>
            <?php if($contact['address']): ?><span>地址: </span><?php echo ($contact["address"]); ?><br/><?php endif; ?>
            <?php if($contact['address']): ?><span>邮编: </span><?php echo ($contact["email"]); ?><br/><?php endif; ?>
            <?php if($contact['linkman']): ?><span>联系人: </span><?php echo ($contact["linkman"]); ?><br/><?php endif; ?>
            <?php if($contact['mobile']): ?><span>手机: </span><?php echo ($contact["mobile"]); ?><br/><?php endif; ?>
            <?php if($contact['phone']): ?><span>电话: </span><?php echo ($contact["phone"]); ?><br/><?php endif; ?>
            <?php if($contact['fax']): ?><span>传真: </span><?php echo ($contact["fax"]); ?><br/><?php endif; ?>
            <?php if($contact['email']): ?><span>邮箱: </span><?php echo ($contact["email"]); ?><br/><?php endif; ?>
            <?php if($contact['tbshop']): ?><span>淘宝店铺: </span><?php echo ($contact["tbshop"]); endif; ?>
            </p>
    </div>
    <div class="kf">
    <div class="kf-phone"><?php echo ($contact['phone']); ?></div>
    <img src="/statics/home/Default/images/tel.gif" width="240" height="59" alt="联系我们"/>
    </div>
</div>
<script>
    $(function () {
        $("#searchid").change(function () {
            if($(this).val() == '2'){
                $("#sitesearch").attr('action','/news');
            }else{
                $("#sitesearch").attr('action','/products')
            }
        })
    })
</script>
        </div>
    </div>
    <div id="copyright">
    <?php echo ($config["copyright"]); ?><br/>
    <span>地址: </span> <?php echo ($contact["address"]); ?>
</div>
<div class="suspension">
    <div class="suspension-box">
        <a href="#" class="a a-service "><i class="i"></i></a>
        <a href="javascript:;" class="a a-service-phone "><i class="i"></i></a>
        <a href="javascript:;" class="a a-top"><i class="i"></i></a>
        <div class="d d-service">
            <i class="arrow"></i>
            <div class="inner-box">
                <div class="d-service-item clearfix">
                    <a href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo ($contact["qq"]); ?>&site=qq&menu=yes" class="clearfix"><span class="circle"><i class="i-qq"></i></span><h3>咨询在线客服</h3></a>
                </div>
            </div>
        </div>
        <div class="d d-service-phone">
            <i class="arrow"></i>
            <div class="inner-box">
                <div class="d-service-item clearfix">
                    <span class="circle"><i class="i-tel"></i></span>
                    <div class="text">
                        <p>服务热线</p>
                        <p class="red number"><?php echo ($contact["phone"]); ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        /* ----- 侧边悬浮 ---- */
        $(document).on("mouseenter", ".suspension .a", function(){
            var _this = $(this);
            var s = $(".suspension");
            var isService = _this.hasClass("a-service");
            var isServicePhone = _this.hasClass("a-service-phone");
            var isQrcode = _this.hasClass("a-qrcode");
            if(isService){ s.find(".d-service").show().siblings(".d").hide();}
            if(isServicePhone){ s.find(".d-service-phone").show().siblings(".d").hide();}
            if(isQrcode){ s.find(".d-qrcode").show().siblings(".d").hide();}
        });
        $(document).on("mouseleave", ".suspension, .suspension .a-top", function(){
            $(".suspension").find(".d").hide();
        });
        $(document).on("mouseenter", ".suspension .a-top", function(){
            $(".suspension").find(".d").hide();
        });
        $(document).on("click", ".suspension .a-top", function(){
            $("html,body").animate({scrollTop: 0});
        });
        $(window).scroll(function(){
            var st = $(document).scrollTop();
            var $top = $(".suspension .a-top");
            if(st > 100){
                $top.css({display: 'block'});
            }else{
                if ($top.is(":visible")) {
                    $top.hide();
                }
            }
        });

    });
</script>
</div>
</body>
</html>