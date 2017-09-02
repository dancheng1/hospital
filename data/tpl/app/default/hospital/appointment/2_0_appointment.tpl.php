<?php defined('IN_IA') or exit('Access Denied');?><!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>首页</title>
	<link rel="stylesheet" type="text/css" href="public/css/api.css" />
    <link rel="stylesheet" type="text/css" href="public/css/common.css" />
	<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

	<style>
		html, body {width: 100%;min-height: 100%;background: #f0f0f0;}
		.h80 {height: 80px;}
		.h40 {height: 40px;}
		.h20 {height: 20px;}
    	.h10 {height: 10px;background: #f0f0f0;}
		.h1 {height: 1px;margin-left: 15px;background: #f0f0f0;}
		.fr {float: right;}
		.fl {float: left;}
		.hightitem {background-color: #fff;}
		.inwrap {padding-right: 15px;padding-left: 15px;}

		.row {display: -webkit-box;display: -webkit-flex;}
		.col {-webkit-box-flex:1; -webkit-flex:1; flex:1;}
		
		header {width: 100%; padding-bottom: 0px;background: #fff;}
		header .img_wrap {position: relative; width: 100%; font-size: 0; }
		header .img_wrap img {width: 100%; height: auto; }
		.viewed, .viewed-eye {display: inline-block; font-size: 12px; color: #fff; padding: 3px 10px; border-radius: 20px; }
		.list_shop header .img_wrap .viewed, .list_shop header .img_wrap .viewed-eye {position: absolute; bottom: 7px; left: 7px;background: #3e78ff; }
		.viewed .eye, .viewed-eye .eye {display: inline-block; width: 16px; height: 16px; background: url(public/image/funlife/eye.png) no-repeat; background-size: 11px auto; margin-bottom: -3px; }
		.list_shop header .title {padding: 15px 15px 10px; font-size: 16px; color: #333; }
		.list_shop header .desc {padding: 0 15px; color: #666; line-height: 21px; white-space: pre-wrap; }


		/*  间隔 */
		.list_shop .border {width: 100%; height: 21px; }

		/* section */
		.list_shop section {margin-bottom: 25px; background: #fff ; }
		.list_shop section .item {position: relative; padding: 15px 15px 45px 0; margin-left: 15px; border-bottom: 1px solid #e0e0e0;}
		.list_shop section .item .shop_wrap {font-size: 0; display: box; display: -webkit-box; padding-bottom: 10px; }
		.list_shop section .item .shop_wrap img {width: 110px; height: 83px; margin-right: 11px; border-radius: 4px; -webkit-border-radius: 4px; }
		.list_shop section .item .shop_wrap .info {font-size: 14px; padding-top: 4px; }
		.list_shop section .item .shop_wrap .info .name {margin: 5px 0; font-size: 16px; color: #323232; text-overflow: ellipsis; max-width: 160px; height: 24px; line-height: 24px; overflow: hidden; white-space: nowrap; }
		.star {display: inline-block; width: 66px; height: 12px; vertical-align: middle; background: url(public/image/remark.png) no-repeat; background-size: 86px auto; }
		.star.star-40 {background-position: 0 -249px; }
		.list_shop section .item .shop_wrap .info .price {vertical-align: middle; padding-left: 5px; color: #878787; }
		.list_shop section .item .shop_wrap .info .location {margin-top: 5px; color: #878787; }
		.list_shop section .item .shop_wrap .info .location .location_icon {display: inline-block; vertical-align: middle; width: 11px; height: 15px; background: url(public/image/location_icon.png) no-repeat; background-size: 11px auto; }
		.list_shop section .item .shop_wrap .info .location span {vertical-align: middle; padding-left: 10px; }
		.list_shop section .item .desc_wrap {max-height: 42px; overflow: hidden; }
		.list_shop section .item .like {position: absolute; bottom: 15px; color: #666; }
		.list_shop section .item .like .like_bg {display: inline-block; width: 16px; height: 16px; background: url(public/image/like_bg.png) no-repeat 0 0; background-size: 15px auto; vertical-align: middle; }
		.list_shop section .item .like .txt, .list_shop section .item .like .num {margin-left: 5px; vertical-align: middle; }

		.presshover {background-color: #FAFAFA !important;}
	</style>


    <style>
    	html, body {width: 100%;min-height: 100%;background: #f0f0f0;}
    	.h10 {height: 10px;background: #f0f0f0;}
		.h1 {height: 1px;margin-left: 15px;background: #f0f0f0;}
		.fr {float: right;}
		.hint {color: #666;font-size: 12px;margin-right: 5px;}

		.firstblock, .secondblock, .thirdblock {background-color: #fff;}
		/* 头部登陆 */
		.login {background-image: url(public/image/personal_bkg.jpg);background-repeat: no-repeat; background-size: contain;position: relative;}
		.loginbg {/*position: absolute;*/ width: 100%;}
		.login .personal_logo {position: absolute; top: 60px; width: 70px; left: 20px;}
		.person_arrow {position: absolute;height: 20px; right: 10px; top: 90px;}
		.login .userinfo {position: absolute; top: 60px; margin-left: 100px;}
		.login .userinfo .title {font-size: 20px; color: #fff;}
		.login .userinfo .subtitle {font-size: 14px; color: #fff;border: 1px solid #fff;display: inline-block;padding: 3px;border-radius: 4px;margin-top: 5px;}

		/* 设置条目 */
		.item {height: 50px;line-height: 50px;padding-left: 15px;background-color: #fff;}
		.item_ico {float: left;width: 30px;padding: 10px 10px 10px 0;}
		.item_arrow {float: right;width: 16px;padding: 17px 15px 15px 0;}

		.presshover {background-color: #FAFAFA;}
		
		/* 1. 2X2 */
		.flipcard {height: 50px; line-height: 50px; text-align: center; margin: 5px 5px 3px 5px; color: #000; background-color: #fff; font-size: 14px;}
		.darktitle {height: 40px;line-height: 40px;margin-left: 15px;font-size: 14px;color: #666;}
		
    </style>
	<style>
		/*head*/
		.head{height: 3rem;line-height: 2rem;background: rgb(66,139,202);text-align: center;position: relative;}
		.head span{color:#fff;display: inline-block;}
		.head span.bt-wz{font-size: 1.2rem;padding-top: 8px;}
		.head span.bt-back{background: url('public/evaluate/images/left.png') center no-repeat;height: 100%;width: 0.8rem;position: absolute;left: 0.6rem;background-size: 1.4rem;}

		/*foot*/
		.foot{height:2rem;line-height:2rem;font-size: 0.8rem;color: #fff;text-align: center;background: rgb(66,139,202);position: fixed;left: 0;bottom: 0;width: 100%;}
		.item{  border-bottom: 1px solid #f0f0f0;}
		.secondblock{margin-bottom: 50px;}
	</style>

</head>
<body>
	<div class="list_shop">
		<header>
	        <div class="img_wrap">
	            <img src="public/image/130388931581900055.jpg" alt="">
	            <div class="viewed-eye"><i class="eye"></i>189607</div>
	        </div>
	    </header>

	</div>

	<div class="darktitle">绿色科室</div>

	<!-- 第二块 -->

	<div class="secondblock">
		<?php 
		foreach($sections as $section):
		?>
		<div class="item" tapmode="presshover" onclick="location.href='index.php?i=2&c=hospital&a=appointment&do=list&id=1&section_id=<?php  echo $section['id']; ?>'">
			<img src="public/image/my_favorite_user_icon_normal.png" alt="" class="item_ico">
			<span><?php  echo $section['name']; ?></span>
			<img src="public/image/arrow.png" alt="" class="item_arrow">
		</div>
		<?php 
		endforeach;
		?>
	</div>
<script>
$(function () {
    console.log(11)
//    $('.secondblock .item_ico').prepend('<img src="" alt="" class="item_ico">');
    var arr=['public/evaluate/images/xxgwk.png','public/evaluate/images/hxnk.png','public/evaluate/images/sjwk.png','public/evaluate/images/fck.png','public/evaluate/images/yk.png','public/evaluate/images/kqk.png'];
    $('.secondblock .item').each(function () {
        var i = parseInt($(this).index());
        $(this).find('.item_ico').attr('src',arr[i]);
        console.log(22)
    })
})
</script>
<div class="foot">版权所有 公主岭市妇幼保健院</div>
</body>
<script type="text/javascript" scr="public/script/api.js"></script>
<script>
function openDetail()
{
	api.openWin({
		name: 'tuandetail',
		url: '../tuandetail_header.html',
		bounces: false,
		delay:200
	});
}
</script>
</html>