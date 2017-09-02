<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/14
 * Time: 19:11
 */
defined('IN_IA') or exit('Access Denied');
$templateid = intval($_GPC['templateid']);
$dos = array('default');
$do = in_array($do, $dos) ? $do : 'display';

if ($do == 'default') {
    template('site/test');
}