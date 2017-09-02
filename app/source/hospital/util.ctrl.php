<?php
/**
 * Created by PhpStorm.
 * User: dancheng
 * Date: 2017/8/14
 * Time: 17:10
 */
defined('IN_IA') or exit('Access Denied');
$do = in_array($do, array('section', 'doctor', 'evaluate', 'evaluateadd')) ? $do : 'list';
load()->model('site');
load()->model('mc');
checkauth();

if($do == 'section'){
    $sections = pdo_fetchall("SELECT * FROM " . tablename('section_office'));
    return json_encode(array('sections'=>$sections));
} if($do == 'doctor'){
    $doctors = pdo_fetchall("SELECT * FROM " . tablename('doctor'));
    return json_encode(array('doctors'=>$doctors));
} if($do == 'evaluate'){
    $doctor_id = intval(isset($_GPC['doctor_id']) ? $_GPC['doctor_id'] : 1);
    $evaluates = pdo_fetchall("SELECT * FROM " . tablename('evaluate')) . "where doctorId = " . $doctor_id;
    return json_encode(array('evaluates'=>$evaluates));
} if($do == 'evaluateadd'){
    $data['doctorId'] = intval(isset($_GPC['doctor_id']) ? $_GPC['doctor_id'] : 1);
    $data['evaluate_user_id'] = intval(isset($_GPC['evaluate_user_id']) ? $_GPC['evaluate_user_id'] : 1);
    $data['scorce'] = intval(isset($_GPC['scorce']) ? $_GPC['scorce'] : 0);
    $data['evaluate_note'] = intval(isset($_GPC['evaluate_note']) ? $_GPC['evaluate_note'] : '');
    $data['evaluate_date'] = new date();
    return json_encode(array('result'=>pdo_insert('evaluate', $data)));
}