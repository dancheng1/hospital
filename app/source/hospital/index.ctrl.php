<?php
/**
 * Created by PhpStorm.
 * User: dancheng
 * Date: 2017/8/15
 * Time: 10:21
 */
defined('IN_IA') or exit('Access Denied');
$do = in_array($do, array('map', 'brief', 'famous', 'visits', 'cultural', 'change_map', 'change')) ? $do : 'list';
load()->model('site');
load()->model('mc');
checkauth();
if($do == 'map'){
    $maps = pdo_fetchall("SELECT * FROM " . tablename('map'));
    template('hospital/index/change_map');
} elseif($do == 'change') {
    $strAddress = $_GPC['strAddress'];
    $hospName = $_GPC['hospName'];
    template('hospital/index/HTMLPage2');
} elseif($do == 'change_map') {
    /*$id = $_GPC['id'];
    $map = pdo_fetch("SELECT * FROM " . tablename('map') . " where id = " . $id);*/
    template('hospital/index/HTMLPage1');
} elseif($do == 'brief') {
    //echo $_W['fans']['from_user'] . '<br/>';
    //echo $_W['member']['uid'];
    $sql = "SELECT * FROM " . tablename('hospital_intro');
    $index = pdo_fetch($sql);
    template('hospital/index/brief');
} elseif($do == 'famous'){
    $doctors = pdo_fetchall("SELECT * FROM " . tablename('doctor'));
    template('hospital/index/doctor');
} elseif($do == 'visits'){
    $id = intval(isset($_GPC['id']) ? $_GPC['id'] : 0);
    if($id == 0){
        $date = array();
        $show_date = array();
        $show_date[] = date('Y-m-d',time());
        $show_date[] = date('Y-m-d',time() + 86400);
        $show_date[] = date('Y-m-d',time() + 172800);
        $show_date[] = date('Y-m-d',time() + 259200);
        $show_date[] = date('Y-m-d',time() + 345600);
        $show_date[] = date('Y-m-d',time() + 432000);
        $show_date[] = date('Y-m-d',time() + 518400);
        $weekarray = array("日", "一", "二", "三", "四", "五", "六");
        $oneD = 24 * 60 * 60;
        $i = 0;
        $show_date[0] .= "周" . $weekarray[date("w", time() + $oneD * $i)];
        $show_date[1] .= "周" . $weekarray[date("w", time() + 86400 + $oneD * $i)];
        $show_date[2] .= "周" . $weekarray[date("w", time() + 172800 + $oneD * $i)];
        $show_date[3] .= "周" . $weekarray[date("w", time() + 259200 + $oneD * $i)];
        $show_date[4] .= "周" . $weekarray[date("w", time() + 345600 + $oneD * $i)];
        $show_date[5] .= "周" . $weekarray[date("w", time() + 432000 + $oneD * $i)];
        $show_date[6] .= "周" . $weekarray[date("w", time() + 518400 + $oneD * $i)];

        $date[] = date('m-d',time());
        $date[] = date('m-d',time() + 86400);
        $date[] = date('m-d',time() + 172800);
        $date[] = date('m-d',time() + 259200);
        $date[] = date('m-d',time() + 345600);
        $date[] = date('m-d',time() + 432000);
        $date[] = date('m-d',time() + 518400);
        $visitations = array();
        for($j = 0; $j < 7; $j++){
            $visitations[] = pdo_fetchall("SELECT * FROM " . tablename('visitation_info') . " WHERE order_date = '" . $date[$j] . "'");
        }
        template('hospital/index/visits');
    } if($id == 1){
        $soso = isset($_POST['soso']) ? $_POST['soso'] : '';
        $date = array();
        $show_date = array();
        $show_date[] = date('Y-m-d',time());
        $show_date[] = date('Y-m-d',time() + 86400);
        $show_date[] = date('Y-m-d',time() + 172800);
        $show_date[] = date('Y-m-d',time() + 259200);
        $show_date[] = date('Y-m-d',time() + 345600);
        $show_date[] = date('Y-m-d',time() + 432000);
        $show_date[] = date('Y-m-d',time() + 518400);
        $weekarray = array("日", "一", "二", "三", "四", "五", "六");
        $oneD = 24 * 60 * 60;
        $i = 0;
        $show_date[0] .= "周" . $weekarray[date("w", $time + $oneD * $i)];
        $show_date[1] .= "周" . $weekarray[date("w", time() + 86400 + $oneD * $i)];
        $show_date[2] .= "周" . $weekarray[date("w", time() + 172800 + $oneD * $i)];
        $show_date[3] .= "周" . $weekarray[date("w", time() + 259200 + $oneD * $i)];
        $show_date[4] .= "周" . $weekarray[date("w", time() + 345600 + $oneD * $i)];
        $show_date[5] .= "周" . $weekarray[date("w", time() + 432000 + $oneD * $i)];
        $show_date[6] .= "周" . $weekarray[date("w", time() + 518400 + $oneD * $i)];

        $date[] = date('m-d',time());
        $date[] = date('m-d',time() + 86400);
        $date[] = date('m-d',time() + 172800);
        $date[] = date('m-d',time() + 259200);
        $date[] = date('m-d',time() + 345600);
        $date[] = date('m-d',time() + 432000);
        $date[] = date('m-d',time() + 518400);
        $visitations1 = array();
        $visitations = array();

        if($soso == ''){
            for($j = 0; $j < 7; $j++){
                $visitations[] = pdo_fetchall("SELECT * FROM " . tablename('visitation_info') . " WHERE order_date = '" . $date[$j] . "'");
            }
        } else {
            $section = pdo_fetch("SELECT * FROM " . tablename('section_office') . " WHERE name like '%" . $soso . "%'");

            if($section['id']){
                for($j = 0; $j < 7; $j++){
                    $visitations1[$j] = pdo_fetchall("SELECT * FROM " . tablename('visitation_info') . " WHERE order_date = '" . $date[$j] . "'");
                    foreach($visitations1[$j] as $visitation){
                        $doctor = pdo_fetch("SELECT * FROM " . tablename('doctor') . " WHERE id = " . $visitation['doctor_id']);
                        if($section['id'] == $doctor['section_id']){
                            $visitations[$j][] = $visitation;
                        }
                    }
                }
            }
        }
        template('hospital/index/visits');
    }
} elseif($do == 'cultural'){
    template('hospital/index/cultural');
}