<?php defined('IN_IA') or exit('Access Denied');?><!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
		<link rel="stylesheet" href="public\answer\css\style.css" />
		<link rel="stylesheet" href="public\evaluate\css\style.css" />
		<link rel="stylesheet" href="public\evaluate\css\dropload.css" />
		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
		<script type="text/javascript" src="public/answer/js/jquery.SuperSlide.2.1.1.js" ></script>
		<style>
			.tans{transform: rotate(180deg);}
			.slideTxtBox .bd li div{padding: 0.2rem 0 0;color: #888;}
		</style>
		<style>
			/*foot*/
			.foot{height:1.4rem;line-height:1.4rem;font-size: 0.6rem;color: #fff;text-align: center;background: rgb(66,139,202);position: fixed;left: 0;bottom: 0;width: 100%;}
		</style>
	</head>

	<body>
		<div class="box">
		
			<div class="slideTxtBox">
				<div class="hd">
					<ul>
						<li class="" onclick="location.href='index.php?i=2&c=hospital&a=answer&do=list&id=1'">医学资料</li>
						<li class="" onclick="location.href='index.php?i=2&c=hospital&a=answer&do=list&id=2'">就医百科</li>
						<li class="on" onclick="location.href='index.php?i=2&c=hospital&a=answer&do=list&id=0'">医患解答</li>
					</ul>
				</div><!--
				<div style="background-color: blue;">

				</div>-->
				<div class="content bd" id="main">
					<div class="search dtwd">
						<form action="index.php?i=2&c=hospital&a=answer&do=list&id=0&pd=soso"  method="post">
							<input type="text" name="sousuo" value="">
							<input type="submit" value="搜索">
							<input type="button" value="提问" onclick="location.href='index.php?i=2&c=hospital&a=answer&do=list&id=8'">
						</form>
					</div>
					<ul id="list_box" class="lists yslist ser"></ul>
				</div>

			</div>
			<div class="foot">版权所有 公主岭市妇幼保健院</div>
			<script src="public\evaluate\js\dropload.min.js"></script>
			<script>
                $(function(){
					function fontSizeRoot() {
						var ele = document.getElementsByTagName("html")[0];
						var kl = document.body.clientWidth;
						console.log(kl)
						if(kl >= 768) {
							kl = 768
						}
						var size = kl / 320 * 20;
						ele.style.fontSize = size + "px"
					}
					fontSizeRoot();
					window.onresize = function() {
						fontSizeRoot();
					};

//					上拉加载更多
                    // 页数
                    var page = 0;
                    // 每页展示8个
                    var size = 12;

                    // dropload
                    $('.content').dropload({
                        scrollArea : window,
                        loadDownFn : function(me){
                            page++;
                            // 拼接HTML
                            var result = '';
                            $.ajax({
                                type: 'GET',
                                url:'index.php?i=2&c=hospital&a=answer&do=list&id=6&page=' + page + '&psize=' + size,
                                dataType: 'json',
                                success: function(data){

                                    var arrLen = data.length;
                                    if(arrLen > 0){
                                        for(var i=0; i<arrLen; i++){
                                            result += '<li><a href="">'+data[i].title+'<span class="as">';
                                            switch (parseInt(data[i].isAnswered)){
                                                case 0:
                                                    result += '[未解答]';
                                                    break;
                                                default :
                                                    result += '[已解答]';
                                            }
                                            var str = GetCitys(data[i].id);
                                            str = eval("'" + str + "'");
                                            if(str == "null"){
                                                result += '</span></a><img src="public/answer/img/tab.png" class="tans" />';
											}else {
                                                result += '</span></a><img src="public/answer/img/tab.png" class="tans" /><div class="backas">';
                                                str = str.substring(1,str.length - 1);
                                                result += str;
                                                result += '</div>';
											}
                                        }
                                        // 如果没有数据
                                    }else{
                                        // 锁定
                                        me.lock();
                                        // 无数据
                                        me.noData();
                                    }
                                    // 为了测试，延迟1秒加载
                                    setTimeout(function(){
                                        // 插入数据到页面，放到最后面
                                        $('#list_box').append(result);
                                        // 每次数据插入，必须重置
                                        me.resetload();

                                        if ($('.firstblock').length > 0){
                                            if (parseInt($('.content').css('height')) <= $(window).height()){
                                                if ($('.dropload-noData').text() == '暂无数据'){
                                                    $('.dropload-down').css('display','none');
                                                }
                                            }
                                        }

                                    },1000);

                                },
                                error: function(xhr, type){
                                    console.log('Ajax error!');
                                    // 即使加载出错，也得重置
                                    me.resetload();
                                }
                            });
                        }
                    });

                    //第二次请求 查表
                    function GetCitys(pid) {
                        var str = '';
                        $.ajax({
                            type: "post",
                            url: "index.php?i=2&c=hospital&a=answer&do=list&id=7",
                            datatype: "json",
							data:{'pid':pid},
                            async: false,//注意！！这个为必要的参数，不然这个会在上面的Ajax请求后才执行
                            success: function (data) {
                                str = data;
                            }
                        });
                        return str;
                    }

                });

                $(document).delegate('#list_box li img','click',function() {
                    if($(this).siblings('div').length > 0){
                        $(this).toggleClass('tans');
                        $(this).siblings('div').slideToggle();
                    }
                })
                
			</script>
		</div>
	</body>
</html>