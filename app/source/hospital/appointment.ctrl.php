<?php
/**
 * Created by PhpStorm.
 * User: dancheng
 * Date: 2017/8/15
 * Time: 9:53
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
            $doctor_id = $_POST['doctor_id'];
            $data['order_doctorId'] = $_POST['doctor_id'];
            $data['order_date'] = $_POST['order_date'];
            $data['name'] = trim($_POST['name']);
            $data['phone'] = trim($_POST['phone']);
            $data['userId'] = $_W['member']['uid'];
            $result = pdo_fetch("SELECT * FROM " . tablename('visitation_info') . " WHERE order_date = '" . $data['order_date'] . "' AND doctor_id = " . $doctor_id);
            $num = $result['registered'];
            $num++;
            $result = pdo_fetch("UPDATE " . tablename('visitation_info') . " SET registered  = " . $num . " WHERE order_date = '" . $data['order_date'] . "' AND doctor_id = " . $doctor_id);
            pdo_insert('reserve_registration', $data);
        }
        $sections = pdo_fetchall("SELECT * FROM " . tablename('section_office'));
        template('hospital/appointment/appointment');
    } else if($id == 1){
        $section_id = intval(isset($_GPC['section_id']) ? $_GPC['section_id'] : 0);
        $section = pdo_fetch("SELECT * FROM " . tablename('section_office') . "WHERE id = " . $section_id);
        $date1 = date('m-d',time());
        $date2 = date('m-d',time() + 86400);
        $date3 = date('m-d',time() + 172800);
        $date4 = date('m-d',time() + 259200);
        $date5 = date('m-d',time() + 345600);
        $date6 = date('m-d',time() + 432000);
        $date7 = date('m-d',time() + 518400);

        $doctors = pdo_fetchall("SELECT * FROM " . tablename('doctor') . "WHERE section_id = " . $section_id);
        //教授
        $professor = array();
        //副教授
        $assprofessor = array();
        //主任
        $director = array();
        foreach ($doctors as $doctor){
            $result = pdo_fetch("SELECT * FROM " . tablename('visitation_info') . "WHERE doctor_id = " . $doctor['id'] . " AND order_date = '" . $date1 . "'");
            if($result){
                switch ($doctor['level']){
                    case 1:$professor[] = $doctor;
                        break;
                    case 2:$assprofessor[] = $doctor;
                        break;
                    case 3:$director[] = $doctor;
                        break;
                }
            }
        }

        //echo $professor;
        $str = '';

        if(!($professor || $assprofessor || $director)){
            $str = '今天没有医生';
            /*echo 'dasddas';
            echo <<< DTD
                <script type="text/javascript">
                    alert(window.parent.document.getElementById("dv"));
                    window.parent.document.getElementById("dv").style.display = block;
                </script>
DTD;*/
        }


        //教授
        if($professor) {
            $str .= "<div style=' background: #abdaf0; height: 40px;line-height: 40px; padding-left: 15px;font-size: 14px;color: #fff;'>教授</div>";
        }
        $str .= "<div class='firstblock'>";
        foreach ($professor as $pro){
            $name = $pro['name'];
            $id = $pro['id'];
            $str .= "<div class='item' tapmode='presshover' onclick='sss(" . $id . ")'><img src='public/image/my_order_user_icon_normal.png' alt='' class='item_ico'>";
            $str .= "<span>" . $name . "</span>";
            $str .= "<img src='public/image/arrow.png' alt='' class='item_arrow'></div><div class='h1'></div> ";

        }
        $str .= "</div>";


        //副教授
        if($assprofessor) {
            $str .= "<div style=' background: #abdaf0; height: 40px;line-height: 40px; padding-left: 15px;font-size: 14px;color: #fff; margin-top:5px;'>副教授</div>";
        }
        $str .= "<div class='secondblock'>";
        foreach ($assprofessor as $pro){
            $name = $pro['name'];
            $id = $pro['id'];
            $str .= "<div class='item' tapmode='presshover' onclick='sss(" . $id . ")'><img src='public/image/my_favorite_user_icon_normal.png' alt='' class='item_ico'>";
            $str .= "<span>" . $name . "</span>";
            $str .= "<img src='public/image/arrow.png' alt='' class='item_arrow'></div><div class='h1'></div>";
        }
        $str .= "</div>";


        //主任
        if($director) {
            $str .= "<div style=' background: #abdaf0; height: 40px;line-height: 40px; padding-left: 15px;font-size: 14px;color: #fff; margin-top:5px;'>主任医生</div>";
        }
        $str .= "<div class='thirdblock'>";
        foreach ($director as $pro){
            $name = $pro['name'];
            $id = $pro['id'];
            $str .= "<div class='item' tapmode='presshover' onclick='sss(" . $id . ")'><img src='public/image/my_order_user_icon_normal.png' alt='' class='item_ico'>";
            $str .= "<span>" . $name . "</span>";
            $str .= "<img src='public/image/arrow.png' alt='' class='item_arrow'></div><div class='h1'></div>";
        }
        $str .= "</div>";

        template('hospital/appointment/showDoctor');
        echo <<<STR
        <script type="text/javascript">
            window.parent.document.getElementById("iframe1").innerHTML = "$str";
        </script>
STR;
    } else if($id == 2){
        $datechange = isset($_GPC['datechange']) ? $_GPC['datechange'] : '';
        $section_id = intval(isset($_GPC['section_id']) ? $_GPC['section_id'] : 1);
        $doctors = pdo_fetchall("SELECT * FROM " . tablename('doctor') . "WHERE section_id = " . $section_id);

        //教授
        $professor = array();
        //副教授
        $assprofessor = array();
        //主任
        $director = array();
        foreach ($doctors as $doctor){
            $result = pdo_fetch("SELECT * FROM " . tablename('visitation_info') . "WHERE doctor_id = " . $doctor['id'] . " AND order_date = '" . $datechange . "'");
            if($result){
                switch ($doctor['level']){
                    case 1:$professor[] = $doctor;
                        break;
                    case 2:$assprofessor[] = $doctor;
                        break;
                    case 3:$director[] = $doctor;
                        break;
                }
            }
        }

        $str = '';

        if(!($professor || $assprofessor || $director)){
/*//            $str1 = '<div style="line-height: 60px;background: url("';
//            $str2 =  'public/evaluate/images/doctor.png';
//            $str3 =  '") #fff 0.5rem center no-repeat;padding: 0.2rem 0.5rem;">今天没有出诊的医生！</div>';*/
            $str = '今天没有医生';

        }

        //教授
        if($professor) {
            $str .= "<div style=' background: #abdaf0; height: 40px;line-height: 40px; padding-left: 15px;font-size: 14px;color: #fff;'>教授</div>";
        }
        $str .= "<div class='firstblock'>";
        foreach ($professor as $pro){
            $name = $pro['name'];
            $id = $pro['id'];
            $str .= "<div class='item' tapmode='presshover' onclick='sss(" . $id . ")'><img src='public/image/my_order_user_icon_normal.png' alt='' class='item_ico'>";
            $str .= "<span>" . $name . "</span>";
            $str .= "<img src='public/image/arrow.png' alt='' class='item_arrow'></div><div class='h1'></div> ";

        }
        $str .= "</div>";


        //副教授
        if($assprofessor) {
            $str .= "<div style=' background: #abdaf0; height: 40px;line-height: 40px; padding-left: 15px;font-size: 14px;color: #fff; margin-top:5px;'>副教授</div>";
        }
        $str .= "<div class='secondblock'>";
        foreach ($assprofessor as $pro){
            $name = $pro['name'];
            $id = $pro['id'];
            $str .= "<div class='item' tapmode='presshover' onclick='sss(" . $id . ")'><img src='public/image/my_favorite_user_icon_normal.png' alt='' class='item_ico'>";
            $str .= "<span>" . $name . "</span>";
            $str .= "<img src='public/image/arrow.png' alt='' class='item_arrow'></div><div class='h1'></div>";
        }
        $str .= "</div>";


        //主任
        if($director) {
            $str .= "<div style=' background: #abdaf0; height: 40px;line-height: 40px; padding-left: 15px;font-size: 14px;color: #fff; margin-top:5px;'>主任医生</div>";
        }
        $str .= "<div class='thirdblock'>";
        foreach ($director as $pro){
            $name = $pro['name'];
            $id = $pro['id'];
            $str .= "<div class='item' tapmode='presshover' onclick='sss(" . $id . ")'><img src='public/image/my_order_user_icon_normal.png' alt='' class='item_ico'>";
            $str .= "<span>" . $name . "</span>";
            $str .= "<img src='public/image/arrow.png' alt='' class='item_arrow'></div><div class='h1'></div>";
        }
        $str .= "</div>";

        echo <<<STR
        <script type="text/javascript">
            window.parent.document.getElementById("iframe1").innerHTML = "$str";
        </script>
STR;
    } else if($id == 3){
        $doctor_id= intval(isset($_GPC['doctor_id']) ? $_GPC['doctor_id'] : 0);
        $doctor = pdo_fetch("SELECT * FROM " . tablename('doctor') . "WHERE id = " . $doctor_id);
        $section_id = $doctor['section_id'];

        $date = array();
        $date[] = date('m-d',time());
        $date[] = date('m-d',time() + 86400);
        $date[] = date('m-d',time() + 172800);
        $date[] = date('m-d',time() + 259200);
        $date[] = date('m-d',time() + 345600);
        $date[] = date('m-d',time() + 432000);
        $date[] = date('m-d',time() + 518400);

        $ffff = array();
        $flag1 = array();
        foreach ($date as $d){
            $result = pdo_fetch("SELECT * FROM " . tablename('visitation_info') . "WHERE doctor_id = " . $doctor_id . " AND order_date = '" . $d . "'");
            if($result){
                $ffff[] = $result['number'];
                $flag1[] = $result['registered'];
            } else {
                $ffff[] = 0;
                $flag1[] = 0;
            }
        }
        template('hospital/appointment/doctorById');
    } else if($id == 4){
        $time = isset($_GPC['time']) ? $_GPC['time'] : '';
        $doctor_id = intval(isset($_GPC['doctor_id']) ? $_GPC['doctor_id'] : 1);
        $doctor = pdo_fetch("SELECT * FROM " . tablename('doctor') . "WHERE id = " . $doctor_id);
        $section = pdo_fetch("SELECT * FROM " . tablename('section_office') . "WHERE id = " . $doctor['section_id']);
        template('hospital/appointment/yuyueInfo');
    }
}