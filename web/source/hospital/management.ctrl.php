<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/22
 * Time: 10:47
 */
defined('IN_IA') or exit('Access Denied');
uni_user_permission_check('mc_member');
$dos = array('list', 'edit', 'update');
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
            pdo_delete('archive', array('id' => $id));
        }
    }
    $pindex = max(1, intval($_GPC['page']));
    $psize = 8;
    $where = 'where ';
    if (!empty($_GPC['typeid'])) {
        $where .= "type = " . $_GPC['typeid'] . " and ";
    }
    $where .= $_GPC['name'] ? "name like '%" . trim($_GPC['name']) ."%' " : "name like '%%'";

    /*echo  '<br/>' . $where;*/
    $managements = pdo_fetchall("SELECT * FROM ".tablename('archive')." " . $where . " LIMIT " . ($pindex - 1) * $psize . "," . $psize);
    $total = pdo_fetchcolumn("SELECT COUNT(*) FROM ".tablename('archive') . " " . $where);
    $archive_type_sons = pdo_fetchall("SELECT * FROM " . tablename('archive_type'));

    $pager = pagination($total, $pindex, $psize);
} elseif ($do == 'edit'){
    $id = $_GPC['id'];
    $management = pdo_fetch("SELECT * FROM ".tablename('archive') . " where id = " . $id);
    $arch111 = pdo_fetch("SELECT * FROM ".tablename('archive_type')." where id = ".$management['type']);
    $type_son111 = pdo_fetch("SELECT * FROM ".tablename('archive_type_son')." where id = ".$management['type_son']);
}
template('hospital/management');
