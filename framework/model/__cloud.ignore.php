<?php
/**
 * Author：Alvin, QQ：2193994009
 * Function：忽略部分文件、模块、风格微擎云检测，以便于测试本地模块，仅供研究学习使用，请勿用于商业用途！
 *			 将希望忽略微擎云端检测的文件路径、模块目录、风格目录添加到本文件中。
 *
 * Note：本功能及相关文件首发QQ群，群号132902875，如需获得持续更新，请付费入群。
 * Link：点击链接加入群【微擎技术交流】：http://jq.qq.com/?_wv=1027&k=27mL7zo
 */
 
//检查更新时要忽略的微擎默认文件
function ignore_files(){
	return array(
		'/web/resource/images/gw-logo.png',
		'/web/themes/default/account/welcome.html',
		'/web/themes/default/common/footer-base.html',
		'/web/themes/default/common/footer-cms.html',
		'/web/themes/default/common/footer-gw.html',
		'/web/themes/default/common/header-base.html',
		'/web/themes/default/common/header-cms.html',
		'/web/themes/default/common/header-gw.html',
		'/web/themes/default/common/header.html',
		'/web/themes/default/user/login.html',
		'/web/common/common.func.php',
        '/framework/model/cloud.mod.php'
	);
}
//检查更新时要忽略的本地模块
function ignore_modules(){
	return array(
		'ewei_shopv2'//人人商城
	);
}
//检查更新时要忽略的本地风格(微站模板)
function ignore_themes(){
	return array(
		'style1',
		'style2'		
	);
}
//////重要提醒，在自行添加内容时请注意字符串之间用英文半角逗号分隔.