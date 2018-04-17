<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
<title><?php echo ($site_seo_title); ?>_<?php echo ($site_name); ?></title>
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
<!--轮播图-->
<?php $home_slides=sp_getslide("slider"); $home_slides=empty($home_slides)?$default_home_slides:$home_slides; ?>
<div id="slideBox" class="slideBox">
    <div class="hd">
        <ul>
        <?php if(is_array($home_slides)): foreach($home_slides as $key=>$vo): ?><li><?php echo ($key); ?></li><?php endforeach; endif; ?>
        </ul>
    </div>
    <div class="bd">
        <ul>
            <?php if(is_array($home_slides)): foreach($home_slides as $key=>$vo): ?><li><a href="<?php echo ($vo["slide_url"]); ?>" target="_blank"><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt="" class="img-responsive"></a></li><?php endforeach; endif; ?>
        </ul>
    </div>

    <!-- 下面是前/后按钮代码，如果不需要删除即可 -->
    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>
</div>
<!--//轮播图-->
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

<div class="containers mt45">
	<div class="rows">
        <div class="leftbox">
            <div class="jianjiebox">
            	<h2>公司简介</h2>
                <p>
                	<?php $page=sp_sql_page(3); ?>
                    <?php echo (msubstr(strip_tags($page['post_content']),0,200,'utf-8',false)); ?><a href="<?php echo leuu('page/index',array('id'=>$page[id]));?>" target="_blank">... [详细]</a>
                </p>
            </div>
        </div>
        <div class="rightbox">
        	<div class="box">
            	<?php $qydt=sp_sql_posts("cid:6;field:post_title,post_excerpt,object_id,smeta,term_id;order:istop desc,listorder asc,recommended desc,post_modified desc,post_date desc;limit:6;"); ?>
            	<h2 class="htit hsmall">
                	企业动态<a href="<?php echo leuu('list/index',array('id'=>6));?>" target="_blank" class="more">MORE</a>
                </h2>
                <ul class="list">
                	<?php if(is_array($qydt)): foreach($qydt as $k=>$vos): ?><li>
                    	<a href="<?php echo leuu('article/index',array('id'=>$vos['object_id'],'cid'=>$vos['term_id']));?>" target="_blank"><?php echo ($vos["post_title"]); ?></a>
                    </li><?php endforeach; endif; ?>
                </ul>
            </div>
        </div>
    </div>
    <div class="rows">
    	<div class="leftbox">
            <div class="leftsubbox">
            	<div class="box">
                <?php $hyzx=sp_sql_posts("cid:7;field:post_title,post_date,post_excerpt,object_id,smeta,term_id;order:istop desc,recommended desc,post_modified desc,post_date desc;limit:6;"); ?>
                    <h2 class="htit">
                        行业资讯<a href="<?php echo leuu('list/index',array('id'=>7));?>" target="_blank" class="more">MORE</a>
                    </h2>
                    <ul class="lists">
                    	<?php if(is_array($hyzx)): foreach($hyzx as $k=>$vo): ?><li>
                            <a href="<?php echo leuu('article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                                <span class="title"><?php echo ($vo["post_title"]); ?></span>
                                <span class="time"><?php echo date('Y-m-d',strtotime($vo['post_date']));?></span>
                             </a>
                        </li><?php endforeach; endif; ?>
                    </ul>
            	</div>
            </div>
            <div class="leftsubbox">
            	<div class="box">
                    <?php $ids=8; $cterms=sp_get_child_terms($ids); $termids=null; foreach($cterms as $cvo){ $ctermid = sp_get_child_terms($cvo['term_id']); $termids[]=$cvo['term_id']; foreach($ctermid as $cvos){ $termids[]=$cvos['term_id']; } } $termsid = empty($termids)?$ids:$ids.','.implode(',',$termids); $yzgy=sp_sql_posts("cid:$termsid;field:post_title,post_date,post_excerpt,object_id,smeta,term_id;order:istop desc,recommended desc,post_modified desc,post_date desc;limit:3;"); ?>
                    <h2 class="htit">
                        营造工艺<a href="<?php echo leuu('list/index',array('id'=>8));?>" target="_blank" class="more">MORE</a>
                    </h2>
                    <ul class="lists list2">
                        <?php if(is_array($yzgy)): foreach($yzgy as $k=>$vo): $smeta=json_decode($vo['smeta'],true); ?>
                        <?php
 if($k==0){ ?>
                        <li class="mainlist">
                            <a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                                <span class="pic">
                                    <?php if(!empty($smeta['thumb'])): ?><img src="<?php echo sp_get_image_url($smeta['thumb'],'!thumb200x200');?>" alt="" class="img-responsive"/>
                                    <?php else: ?>
                                    	<img src="/public/images/noimg.png" alt="" class="img-responsive"/><?php endif; ?>
                                </span>
                                <span class="text"><?php echo (mb_substr($vo["post_excerpt"],0,84,'utf-8')); ?>...</span>
                             </a>
                        </li>
                        <?php
 }else{ ?>
                        <li>
                            <a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                                <span class="title"><?php echo ($vo["post_title"]); ?></span>
                                <span class="time"><?php echo date('Y-m-d',strtotime($vo['post_date']));?></span>
                             </a>
                        </li>
                        <?php
 } endforeach; endif; ?>
                    </ul>
            	</div>
            </div>
        </div>
        <div class="rightbox">
        	<div class="slideTxtBox gongchengphoto">
                <div class="hd">
                <!--推荐前5个-->
                    <ul><li class="on">工程影集</li><li>在线视频</li></ul>
                </div>
                <div class="bd">
                    <div>
                    	<?php $map['recommended'] = 1; $cid=14; $tag="field:post_title,post_date,post_excerpt,object_id,smeta,term_id;order:listorder desc,post_modified desc;limit:5"; $mlist=sp_sql_posts_bycatid($cid,$tag,$map); ?>
                        <div id="displayBox" class="displayBox">
                            <div class="bd">
                                <ul>
                                    <?php if(is_array($mlist)): foreach($mlist as $k=>$vo): $smeta=json_decode($vo['smeta'],true); ?>
                                        <?php if(!empty($smeta['thumb'])): ?><li><a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank"><img src="<?php echo sp_get_image_url($smeta['thumb'],'!thumb278x205');?>" alt="" class="img-responsive"/></a></li><?php endif; endforeach; endif; ?>
                                </ul>
                            </div>
						</div>
			
                    </div>
                    <div style="display: none;">
						<embed src="https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=u0389xgwm6r&auto=0" allowFullScreen="true" quality="high" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" class="embedstyle"></embed>
                        <!--<video src="http://player.youku.com/player.php/sid/XMjUyMDEwMDYyMA==/v.swf" controls="controls" class="embedstyle">
                        	your browser does not support the video tag
                        </video>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="rows">
    	<div class="slideTxtBox gongchengtabs">
            <div class="hd">
                <ul><li class="on">国外工程</li><li>国内工程</li><li>在施工程</li></ul>
            </div>
            <!--按更新时间排序-->
<?php $gwgc=sp_sql_posts("cid:16;field:post_title,post_date,post_excerpt,object_id,smeta,term_id;order:post_modified desc,post_date desc;limit:15;"); $gngc=sp_sql_posts("cid:15;field:post_title,post_date,post_excerpt,object_id,smeta,term_id;order:post_modified desc,post_date desc;limit:15;"); $zsgc=sp_sql_posts("cid:17;field:post_title,post_date,post_excerpt,object_id,smeta,term_id;order:post_modified desc,post_date desc;limit:15;"); ?>
            <div class="bd">
                <div class="ovh">
                    <div class="imgbox">
                    	<?php if(is_array($gwgc)): foreach($gwgc as $k=>$vo): if($k==0): ?><a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                            <?php $smeta=json_decode($vo['smeta'],true); ?>
                            <?php if(!empty($smeta['thumb'])): ?><img src="<?php echo sp_get_image_url($smeta['thumb'],'!thumb370x247');?>" alt="" class="img-responsive"/>
                            <?php else: ?>
                                <img src="/public/images/noimg.png" alt="" class="img-responsive"/><?php endif; ?>
                        </a><?php endif; endforeach; endif; ?>
                    </div>
                    <div class="tablist">
                    	<div class="listbox">
                            <?php if(is_array($gwgc)): foreach($gwgc as $k=>$vo): $k=$k+1; if($k==1 || $k%8==0){ ?>
                            <ul class="list">
                               <?php
 } ?> 
                                    <li>
                                        <a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank"><?php echo ($vo["post_title"]); ?></a>
                                    </li>
                                
                            <?php
 if($k>0 && $k%7==0){ ?>
                            </ul>
                               <?php
 } endforeach; endif; ?>
                        </div>
                        <div class="morebox">
                        	<a href="<?php echo leuu('list/index',array('id'=>15));?>" target="_blank" class="more">MORE</a>
                        </div>
                    </div>
                </div>
                <div style="display: none;" class="ovh">
                    <div class="imgbox">
                    	<?php if(is_array($gngc)): foreach($gngc as $k=>$vo): if($k==0): ?><a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                            <?php $smeta=json_decode($vo['smeta'],true); ?>
                            <?php if(!empty($smeta['thumb'])): ?><img src="<?php echo sp_get_image_url($smeta['thumb'],'!thumb370x247');?>" alt="" class="img-responsive"/>
                            <?php else: ?>
                                <img src="/public/images/noimg.png" alt="" class="img-responsive"/><?php endif; ?>
                        </a><?php endif; endforeach; endif; ?>
                    </div>
                    <div class="tablist">
                    	<div class="listbox">
                            <?php if(is_array($gngc)): foreach($gngc as $k=>$vo): $k=$k+1; if($k==1 || $k%8==0){ ?>
                            <ul class="list">
                               <?php
 } ?> 
                                    <li>
                                        <a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank"><?php echo ($vo["post_title"]); ?></a>
                                    </li>
                                
                            <?php
 if($k>0 && $k%7==0){ ?>
                            </ul>
                               <?php
 } endforeach; endif; ?>
                        </div>
                        <div class="morebox">
                        	<a href="<?php echo leuu('list/index',array('id'=>16));?>" target="_blank" class="more">MORE</a>
                        </div>
                    </div>
                </div>
                <div style="display: none;" class="ovh">
                    <div class="imgbox">
                    	<?php if(is_array($zsgc)): foreach($zsgc as $k=>$vo): if($k==0): ?><a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                            <?php $smeta=json_decode($vo['smeta'],true); ?>
                            <?php if(!empty($smeta['thumb'])): ?><img src="<?php echo sp_get_image_url($smeta['thumb'],'!thumb370x247');?>" alt="" class="img-responsive"/>
                            <?php else: ?>
                                <img src="/public/images/noimg.png" alt="" class="img-responsive"/><?php endif; ?>
                        </a><?php endif; endforeach; endif; ?>
                    </div>
                    <div class="tablist">
                    	<div class="listbox">
                            <?php if(is_array($zsgc)): foreach($zsgc as $k=>$vo): $k=$k+1; if($k==1 || $k%8==0){ ?>
                            <ul class="list">
                               <?php
 } ?> 
                                    <li>
                                        <a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank"><?php echo ($vo["post_title"]); ?></a>
                                    </li>
                                
                            <?php
 if($k>0 && $k%7==0){ ?>
                            </ul>
                               <?php
 } endforeach; endif; ?>
                        </div>
                        <div class="morebox">
                        	<a href="<?php echo leuu('list/index',array('id'=>17));?>" target="_blank" class="more">MORE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--推荐或置顶-->
    <div class="rows">
    	<div class="slidescroll">
        	<h2><img src="/public/images/gczs.png" alt="工程展示"" class="img-responsive"/></h2>
            <div class="picScroll-left">
                <div class="hd">
                    <a class="next"></a>
                    <a class="prev"></a>
                </div>
                <div class="bd">
                    <ul>
                        <?php $where['recommended|istop'] = 1; $cid=14; $tag="field:post_title,post_date,post_excerpt,object_id,smeta,term_id;order:listorder desc,post_date desc;limit:20"; $gczslist=sp_sql_posts_bycatid($cid,$tag,$where); ?>
                        <?php if(is_array($gczslist)): foreach($gczslist as $k=>$vo): $smeta=json_decode($vo['smeta'],true); ?>
                        <?php if(!empty($smeta['thumb'])): ?><li>
                            <a href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                            <div class="pic">
                                <img src="<?php echo sp_get_image_url($smeta['thumb'],'!thumb200x200');?>" alt="<?php echo ($vo["post_title"]); ?>" class="img-responsive"/>
                            </div>
                            <div class="txt"><?php echo (mb_substr($vo["post_title"],0,8,'utf-8')); ?></div>
                            </a>
                        </li><?php endif; endforeach; endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="rows">
    	<div class="linkbox">
        	<h2>
            	<img src="/public/images/link.png" alt="友情链接" class="img-responsive"/>
            </h2>
            <div class="linklist">
            	<?php $links=sp_getlinks(); ?>
                <ul>
                	<?php if(is_array($links)): foreach($links as $key=>$vo): ?><li>
                    	<?php if(!empty($vo["link_image"])): ?><a href="<?php echo ($vo["link_url"]); ?>" target="<?php echo ($vo["link_target"]); ?>" title="<?php echo ($vo["link_name"]); ?>">
                        	<img src="<?php echo sp_get_image_url($vo['link_image'],'!thumb175x70');?>" alt="<?php echo ($vo["link_name"]); ?>" class="img-responsive"/>
                        </a><?php endif; ?>
                    </li><?php endforeach; endif; ?>
                </ul>
            </div>
            <!--<div class="morebox">
            	<a href="#" class="more">MORE</a>
            </div>-->
        </div>
    </div>
</div>
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
<script src="/public/js/jquery.SuperSlide.js"></script>
<script>
jQuery(".slideBox").slide({mainCell:".bd ul",effect:"leftLoop",autoPlay:true,trigger:"click"});
jQuery(".displayBox").slide({mainCell:".bd ul",autoPlay:true});	
jQuery(".slideTxtBox").slide({trigger:"click"});
jQuery(".picScroll-left").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"leftLoop",autoPlay:true,vis:5,trigger:"click"});
</script>
<?php echo hook('footer_end');?>
</body>
</html>