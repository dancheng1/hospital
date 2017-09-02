<?php
/**
 * Created by PhpStorm.
 * User: dancheng
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
            $data['name'] = trim($_POST['name']);
            $data['phone'] = trim($_POST['phone']);
            $data['section_id'] = $_POST['sectionid'];
            $data['level'] = $_POST['level'];
            $data['intro'] = $_POST['intro'];
            require 'public/Upload.class.php';
            $upload = new Upload('public/uploads/doctor_img');
            if($filename = $upload->up($_FILES['img_url'])){
                $url = 'public/uploads/' . $filename;
                $data['img_url'] = $filename;
            } else {
            }
            pdo_insert('doctor', $data);
        }
        if($_GPC['pd'] == 'update'){
            $data['name'] = trim($_POST['name']);
            $data['phone'] = trim($_POST['phone']);
            $data['section_id'] = $_POST['sectionid'];
            $data['level'] = $_POST['level'];
            $data['intro'] = $_POST['intro'];
            $id = $_POST['id'];
            require 'public/Upload.class.php';
            $upload = new Upload('public/uploads/doctor_img');
            if($filename = $upload->up($_FILES['img_url'])){
                $url = 'public/uploads/' . $filename;
                $data['img_url'] = $filename;
            } else {
            }
            pdo_update('doctor', $data, array('id' => $id));
        }
        if($_GPC['pd'] == 'del'){
            $ids = array();
            $ids = $_POST['id'];
            foreach($ids as $id){
                pdo_delete('doctor', array('id' => $id));
            }
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

    echo $where;
    $sections = pdo_fetchall("SELECT * FROM ".tablename('section_office'));
    $doctors = pdo_fetchall("SELECT * FROM ".tablename('doctor')." " . $where . " LIMIT " . ($pindex - 1) * $psize . "," . $psize);
    $total = pdo_fetchcolumn("SELECT COUNT(*) FROM ".tablename('doctor') . " " . $where);

    $pager = pagination($total, $pindex, $psize);
} elseif ($do == 'add'){
    $page = $_GPC['page'];
    $sections = pdo_fetchall("SELECT * FROM ".tablename('section_office'));
} elseif ($do == 'update'){
    $page = $_GPC['page'];
    $id = $_GPC['id'];
    $doctor = pdo_fetch("SELECT * FROM ".tablename('doctor') . " where id = " . $id);
    $sections = pdo_fetchall("SELECT * FROM ".tablename('section_office'));
}
template('hospital/doctor');

