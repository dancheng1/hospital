<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/22
 * Time: 10:38
 */

defined('IN_IA') or exit('Access Denied');
uni_user_permission_check('mc_member');
$dos = array('list', 'add', 'update');
$do = in_array($do, $dos) ? $do : 'list';
load()->model('mc');
define('FRAME', 'hospital');
$frames = buildframes(array(FRAME), $_GPC['m']);
$frames = $frames[FRAME];


if($do == 'list'){
    if($_POST){
        $ids = array();
        $ids = $_POST['ssid'];
        foreach($ids as $id){
            pdo_delete('reserve_registration', array('id' => $id));
        }
    }

    $pindex = max(1, intval($_GPC['page']));
    $psize = 8;
    $where = 'where ';
    if (!empty($_GPC['date'])) {
        $where .= "order_date = '" . $_GPC['date'] . "' and ";
    }
    $where .= $_GPC['name'] ? "name like '%" . trim($_GPC['name']) ."%' " : "name like '%%'";

    /*echo  '<br/>' . $where;*/
    $reserves = pdo_fetchall("SELECT * FROM ".tablename('reserve_registration')." " . $where . " LIMIT " . ($pindex - 1) * $psize . "," . $psize);
    $total = pdo_fetchcolumn("SELECT COUNT(*) FROM ".tablename('reserve_registration') . " " . $where);

    $pager = pagination($total, $pindex, $psize);

    $date1 = date('m-d',time());
    $date2 = date('m-d',time() + 86400);
    $date3 = date('m-d',time() + 172800);
    $date4 = date('m-d',time() + 259200);
    $date5 = date('m-d',time() + 345600);
    $date6 = date('m-d',time() + 432000);
    $date7 = date('m-d',time() + 518400);
}
template('hospital/appintment');

