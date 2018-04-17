<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title><?php echo ($post_title_en); ?>_<?php echo ($site_name_en); ?></title>
<meta name="keywords" content="<?php echo ($site_seo_keywords_en); ?>" />
<meta name="description" content="<?php echo ($site_seo_description_en); ?>">
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
.news_view{padding-bottom: 0;min-height:50px;margin-bottom: 10px;padding-bottom: 10px;clear:both;position:relative}
.new_botton{bottom: 20px;}
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
      <a href="javascript:void(0);" onclick="SetHome(this,'http://www.lygj97.com')"><span>Set Home</span></a> 
      <a href="javascript:void(0);" onclick="AddFavorite('Lung He Ancient Architectural',location.href)"><span>Add Favorite</span></a> 
      <a href="?l=zh-cn"><span>中文</span></a> 
      <a href="<?php echo ($gs_email); ?>" class="last" target="_blank"><span>Enterprise E-mail</span></a> 
      </div>
      <div class="clear"></div>
      <div class="search hidden-xs">
        <form method="post" class="form-inline" action="<?php echo U('portal/search/index');?>" target="_blank" autocomplete="off">
          <div class="inputbox">
            <input type="text" class="input-control" name="keyword" placeholder="Please enter search keywords" value="<?php echo I('get.keyword');?>"/>
          </div>
          <input type="submit" class="btn-search" value="Search">
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
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label_en</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label_en <span class='caret'></span></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style=""; $showlevel=2; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
        </div>
        <div class="rightnav fr">
        	<?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label_en</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label_en <span class='caret'></span></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style=""; $showlevel=2; $dropdown='dropdown'; echo sp_get_menu("2",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
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
          <input type="submit" class="btn-search" value="Search">
        </form>
      </div>
    <button class="" data-toggle="dropdown">
        <h1>Menu</h1>
        <span class="glyphicon glyphicon-align-justify"></span>
    </button>
    <button class="togglelan" data-toggle="dropdown" data-target=".dropdown-lang">
    <span class="glyphicon glyphicon-globe"></span>
    </button>
    <?php
 $effected_id=""; $filetpl="<a href='\$href' target='\$target'>\$label_en</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label_en <span class='caret'></span></a>"; $ul_class="" ; $li_class="mune_dt" ; $style="dropdown-menu"; $showlevel=1; $dropdown='dropdown'; echo sp_get_menu("3",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
    <ul class="dropdown-lang">
    	<li><a href="?l=zh-cn">中文版</a></li>
    	<li><a href="?l=en-us">English</a></li>
    </ul>
</div>
<?php $slides=sp_getslide("gcgy_ads"); ?>
<!-- Core CSS file -->
<link rel="stylesheet" href="/public/dist/photoswipe.css"> 
<link rel="stylesheet" href="/public/dist/default-skin/default-skin.css"> 
<!-- Core JS file -->
<script src="/public/dist/photoswipe.min.js"></script> 
<!-- UI JS file -->
<script src="/public/dist/photoswipe-ui-default.min.js"></script> 

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
      <img src="/public/picture/into09.png">
        <h1><?php echo ($term["name_en_en"]); ?></h1>
        <?php $breadcrumb=sp_get_breadcrumb($term['term_id']); ?> 
        <p class="visible-md visible-lg">
        <a href="">Home</a>
        <?php if(is_array($breadcrumb)): foreach($breadcrumb as $key=>$vo): ?><a href="<?php echo leuu('portal/list/index',array('id'=>$vo['term_id']));?>">> <?php echo ($vo["name_en"]); ?></a><?php endforeach; endif; ?>
        <a href="<?php echo leuu('portal/list/index',array('id'=>$term['term_id']));?>">> <?php echo ($term["name_en"]); ?></a>
        <span>> <?php echo (mb_substr($post_title_en,0,18,'utf-8')); ?></span>
        </p>
      </div>
      <div class="clearfix"></div>
      <div class="case">
      <div class="news_view">
        <h1 style=""><?php echo (mb_substr($post_title_en,0,30,'utf-8')); ?></h1>
        <h2>Time：<span><?php echo date('Y-m-d',strtotime($post_date));?></span> Source：<a href="#"><?php echo ($post_source_en); ?></a>&nbsp;&nbsp;Read：<span><?php echo ($post_hits); ?></span></h2>
      </div>
      
      	<div class="row my-gallery" itemscope>

            <?php if(is_array($smeta['photo'])): foreach($smeta['photo'] as $key=>$vo): $arr = getimagesize(sp_get_image_url($vo['url'],'!water800x600')); $length = $arr[0].'x'.$arr[1]; ?>
            <figure itemprop="associatedMedia" itemscope class="col-xs-6 col-md-4">
                <a class="case_con" href="<?php echo sp_get_image_url($vo['url'],'!water800x600');?>" itemprop="contentUrl" data-size="<?php echo ($length); ?>">
                    <span><img src="<?php echo sp_get_image_url($vo['url'],'!water300x220');?>" itemprop="thumbnail" alt="<?php echo ($vo["slide_des"]); ?>" /></span>
                </a>
                <figcaption itemprop="caption description"><?php echo ($vo["alt"]); ?></figcaption>
            </figure><?php endforeach; endif; ?>

        </div>

        <div class="news_view">
        <?php if(!empty($post_content)): ?><div class="news_view_com">
          <?php echo (htmlspecialchars_decode($post_content)); ?>
        </div><?php endif; ?>
        <div class="new_botton">
        <div class="new_botton_rigfht">
        <?php if(!empty($prev)): ?><a href="<?php echo leuu('portal/article/index',array('id'=>$prev['object_id'],'cid'=>$prev['term_id']));?>" title="<?php echo ($prev['post_title_en']); ?>">Prev</a><?php endif; ?>
        <?php if(!empty($next)): ?><a href="<?php echo leuu('portal/article/index',array('id'=>$next['object_id'],'cid'=>$next['term_id']));?>" title="<?php echo ($next['post_title_en']); ?>">Next</a><?php endif; ?>
          </div>
        </div>
      </div>
        
      </div>
    </div>
  </div>
</div>
<!---- 尾部 ----> 

<!-- Root element of PhotoSwipe. Must have class pswp. -->
<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

    <!-- Background of PhotoSwipe. 
         It's a separate element as animating opacity is faster than rgba(). -->
    <div class="pswp__bg"></div>

    <!-- Slides wrapper with overflow:hidden. -->
    <div class="pswp__scroll-wrap">

        <!-- Container that holds slides. 
            PhotoSwipe keeps only 3 of them in the DOM to save memory.
            Don't modify these 3 pswp__item elements, data is added later on. -->
        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <!--  Controls are self-explanatory. Order can be changed. -->

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                <!--<button class="pswp__button pswp__button--share" title="Share"></button>-->

                <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>

                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                <!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
                <!-- element will get class pswp__preloader--active when preloader is running -->
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                      <div class="pswp__preloader__cut">
                        <div class="pswp__preloader__donut"></div>
                      </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div> 
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
            </button>

            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
            </button>

            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>

        </div>

    </div>

</div>

<?php echo hook('footer');?>
<footer>
	<div class="containers ovh">
    	<div class="pbox">
        <div class="ulbox">
        <?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label_en</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label_en <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="footnav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("4",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
        </div>
        <p>
        	<?php echo ($site_copyright_en); ?>
        </p>
        <p>
        	Add：<?php echo ($address_en); ?>　<br/>
            P.C.：<?php echo ($postcd); ?> Tel：<?php echo ($tell); ?>  Fax：<?php echo ($fax); ?>
        </p>
        <!--<p>
        	<?php echo ($site_icp); ?> <a href="<?php echo ($site_host); ?>admin" target="_blank" class="last">[Administration center]</a>
        </p>-->
        </div>
        <div class="wxbox">
        	<span>WeChat</span>
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

<script>
var initPhotoSwipeFromDOM = function(gallerySelector) {

    // parse slide data (url, title, size ...) from DOM elements 
    // (children of gallerySelector)
    var parseThumbnailElements = function(el) {
        var thumbElements = el.childNodes,
            numNodes = thumbElements.length,
            items = [],
            figureEl,
            linkEl,
            size,
            item;

        for(var i = 0; i < numNodes; i++) {

            figureEl = thumbElements[i]; // <figure> element

            // include only element nodes 
            if(figureEl.nodeType !== 1) {
                continue;
            }

            linkEl = figureEl.children[0]; // <a> element

            size = linkEl.getAttribute('data-size').split('x');

            // create slide object
            item = {
                src: linkEl.getAttribute('href'),
                w: parseInt(size[0], 10),
                h: parseInt(size[1], 10)
            };



            if(figureEl.children.length > 1) {
                // <figcaption> content
                item.title = figureEl.children[1].innerHTML; 
            }

            if(linkEl.children.length > 0) {
                // <img> thumbnail element, retrieving thumbnail url
                item.msrc = linkEl.children[0].getAttribute('src');
            } 

            item.el = figureEl; // save link to element for getThumbBoundsFn
            items.push(item);
        }

        return items;
    };

    // find nearest parent element
    var closest = function closest(el, fn) {
        return el && ( fn(el) ? el : closest(el.parentNode, fn) );
    };

    // triggers when user clicks on thumbnail
    var onThumbnailsClick = function(e) {
        e = e || window.event;
        e.preventDefault ? e.preventDefault() : e.returnValue = false;

        var eTarget = e.target || e.srcElement;

        // find root element of slide
        var clickedListItem = closest(eTarget, function(el) {
            return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
        });

        if(!clickedListItem) {
            return;
        }

        // find index of clicked item by looping through all child nodes
        // alternatively, you may define index via data- attribute
        var clickedGallery = clickedListItem.parentNode,
            childNodes = clickedListItem.parentNode.childNodes,
            numChildNodes = childNodes.length,
            nodeIndex = 0,
            index;

        for (var i = 0; i < numChildNodes; i++) {
            if(childNodes[i].nodeType !== 1) { 
                continue; 
            }

            if(childNodes[i] === clickedListItem) {
                index = nodeIndex;
                break;
            }
            nodeIndex++;
        }



        if(index >= 0) {
            // open PhotoSwipe if valid index found
            openPhotoSwipe( index, clickedGallery );
        }
        return false;
    };

    // parse /public/picture index and gallery index from URL (#&pid=1&gid=2)
    var photoswipeParseHash = function() {
        var hash = window.location.hash.substring(1),
        params = {};

        if(hash.length < 5) {
            return params;
        }

        var vars = hash.split('&');
        for (var i = 0; i < vars.length; i++) {
            if(!vars[i]) {
                continue;
            }
            var pair = vars[i].split('=');  
            if(pair.length < 2) {
                continue;
            }           
            params[pair[0]] = pair[1];
        }

        if(params.gid) {
            params.gid = parseInt(params.gid, 10);
        }

        return params;
    };

    var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
        var pswpElement = document.querySelectorAll('.pswp')[0],
            gallery,
            options,
            items;

        items = parseThumbnailElements(galleryElement);

        // define options (if needed)

        options = {

            // define gallery index (for URL)
            galleryUID: galleryElement.getAttribute('data-pswp-uid'),

            getThumbBoundsFn: function(index) {
                // See Options -> getThumbBoundsFn section of documentation for more info
                var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                    pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                    rect = thumbnail.getBoundingClientRect(); 

                return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
            }

        };

        // PhotoSwipe opened from URL
        if(fromURL) {
            if(options.galleryPIDs) {
                // parse real index when custom PIDs are used 
                // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                for(var j = 0; j < items.length; j++) {
                    if(items[j].pid == index) {
                        options.index = j;
                        break;
                    }
                }
            } else {
                // in URL indexes start from 1
                options.index = parseInt(index, 10) - 1;
            }
        } else {
            options.index = parseInt(index, 10);
        }

        // exit if index not found
        if( isNaN(options.index) ) {
            return;
        }

        if(disableAnimation) {
            options.showAnimationDuration = 0;
        }

        // Pass data to PhotoSwipe and initialize it
        gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
        gallery.init();
    };

    // loop through all gallery elements and bind events
    var galleryElements = document.querySelectorAll( gallerySelector );

    for(var i = 0, l = galleryElements.length; i < l; i++) {
        galleryElements[i].setAttribute('data-pswp-uid', i+1);
        galleryElements[i].onclick = onThumbnailsClick;
    }

    // Parse URL and open gallery if it contains #&pid=3&gid=1
    var hashData = photoswipeParseHash();
    if(hashData.pid && hashData.gid) {
        openPhotoSwipe( hashData.pid ,  galleryElements[ hashData.gid - 1 ], true, true );
    }
};

// execute above function
initPhotoSwipeFromDOM('.my-gallery');
</script>
<?php echo hook('footer_end');?>
</body>
</html>