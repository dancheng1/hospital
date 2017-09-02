<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/22
 * Time: 10:47
 */
defined('IN_IA') or exit('Access Denied');
uni_user_permission_check('mc_member');
$dos = array('list', 'add', 'update', 'son_type', 'add_son_type', 'update_son_type');
$do = in_array($do, $dos) ? $do : 'list';
load()->model('mc');
define('FRAME', 'hospital');
$frames = buildframes(array(FRAME), $_GPC['m']);
$frames = $frames[FRAME];


if($do == 'list'){
    if($_GPC['pd'] == 'add'){
        $data['typeName'] = trim($_POST['name']);
        pdo_insert('archive_type', $data);
    }
    if($_GPC['pd'] == 'update'){
        $data['typeName'] = trim($_POST['name']);
        $id = $_POST['id'];
        pdo_update('archive_type', $data, array('id' => $id));
    }
    if($_GPC['pd'] == 'del'){
        $ids = array();
        $ids = $_POST['ssid'];
        foreach($ids as $id){
            pdo_delete('archive_type', array('id' => $id));
        }
    }
    $archive_types = pdo_fetchall("SELECT * FROM ".tablename('archive_type'));
} elseif ($do == 'update'){
    $id = $_GPC['id'];
    $archive_type = pdo_fetch("SELECT * FROM ".tablename('archive_type') . " where id = " . $id);
} elseif ($do == 'add'){
} elseif ($do == 'son_type'){
    if($_GPC['pd'] == 'add'){
        $data['name'] = trim($_POST['name']);
        $data['parentId'] = trim($_POST['id']);
        pdo_insert('archive_type_son', $data);
    }
    if($_GPC['pd'] == 'update'){
        $data['name'] = trim($_POST['name']);
        $son_id = $_POST['son_id'];
        pdo_update('archive_type_son', $data, array('id' => $son_id));
    }
    if($_GPC['pd'] == 'del'){
        $ids = array();
        $ids = $_POST['ssid'];
        foreach($ids as $id){
            pdo_delete('archive_type_son', array('id' => $id));
        }
    }
    $id = $_GPC['id'];
    $archive_type = pdo_fetch("SELECT * FROM ".tablename('archive_type') . " where id = " . $id);
    $archive_type_sons = pdo_fetchall("SELECT * FROM ".tablename('archive_type_son') . " where parentId = " . $id);
} elseif ($do == 'add_son_type'){
    $id = $_GPC['id'];   //这个id是病情类型id
} elseif ($do == 'update_son_type'){
    $sonid = $_GPC['id'];    //此id是病情id
    $parent_id = $_GPC['parent_id'];     //此id是病情类型id
    $archive_type_son = pdo_fetch("SELECT * FROM ".tablename('archive_type_son') . " where id = " . $sonid);
}
template('hospital/management_type');
