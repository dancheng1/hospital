<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/22
 * Time: 10:46
 */
defined('IN_IA') or exit('Access Denied');
uni_user_permission_check('mc_member');
$dos = array('list', 'find', 'update');
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
            pdo_delete('evaluate', array('id' => $id));
        }
    }
    $pindex = max(1, intval($_GPC['page']));
    $psize = 8;
    $where = 'where ';
    if (!empty($_GPC['sectionid']) && empty($_GPC['pd'])) {
        $where .= "section_id = " . $_GPC['sectionid'] . " and ";
    }
    if (!empty($_GPC['level']) && empty($_GPC['pd'])) {
        $where .= "level = " . $_GPC['level'] . " and ";
    }
    if (!empty($_GPC['id']) && empty($_GPC['pd'])) {
        $where .= "id = " . $_GPC['id'] . " and ";
    }
    $where .= $_GPC['username'] ? "name like '%" . trim($_GPC['username']) ."%' " : "name like '%%'";

    /*echo  '<br/>' . $where;*/
    $sections = pdo_fetchall("SELECT * FROM ".tablename('section_office'));
    $doctors = pdo_fetchall("SELECT * FROM ".tablename('doctor')." " . $where . " LIMIT " . ($pindex - 1) * $psize . "," . $psize);
    $total = pdo_fetchcolumn("SELECT COUNT(*) FROM ".tablename('doctor') . " " . $where);

    $pager = pagination($total, $pindex, $psize);
} elseif ($do == 'find'){
    $id = $_GPC['id'];
    $evaluates = pdo_fetchall("SELECT * FROM ".tablename('evaluate')." where doctorId = " . $id);
}
template('hospital/evaluate');
