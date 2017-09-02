<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/22
 * Time: 10:47
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
    if($_GPC['pd'] == 'add'){
        $data['name'] = trim($_POST['name']);
        if($_POST['daytime']){
            $data['daytime'] = $_POST['daytime'];
        } else {
            $data['daytime'] = 0;
        }
        if($_POST['monthtime']){
            $data['monthtime'] = $_POST['monthtime'];
        } else {
            $data['monthtime'] = 0;
        }
        $data['pushmsg'] = trim($_POST['pushmsg']);
        $data['typeId'] = $_POST['typeId'];
        pdo_insert('archive_msg', $data);
    }
    if($_GPC['pd'] == 'update'){
        $data['name'] = trim($_POST['name']);
        $msg_id = $_POST['msg_id'];
        if($_POST['daytime']){
            $data['daytime'] = $_POST['daytime'];
        } else {
            $data['daytime'] = 0;
        }
        if($_POST['monthtime']){
            $data['monthtime'] = $_POST['monthtime'];
        } else {
            $data['monthtime'] = 0;
        }
        $data['pushmsg'] = trim($_POST['pushmsg']);
        pdo_update('archive_msg', $data, array('id' => $msg_id));
    }
    if($_GPC['pd'] == 'del'){
        $ids = array();
        $ids = $_POST['ssid'];
        foreach($ids as $id){
            pdo_delete('archive_msg', array('id' => $id));
        }
    }
    $id = $_GPC['id'];   //病情id
    $parent_id = $_GPC['parent_id'];   //病情类型id
    $archive_msgs = pdo_fetchall("SELECT * FROM ".tablename('archive_msg')." where typeId = " . $id);
} elseif ($do == 'update'){
    $id = $_GPC['id'];
    $parent_id = $_GPC['parent_id'];
    $msg_id = $_GPC['msg_id'];
    $archive_msg = pdo_fetch("SELECT * FROM ".tablename('archive_msg') . " where id = " . $msg_id);
} elseif ($do == 'add'){
    $id = $_GPC['id'];
    $parent_id = $_GPC['parent_id'];
}
template('hospital/management_msg');
