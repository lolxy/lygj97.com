<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
<head>
    <title><?php echo ($term["name"]); ?>_<?php echo ($site_name); ?> </title>
<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
<meta name="description" content="<?php echo ($site_seo_description); ?>">
<?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
<?php $portal_index_lastnews="1,2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<!-- Bootstrap -->
<link href="/public/css/bootstrap.min.css" rel="stylesheet">
<link href="/public/css/base.css" rel="stylesheet">
<link href="/public/css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/public/css/styles.css">
<!--[if lt IE 9]><script src="/public/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="/public/js/html5shiv.min.js"></script>
      <script src="/public/js/respond.min.js"></script>
    <![endif]-->

<!-- Favicons -->
<link rel="apple-touch-icon" href="/public/images/apple-touch-icon.png">
<link rel="icon" href="/public/images/favicon.ico">
	
</head>

<body>
<?php echo hook('body_start');?>
<header>
  <div class="containers ovh">
    <div class="logo fl"> 
    	<a href="<?php echo ($site_host); ?>"> 
        	<img src="<?php echo sp_get_image_url($site_logo,'!thumb400x150');?>" alt="" class="img-responsive"/> 
        </a> 
    </div>
    <div class="ewmbox fl"> 
    	<img src="<?php echo sp_get_image_url($site_erweima,'!thumbnail120x120');?>" alt="" class="img-responsive"/> 
    </div>
    <div class="searchbox fr">
      <div class="topnav hidden-xs"> 
      <a href="javascript:void(0);" onclick="SetHome(this,'http://www.lygj97.com')"><span>设为首页</span></a> 
      <a href="javascript:void(0);" onclick="AddFavorite('龙和古建',location.href)"><span>加入收藏</span></a> 
      <a href="?l=en-us"><span>ENGLISH</span></a> 
      <a href="<?php echo ($gs_email); ?>" class="last" target="_blank"><span>企业邮箱</span></a> 
      </div>
      <div class="clear"></div>
      <div class="search hidden-xs">
        <form method="post" class="form-inline" action="<?php echo U('portal/search/index');?>" target="_blank" autocomplete="off">
          <div class="inputbox">
            <input type="text" class="input-control" name="keyword" placeholder="请输入搜索关键字" value="<?php echo I('get.keyword');?>"/>
          </div>
          <input type="submit" class="btn-search" value="搜索">
        </form>
      </div>
    </div>
  </div>
</header>
<!--导航栏-->
<nav class="navbar hidden-xs">
	<div class="containers">
    	<div class="leftnav fl">
        	<?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <span class='caret'></span></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style=""; $showlevel=2; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
        </div>
        <div class="rightnav fr">
        	<?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <span class='caret'></span></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style=""; $showlevel=2; $dropdown='dropdown'; echo sp_get_menu("2",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
        </div>
        <div class="clear"></div>
    </div>
</nav>

<div class="mune1 dropdown visible-xs">
	<div class="search">
        <form action="" method="post" target="_blank" autocomplete="off">
          <div class="inputbox">
            <input type="text" class="input-control" name="keyword"/>
          </div>
          <input type="submit" class="btn-search" value="搜索">
        </form>
    </div>
    <button class="" data-toggle="dropdown">
        <h1>菜单</h1>
        <span class="glyphicon glyphicon-align-justify"></span>
    </button>
    <button class="togglelan" data-toggle="dropdown" data-target=".dropdown-lang">
    <span class="glyphicon glyphicon-globe"></span>
    </button>
    <?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <span class='caret'></span></a>"; $ul_class="" ; $li_class="mune_dt" ; $style="dropdown-menu"; $showlevel=1; $dropdown='dropdown'; echo sp_get_menu("3",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
    <ul class="dropdown-lang">
    	<li><a href="?l=zh-cn">中文版</a></li>
    	<li><a href="?l=en-us">English</a></li>
    </ul>
</div>
<!-- 时间轴css样式 -->
<link href="/public/css/history.css" rel="stylesheet" />
<?php $slides=sp_getslide("process_ads"); ?>
<div class="bj_con">
    <div class="content">
        <!---- 动态资讯 ---->
        <div class="about">
            <?php if(!empty($slides)): ?><div class="about_img">
                <div class="img_nr">
                  <div class="img_nr_bor">
                    <div class="img_nr_bor1"> 
                    <?php if(is_array($slides)): foreach($slides as $key=>$vo): ?><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt=""><?php endforeach; endif; ?>
                    </div>
                  </div>
                </div>
                <div class="img_bj"> <b class="b_01"></b> <b class="b_02"></b> <b class="b_03"></b> <b class="b_04"></b> </div>
              </div><?php endif; ?>
            <div class="about_top">
                <img src="/public/picture/into10.png">
                <h1><?php echo ($term["name"]); ?></h1>
                <?php $breadcrumb=sp_get_breadcrumb($term['term_id']); ?> 
                <p class="visible-md visible-lg">
                <a href="<?php echo leuu('portal/page/index',array('id'=>3));?>">关于我们</a>
                <?php if(is_array($breadcrumb)): foreach($breadcrumb as $key=>$vo): ?><a href="<?php echo leuu('portal/list/index',array('id'=>$vo['term_id']));?>">> <?php echo ($vo["name"]); ?></a><?php endforeach; endif; ?>
                <span>> <?php echo ($term["name"]); ?></span>
                </p>
            </div>
            <div class="about_mune">
               <ul>
                  <li><a href="<?php echo leuu('portal/page/index',array('id'=>1));?>">企业文化</a></li>
                  <li><a href="<?php echo leuu('portal/page/index',array('id'=>7));?>">荣誉资质</a></li>
                  <li><a href="<?php echo leuu('portal/page/index',array('id'=>2));?>">组织机构</a></li>
                  <li class="bj">企业历程</li>
                  <li><a href="<?php echo leuu('portal/page/index',array('id'=>3));?>">公司简介</a></li>
                </ul>
            </div>

            <!-- 时间轴代码 开始 -->
            <div class="head-warp">
                <div class="head">
                    <div class="nav-box">
                        <ul>
                            <li class="cur" style="text-align:center;">&nbsp;</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main">
                <div class="history">
                	<?php $time = date('Y'); ?>
                    <?php $__FOR_START_1734261309__=$time;$__FOR_END_1734261309__=1996;for($i=$__FOR_START_1734261309__;$i > $__FOR_END_1734261309__;$i+=-1){ $j=$i+1; $where['post_date'] = array(array('elt',$j.'-01-01 00:00:00'),array('gt',$i.'-01-01 00:00:00'),'and'); $list = sp_sql_posts("cid:3;field:smeta,post_title,post_content,post_date;order:post_date DESC;",$where); ?>
                    <?php if(!empty($list)): ?><div class="history-date">
                        <ul>
                            <h2 class="first">
                                <a href="#nogo"><?php echo ($i); ?>年</a>
                                <b id="circle"></b>
                            </h2>
                             <?php if(is_array($list)): foreach($list as $key=>$vo): ?><li class="green">
                                <div class="point"><b></b></div>
                                <h3><?php echo date('m.d',strtotime($vo['post_date']));?><span><?php echo ($i); ?></span></h3>
                                <dl>
                                    <dt>
                                    <div class="qylc_news">
                                    	<?php $smeta=json_decode($vo['smeta'],true); ?>
                                    	<?php if(!empty($smeta['thumb'])): ?><div class="qylc_left view">
                                                <a target="_blank" href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>">
                                                    <img src="<?php echo sp_get_image_url($smeta['thumb'],'!thumb168x120');?>"/>
                                                </a>
                                            </div><?php endif; ?>
                                        <div class="qylc_right">
                                            <a target="_blank" href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>"><?php echo ($vo["post_title"]); ?></a>
                                            <p><?php echo ($vo["post_content"]); ?></p>
                                        </div>
                                    </div>
                                    </dt>
                                </dl>
                            </li><?php endforeach; endif; ?>     
                         </ul>
                    </div><?php endif; } ?>               
                </div>
            </div>

        </div>
    </div>
</div>
<!---- 尾部 ---->

<?php echo hook('footer');?>
<footer>
	<div class="containers ovh">
    	<div class="pbox">
        <div class="ulbox">
        <?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="footnav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("4",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
        </div>
        <p>
        	<?php echo ($site_copyright); ?>
        </p>
        <p>
        	地址：<?php echo ($address); ?>　邮编：<?php echo ($postcd); ?>  电话：<?php echo ($tell); ?>  传真：<?php echo ($fax); ?>
        </p>
        <p>
        	<?php echo ($site_icp); ?> <a href="<?php echo ($site_host); ?>admin" target="_blank" class="last">[管理中心]</a>
        </p>
        </div>
        <div class="wxbox">
        	<span>微信公众号</span>
            <span class="img">
            	<img src="<?php echo sp_get_image_url($site_erweima,'!thumbnail120x120');?>" alt="" class="img-responsive"/>
            </span>
        </div>
    </div>
</footer>
<!--//导航栏-->
<?php echo ($site_tongji); ?>

<script src="/public/js/jquery.min.js"></script> 
<script src="/public/js/bootstrap.min.js"></script> 

<script  type="text/javascript">
//设为首页
function SetHome(obj,url){
    try{
        obj.style.behavior='url(#default#homepage)';
        obj.setHomePage(url);
    }catch(e){
        if(window.netscape){
            try{
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }catch(e){
                alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
            }
        }else{
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
        }
    }
}
//收藏本站
function AddFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//保存到桌面
function toDesktop(sUrl,sName){
try {
    var WshShell = new ActiveXObject("WScript.Shell");
    var oUrlLink = WshShell.CreateShortcut(WshShell.SpecialFolders("Desktop")+ "\\" + sName + ".url");
    oUrlLink.TargetPath = sUrl;
    oUrlLink.Save();
    }  
catch(e)  {  
          alert("当前IE安全级别不允许操作！");  
}
}    
</script>
<script src="/public/js/main.js"></script>
<script type="text/javascript">
    $(function () {
        $(".haha").on('click',function () {
            alert(0);
            //window.location.href = $(this).attr("data-url");
            Window.open($(this).attr("data-url"));
        });
    });
</script>
<?php echo hook('footer_end');?>
</body>
</html>