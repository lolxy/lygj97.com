//alert(image_path);
suspendcode="<div id=lovexin1 style='z-index: 1000; left: 6px; position: fixed; top: 150px; width: 110px; '><img src='"+image_path+"/Public/style/default/images/close.png' onClick='javascript:window.hide(1)' width='53' height='16' border='0' vspace='3' alt='关闭对联广告'><a href='#' target='_blank'><img src='"+left_img+"' style='width:100%;'></a></div>"
document.write(suspendcode);

suspendcode="<div id=lovexin2 style='z-index: 1000; right: 6px; position: fixed; top: 150px;  width: 110px; '><img src='"+image_path+"/Public/style/default/images/close.png' onClick='javascript:window.hide(2)' width='53' height='16' border='0' vspace='3' alt='关闭对联广告'><a href='#' target='_blank'><img src='"+right_img+"'  style='width:100%;'></a></div>"
document.write(suspendcode);

//flash格式调用方法
//<EMBED src='flash.swf' quality=high  WIDTH=100 HEIGHT=300 TYPE='application/x-shockwave-flash' id=ad wmode=opaque></EMBED>

lastScrollY=0;
function heartBeat(){
diffY=document.body.scrollTop;
percent=.3*(diffY-lastScrollY);
if(percent>0)percent=Math.ceil(percent);
else percent=Math.floor(percent);
document.all.lovexin1.style.pixelTop+=percent;
document.all.lovexin2.style.pixelTop+=percent;
lastScrollY=lastScrollY+percent;
}
function hide(id)  
{  
var o="lovexin"+id;
document.getElementById(o).style.visibility="hidden";
}
window.setInterval("heartBeat()",1);
