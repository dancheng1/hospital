<?php
/**
 * Created by PhpStorm.
 * User: dancheng
 * Date: 2017/8/15
 * Time: 9:43
 */
defined('IN_IA') or exit('Access Denied');
$do = in_array($do, array('list')) ? $do : 'list';
load()->model('site');
load()->model('mc');
checkauth();
if($do == 'list'){
    $id = intval(isset($_GPC['id']) ? $_GPC['id'] : 0);
    if($id == 0){
        $archive_types = pdo_fetchall("SELECT * FROM " . tablename('archive_type'));
        template('hospital/management/management');
    } elseif($id == 1){
        if($_POST){
            $data['name'] = trim($_POST['name']);
            $data['content'] = trim($_POST['content']);
            $data['id_number'] = trim($_POST['id_number']);
            $data['phone'] = trim($_POST['phone']);
            $data['date'] = trim($_POST['date']);
            $data['type_son'] = trim($_POST['type_son']);
            $data['type'] = intval(isset($_GPC['type']) ? $_GPC['type'] : 1);
            $data['ownerId'] = $_W['member']['uid'];
            if(isset($_POST['flag']) && $_POST['flag'] == true){
                $data['flag'] = 1;
            } else {
                $data['flag'] = 0;
            }
            $data['stage_date'] = time();
            pdo_insert('archive', $data);
        }
        if(isset($_GPC['del_id'])){
            $id = $_GPC['del_id'];
            pdo_delete('archive', array('id' => $id));
        }
        $type = intval(isset($_GPC['type']) ? $_GPC['type'] : 1);
        $archivename = '';
        $archive_type = pdo_fetch("SELECT * FROM " . tablename('archive_type') . " where id = " . $type);
        $archivename = $archive_type['typeName'];
        $archives = pdo_fetchall("SELECT * FROM " . tablename('archive') . " WHERE type = " . $type);
        template('hospital/management/managementList');
    } elseif($id == 2){
        $type = intval(isset($_GPC['type']) ? $_GPC['type'] : 1);
        $archive_id = intval(isset($_GPC['archive_id']) ? $_GPC['archive_id'] : 1);
        $archive = pdo_fetch("SELECT * FROM " . tablename('archive') . " WHERE id = " . $archive_id);
        $archive_type_sons = pdo_fetchall("SELECT * FROM " . tablename('archive_type_son') . " where parentId = " . $type);
        template('hospital/management/managementInfo');
    } elseif($id == 3){
        $type = intval(isset($_GPC['type']) ? $_GPC['type'] : 1);
        $archive_type_sons = pdo_fetchall("SELECT * FROM " . tablename('archive_type_son') . " where parentId = " . $type);
        template('hospital/management/management_add');
    } elseif($id == 4){
        //$_W['member']['uid'];
        $archive_id = $_POST['archive_id'];
        $name = trim($_POST['name']);
        $content = trim($_POST['content']);
        $id_number = trim($_POST['id_number']);
        $phone = trim($_POST['phone']);
        $date = trim($_POST['date']);
        if(isset($_POST['flag']) && $_POST['flag'] == true){
            $flag = 1;
        } else {
            $flag = 0;
        }
        pdo_update('archive', array('content' => $content, 'name' => $name, 'id_number' => $id_number, 'phone' => $phone, 'date' => $date, 'flag' => $flag), array('id' => $archive_id));
        $type = intval(isset($_GPC['type']) ? $_GPC['type'] : 1);
        $archivename = '';
        $archive_type = pdo_fetch("SELECT * FROM " . tablename('archive_type') . " where id = " . $type);
        $archivename = $archive_type['typeName'];
        $archives = pdo_fetchall("SELECT * FROM " . tablename('archive') . " WHERE type = " . $type);
        template('hospital/management/managementList');
    } else if($id == 5){
        $type = intval(isset($_GPC['type']) ? $_GPC['type'] : 1);
        $archivename = '';
        $archive_type = pdo_fetch("SELECT * FROM " . tablename('archive_type') . " where id = " . $type);
        $archivename = $archive_type['typeName'];
        $pindex = max(1, intval($_GPC['page']));
        $psize = max(3, intval($_GPC['psize']));
        $archives = pdo_fetchall("SELECT * FROM ".tablename('archive')." WHERE ownerId = " . $_W['member']['uid'] . " and type = " . $type . "  order by stage_date desc LIMIT " . ($pindex - 1) * $psize . "," . $psize);
        echo json_encode($archives);
    }
}