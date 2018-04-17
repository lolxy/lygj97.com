<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
<head>
    <title><?php echo ($post_title); ?>_<?php echo ($site_name); ?> </title>
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
	
<style>
.h1, .h2, .h3, h1, h2, h3 {
    margin-top: 20px;
    margin-bottom: 10px;
}
.contact ul li{float: none;}
</style>
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
<script src="http://api.map.baidu.com/api?v=1.3"></script>

<?php $slides=sp_getslide("contact_ads"); ?>
<div class="bj_con">
    <div class="content">
        <!---- 公司介绍 ---->
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
            	<img src="/public/picture/into12.png">
            	<h1>联系合作</h1>
            </div>
            <div class="contact">
            	<div class="row">
					<div class="col-xs-12 hidden-xs" style="margin-top:0px; margin-bottom:20px;">
						<div style="width:100%;height:254px;border:#ccc solid 1px;font-size:12px" id="map"></div>
					</div>
                	<div class="col-xs-12 col-md-6">
                    	<h1>您好&nbsp;&nbsp;HELLO!</h1>
                      	<p>感谢您来到<?php echo ($company_name); ?>，若您有对我司有什么好的意见，请您为我们留言或使用以下方式联系我们，我们将尽快给你回复，并为您提供最真诚的服务，谢谢。</p>
                        <ul>
                        	<li><b><img src="/public/picture/into13.png"></b><span><?php echo ($tell); ?></span></li>
                        	<li><b><img src="/public/picture/into14.png"></b><span><?php echo ($email); ?></span></li>
                        	<li><b><img src="/public/picture/into14.png"></b><span><?php echo ($address); ?></span></li>
                        </ul>
                        <div class="contact_ewm visible-lg visible-md"><img src="<?php echo sp_get_image_url($site_erweima,'!thumbnail120x120');?>" alt="" class="img-responsive"/></div>
                    </div>
                	<div class="col-xs-12 col-md-6 mt-xs-20">
						<form class="form-light js-ajax-form" role="form" method="post" action="<?php echo U('api/guestbook/addmsg');?>">
							<h2>你的姓名</h2>
                            <input type="text" class="contact_bd" placeholder="请输入您的姓名" name="full_name">
							<h2>联系手机</h2>
                            <input type="text" class="contact_bd" placeholder="请输入您的手机号码" name="tell">
                            <h2>邮箱</h2>
                            <input type="email" class="contact_bd" placeholder="请输入邮箱地址" name="email">
                            <h2>内容</h2>
                            <textarea class="span6" id="message" placeholder="请输入您的留言内容" style="height: 100px;" name="msg"></textarea>
							<h2>验证码</h2>
							<div class="contact_yzm">
								<input type="text" placeholder="请输入验证码" name="verify" autocomplete="off">
								<?php echo sp_verifycode_img('length=4&font_size=16&width=150&height=34&use_noise=1&use_curve=0','style="cursor:pointer;vertical-align: top;" title="点击获取"');?>
							</div>
                            <button type="submit" class="contact_anniu js-ajax-submit" data-wait="1500">发送留言</button>
						</form>
                    </div>
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
<script type="text/javascript">
//全局变量
var GV = {
    ROOT: "/",
    WEB_ROOT: "/",
    JS_ROOT: "public/js/"
};
</script>
<script src="/public/js/wind.js"></script>
<script src="/public/js/frontend.js"></script>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
      addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){ 
      map = new BMap.Map("map"); 
      map.centerAndZoom(new BMap.Point(<?php echo ($jingdu); ?>,<?php echo ($weidu); ?>),17);
    }
    function setMapEvent(){
      map.enableScrollWheelZoom();
      map.enableKeyboard();
      map.enableDragging();
      map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
    function addMapOverlay(){
      var markers = [
        {content:"我的备注",title:"<?php echo ($company_name); ?>",imageOffset: {width:0,height:3},position:{lat:<?php echo ($weidu); ?>,lng:<?php echo ($jingdu); ?>}}
      ];
      for(var index = 0; index < markers.length; index++ ){
        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
        var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
        })});
        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
        var opts = {
          width: 200,
          title: markers[index].title,
          enableMessage: false
        };
        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
        marker.setLabel(label);
        addClickHandler(marker,infoWindow);
        map.addOverlay(marker);
      };
    }
    //向地图添加控件
    function addMapControl(){
      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
      map.addControl(scaleControl);
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
      map.addControl(navControl);
      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
      map.addControl(overviewControl);
    }
    var map;
      initMap();
  </script>
  <?php echo hook('footer_end');?>
</body>
</html>