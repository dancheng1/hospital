<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/17
 * Time: 15:32
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
        if($_GPC['pd'] == 'add'){
            $data['cn_name'] = trim($_POST['cn_name']);
            $data['name'] = trim($_POST['name']);
            $data['precision'] = trim($_POST['precision']);
            $data['dimension'] = trim($_POST['dimension']);
            pdo_insert('map', $data);
        }
        if($_GPC['pd'] == 'update'){
            $data['cn_name'] = trim($_POST['cn_name']);
            $data['name'] = trim($_POST['name']);
            $data['precision'] = trim($_POST['precision']);
            $data['dimension'] = trim($_POST['dimension']);
            $id = trim($_POST['id']);
            pdo_update('map', $data, array('id' => $id));
        }
        if($_GPC['pd'] == 'del'){
            $ids = array();
            $ids = $_POST['ssid'];
            foreach($ids as $id){
                pdo_delete('map', array('id' => $id));
            }
        }
    }
    $pindex = max(1, intval($_GPC['page']));
    $psize = 8;

    /*echo  '<br/>' . $where;*/
    $maps = pdo_fetchall("SELECT * FROM ".tablename('map')." LIMIT " . ($pindex - 1) * $psize . "," . $psize);
    $total = pdo_fetchcolumn("SELECT COUNT(*) FROM ".tablename('map'));
    $pager = pagination($total, $pindex, $psize);
} elseif ($do == 'add'){
    $page = $_GPC['page'];
} elseif ($do == 'update'){
    $page = $_GPC['page'];
    $id = $_GPC['id'];
    $map = pdo_fetch("SELECT * FROM ".tablename('map') . " where id = " . $id);
}
template('hospital/map');

