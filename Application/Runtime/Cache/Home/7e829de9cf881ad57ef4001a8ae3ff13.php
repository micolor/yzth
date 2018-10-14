<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<script type="text/javascript" src="/statics/home/Default/scripts/jquery-1.4.2.min.js"></script>
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
    <img src="/statics/home/Default/images/logo.gif" height="90" alt="上海网聚化工有限公司"/>
    <div id="lang"><a
            href="javascript:if(confirm('只有企业版才有多语言功能，请点击确定访问netgather.com咨询。')){location.href='http://www.netgather.com'}"><img
            src="/statics/home/Default/images/gb.gif" width="16" height="11" alt="English"/>English</a></div>
</div>
<div id="MainMenu" class="ddsmoothmenu">
    <ul>
        <li ><a <?php if((CONTROLLER_NAME) == "Index"): ?>id="menu_selected"<?php endif; ?> href="/" title="公司主页"><span>公司主页<?php echo (CONTROLLER_NAME); ?></span></a></li>
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
    <div id="page_main" class="clearfix">
        <div class="page-right">
            <h3 class="site-title">新闻资讯</h3>
            <div class="site-nav"><span>当前位置 : </span><a href="/">公司主页</a> &gt;&gt; <a href="/news" title="新闻资讯">新闻资讯</a>
            </div>
            <div class="page-news">
                <table border="0" align="center">
                    <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                            <td width="10%" class="time-list"><span><?php echo (date("Y/m/d",$vo["edittime"])); ?></span></td>
                            <td><a target="_blank" href="<?php echo u('/news/detail',array('id'=>$vo['nid']));?>" title="<?php echo ($vo["title"]); ?>"><?php echo (cut_string( $vo["title"],45)); ?></a></td>
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </table>
                <div class="page_list">
                    <?php echo ($page); ?>
                </div>
            </div>
        </div>
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
    <img src="/statics/home/default/images/tel.gif" width="240" height="59" alt="联系我们"/>
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
    <div id="copyright">
    <?php echo ($config["copyright"]); ?><br/>
    <span>地址: </span> <?php echo ($contact["address"]); ?>
</div>
</div>
</body>
</html>