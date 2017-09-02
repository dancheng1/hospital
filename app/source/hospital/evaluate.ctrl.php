<?php
/**
 * Created by PhpStorm.
 * User: dancheng
 * Date: 2017/8/15
 * Time: 11:03
 */
defined('IN_IA') or exit('Access Denied');
$do = in_array($do, array('list')) ? $do : 'list';
load()->model('site');
load()->model('mc');
checkauth();
if($do == 'list'){
    $id = intval(isset($_GPC['id']) ? $_GPC['id'] : 0);
    if($id == 0){
        if($_POST){
            $data['doctorId'] = $_POST['doctorId'];
            $data['scorce'] = $_POST['scorce'];
            $data['evaluate_note'] = trim($_POST['evaluate_note']);
            $data['evaluate_date'] = time();
            $data['evaluate_user_id'] = $_W['member']['uid'];
            pdo_insert('evaluate', $data);
        }
        $doctors = pdo_fetchall("SELECT * FROM " . tablename('doctor'));
        template('hospital/evaluate/doctor_list');
    } if ($id == 1){
        $doctor_id = intval(isset($_GPC['doctor_id']) ? $_GPC['doctor_id'] : 1);
        $doctor = pdo_fetch("SELECT * FROM " . tablename('doctor') . " where id = " . $doctor_id);
        template('hospital/evaluate/doctor_evaluate');
    } if($id == 2){
        $doctor_id = intval(isset($_GPC['doctor_id']) ? $_GPC['doctor_id'] : 1);
        $evaluates = pdo_fetchall("SELECT * FROM " . tablename('evaluate') . " where doctorId = " . $doctor_id);
        $doctor = pdo_fetch("SELECT * FROM ".tablename('doctor') . " where id = " . $doctor_id);
        $section = pdo_fetch("SELECT * FROM ".tablename('section_office') . " where id = " . $doctor['section_id']);
        template('hospital/evaluate/evaluate_list');
    } if($id == 3){
        $pindex = max(1, intval($_GPC['page']));
        $psize = intval($_GPC['psize']);
        $doctors = pdo_fetchall("SELECT * FROM ".tablename('doctor')." LIMIT " . ($pindex - 1) * $psize . "," . $psize);
        $total = pdo_fetchcolumn("SELECT COUNT(*) FROM ".tablename('doctor') . " " . $where);
        //$pager = pagination($total, $pindex, $psize);
        echo json_encode($doctors);
    } if($id == 4){
        $doctor_id = intval(isset($_GPC['doctor_id']) ? $_GPC['doctor_id'] : 1);
        $doctor = pdo_fetch("SELECT * FROM ".tablename('doctor') . " where id = " . $doctor_id);
        $section = pdo_fetch("SELECT * FROM ".tablename('section_office') . " where id = " . $doctor['section_id']);

        $pindex = max(1, intval($_GPC['page']));
        $psize = max(3, intval($_GPC['psize']));
        $evaluates = pdo_fetchall("SELECT * FROM ".tablename('evaluate')." where doctorId = " . $doctor_id . "  order by evaluate_date desc LIMIT " . ($pindex - 1) * $psize . "," . $psize);
    
        echo json_encode($evaluates);
    } if($id == 5){
        $uid = $_GPC['evaluate_user_id'];
        $user = pdo_fetch("SELECT * FROM ".tablename('mc_members') . " where uid = " . $uid);
        echo json_encode($user);
    }
}