<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/17
 * Time: 15:32
 */
defined('IN_IA') or exit('Access Denied');
uni_user_permission_check('mc_member');
$dos = array('list', 'doctor', 'update', 'add_day', 'update_day');
$do = in_array($do, $dos) ? $do : 'list';
load()->model('mc');
define('FRAME', 'hospital');
$frames = buildframes(array(FRAME), $_GPC['m']);
$frames = $frames[FRAME];


if($do == 'list'){
    if($_POST){
        if($_GPC['pd'] == 'add_day'){
            $doctor_id = $_POST['doctors'];
            $doctors = explode(',', $doctor_id);

            $data['order_date'] = $_POST['date'];
            $data['number'] = 2;
            for($jlll_i = 0; $jlll_i < count($doctors); $jlll_i++){
                $data['doctor_id'] = $doctors[$jlll_i];
                $doctor = pdo_fetch("SELECT * FROM ".tablename('doctor') . " where id = " . $doctors[$jlll_i]);
                $data['order_level'] = $doctor['level'];
                pdo_insert('visitation_info', $data);
            }
        }
        if($_GPC['pd'] == 'update_day'){
            $doctor_id = $_POST['doctors1'];
            $doctors = explode(',', $doctor_id);
            //var_dump($doctors);

            $yuan_date = $_POST['yuan_date'];
            pdo_delete('visitation_info', array('order_date' => $yuan_date));

            $data['order_date'] = $_POST['yuan_date'];
            $data['number'] = 2;
            for($jlll_i = 0; $jlll_i < count($doctors); $jlll_i++){
                $data['doctor_id'] = $doctors[$jlll_i];
                $doctor = pdo_fetch("SELECT * FROM ".tablename('doctor') . " where id = " . $doctors[$jlll_i]);
                $data['order_level'] = $doctor['level'];
                pdo_insert('visitation_info', $data);
            }
        }
        if($_GPC['pd'] == 'del'){
            $ids = array();
            $ids = $_POST['ssid'];
            foreach($ids as $id){
                pdo_delete('visitation_info', array('order_date' => $id));
            }
        }
    }
    $date = array();
    $visitions = pdo_fetchall("SELECT * FROM ".tablename('visitation_info') . "order by order_date ASC");
    foreach($visitions as $visition){
        if(!in_array($visition['order_date'], $date))
            $date[] = $visition['order_date'];
    }
} elseif ($do == 'add_day'){
    $date11 = array();
    $visitions = pdo_fetchall("SELECT * FROM ".tablename('visitation_info') . "order by order_date ASC");
    foreach($visitions as $visition){
        if(!in_array($visition['order_date'], $date))
            $date11[] = $visition['order_date'];
    }

    $weekarray = array("一", "二", "三", "四", "五", "六", "日");
    $oneD = 24 * 60 * 60;
    $i = -1;
    $week = $weekarray[date("w", time() + $oneD * $i)];
    $showdate = array();
    $date = array();

    $jl__j = 0;
    for( ; $jl__j < 7; $jl__j++){
        if($week == $weekarray[$jl__j])
            break;
    }
    $jl__num = 0;$jl__temp = $jl__j;
    for(; $jl__temp < 7; $jl__temp++){
        if(!in_array(date('m-d',time() + $jl__num), $date11)){
            $date[] = date('m-d',time() + $jl__num);
            $showdate[] = date('Y-m-d',time() + $jl__num) . " 本周" . $weekarray[date("w", time() + $jl__num + $oneD * $i)];
        }
        $jl__num += 86400;
    }
    for($jl__jl = 0; $jl__jl < 7; $jl__jl++){
        if(!in_array(date('m-d',time() + $jl__num), $date11)) {
            $date[] = date('m-d', time() + $jl__num);
            $showdate[] = date('Y-m-d', time() + $jl__num) . " 下周" . $weekarray[date("w", time() + $jl__num + $oneD * $i)];
        }
        $jl__num += 86400;
    }
    $all_doctors = pdo_fetchall("SELECT * FROM ".tablename('doctor'));
} elseif ($do == 'update_day'){
    $center_date = $_GPC['center_date'];

    $date11 = array();
    $visitions = pdo_fetchall("SELECT * FROM ".tablename('visitation_info') . "order by order_date ASC");
    foreach($visitions as $visition){
        if(!in_array($visition['order_date'], $date))
            $date11[] = $visition['order_date'];
    }

    $weekarray = array("一", "二", "三", "四", "五", "六", "日");
    $oneD = 24 * 60 * 60;
    $i = -1;
    $week = $weekarray[date("w", time() + $oneD * $i)];
    $showdate = array();
    $date = array();

    $jl__j = 0;
    for( ; $jl__j < 7; $jl__j++){
        if($week == $weekarray[$jl__j])
            break;
    }
    $jl__num = 86400;$jl__temp = $jl__j + 1;
    for(; $jl__temp < 7; $jl__temp++){
        if(!in_array(date('m-d',time() + $jl__num), $date11)){
            $date[] = date('m-d',time() + $jl__num);
            $showdate[] = date('Y-m-d',time() + $jl__num) . " 本周" . $weekarray[date("w", time() + $jl__num + $oneD * $i)];
        }
        $jl__num += 86400;
    }
    for($jl__jl = 0; $jl__jl < 7; $jl__jl++){
        if(!in_array(date('m-d',time() + $jl__num), $date11)) {
            $date[] = date('m-d', time() + $jl__num);
            $showdate[] = date('Y-m-d', time() + $jl__num) . " 下周" . $weekarray[date("w", time() + $jl__num + $oneD * $i)];
        }
        $jl__num += 86400;
    }

    $visitations = pdo_fetchall("SELECT * FROM ".tablename('visitation_info')." where order_date = '" . $center_date . "'");
    $doctors = array();
    $all_doctors = array();
    foreach($visitations as $visition){
        $doctor = pdo_fetch("SELECT * FROM ".tablename('doctor') . " where id = " . $visition['doctor_id']);
        $doctors[] = $doctor;
    }
    $all_doctor = pdo_fetchall("SELECT * FROM ".tablename('doctor'));
    foreach($all_doctor as $all_do){
        if(!in_array($all_do, $doctors))
            $all_doctors[] = $all_do;
    }
    /*var_dump($doctors);
    echo '<br/><br/>';
    var_dump($all_doctors);*/
} elseif ($do == 'doctor'){
    if($_POST){
        $id = $_POST['id'];
        $num = $_POST['num'];
        $visition = pdo_fetch("SELECT * FROM ".tablename('visitation_info') . " where id = " . $id);
        if($visition['registered'] <= $num){
            pdo_update('visitation_info', array('number' => $num), array('id' => $id));
        }
    }
    $date = $_GPC['date'];
    $visitions = pdo_fetchall("SELECT * FROM ".tablename('visitation_info') . " where order_date = '" . $date . "'");
} elseif ($do == 'update'){
    $id = $_GPC['id'];
    $date = $_GPC['date'];
    $visition = pdo_fetch("SELECT * FROM ".tablename('visitation_info') . " where id = " . $id);
}
template('hospital/visits');

