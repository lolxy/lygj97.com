<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
<head>
    <title><?php echo ($term["name"]); ?>_<?php echo ($seo_title); ?>_<?php echo ($site_name); ?></title>
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
<?php $slides=sp_getslide("gongyi_ads"); ?>
<div class="bj_con">
    <div class="content">
        <!---- 营造工艺 ---->
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
                <img src="/public/picture/into11.png">
                <h1><?php echo ($term["name"]); ?></h1>
                <?php $breadcrumb=sp_get_breadcrumb($term['term_id']); ?> 
                <p class="visible-md visible-lg">
                <a href="">首页</a>
                <?php if(is_array($breadcrumb)): foreach($breadcrumb as $key=>$vo): ?><a href="<?php echo leuu('portal/list/index',array('id'=>$vo['term_id']));?>">> <?php echo ($vo["name"]); ?></a><?php endforeach; endif; ?>
                <span>> <?php echo ($term["name"]); ?></span>
                </p>
            </div>
            <div class="about_mune">
                <?php $terms=sp_get_child_terms(8); ?>
                <ul>
                <?php if(is_array($terms)): foreach($terms as $key=>$vo): if($vo['term_id']==$_GET['id']): ?><li class="bj"><?php echo ($vo["name"]); ?></li>
                    <?php else: ?>
                    <li><a href="<?php echo leuu('portal/list/index',array('id'=>$vo['term_id']));?>"><?php echo ($vo["name"]); ?></a></li><?php endif; endforeach; endif; ?>
                </ul>
            </div>
            <div class="clearfix"></div>
            <div class="case">
                <div class="row">
                	<?php $pagetpl="<li><span>{recordcount}条记录 {pageindex}/{pagecount} 页</span></li>{first}{prev}{liststart}{list}{listend}<li class=searchpage>{jump}</li>{next}{last}"; $cterms=sp_get_child_terms($cat_id); $termids=null; foreach($cterms as $cvo){ $ctermid = sp_get_child_terms($cvo['term_id']); $termids[]=$cvo['term_id']; foreach($ctermid as $cvos){ $termids[]=$cvos['term_id']; } } $termsid = empty($termids)?$cat_id:$cat_id.','.implode(',',$termids); $lists = sp_sql_posts_paged("cid:$termsid;field:term_id,object_id,post_title,smeta;order:listorder asc,post_modified DESC;",9,$pagetpl); ?>
                    
                    <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): foreach($lists['posts'] as $key=>$vo): $smeta=json_decode($vo['smeta'],true); ?>
                        <div class="col-xs-6 col-md-4">
                            <a class="case_con" href="<?php echo leuu('portal/article/index',array('id'=>$vo['object_id'],'cid'=>$vo['term_id']));?>" target="_blank">
                                <span>
                                    <?php if(!empty($smeta['thumb'])): ?><img src="<?php echo sp_get_image_url($smeta['thumb'],'!water300x220');?>"/>
                                    <?php else: ?>
                                        <img src="/public/images/noimg.png"><?php endif; ?>
                                </span>
                                <p><?php echo ($vo["post_title"]); ?></p>
                            </a>
                    	</div><?php endforeach; endif; ?>
                    
                   <nav class="new_fy"><div class=pagination><ul><?php echo ($lists["page"]); ?></ul></div></nav>
                   
                   <?php else: ?>
                   <p>本栏目暂无数据！</p><?php endif; ?>               
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
<?php echo hook('footer_end');?>
</body>
</html>