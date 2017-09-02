<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/22
 * Time: 10:44
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
        if($_GPC['pd'] == 'update'){
            $data1['ansuer'] = $_POST['answer'];
            $data['isAnswered'] = 1;
            $id = $_POST['id'];
            $user_qustion = pdo_fetch("SELECT * FROM ".tablename('user_qustion') . " where id = " . $id);
            $Count = $user_qustion['updateCount'];
            $Count++;
            $data['updateCount'] = $Count;
            $doctor_answer = pdo_fetch("SELECT * FROM ".tablename('doctor_answer') . " where questionId = " . $id);
            if($doctor_answer){
                pdo_update('doctor_answer', $data1, array('questionId' => $id));
            } else {
                $data1['questionId'] = $id;
                pdo_insert('doctor_answer', $data1);
            }
            pdo_update('user_qustion', $data, array('id' => $id));
        }
        if($_GPC['pd'] == 'del'){
            $ids = array();
            $ids = $_POST['ssid'];
            foreach($ids as $id){
                pdo_delete('user_qustion', array('id' => $id));
            }
        }
    }

    $pindex = max(1, intval($_GPC['page']));
    $psize = 8;
    $where = 'where ';
    if (!empty($_GPC['answerid'])) {
        $where .= "isAnswered = " . $_GPC['answerid'] . " and ";
    }
    $where .= $_GPC['question'] ? "title like '%" . trim($_GPC['question']) ."%' " : "title like '%%'";

    $user_qustions = pdo_fetchall("SELECT * FROM ".tablename('user_qustion')." " . $where . " LIMIT " . ($pindex - 1) * $psize . "," . $psize);
    $total = pdo_fetchcolumn("SELECT COUNT(*) FROM ".tablename('user_qustion') . " " . $where);

    $pager = pagination($total, $pindex, $psize);
} elseif ($do == 'update'){
    $page = $_GPC['page'];
    $id = $_GPC['id'];
    $user_qustion = pdo_fetch("SELECT * FROM ".tablename('user_qustion') . " where id = " . $id);
    $doctor_answer = pdo_fetch("SELECT * FROM ".tablename('doctor_answer') . " where questionId = " . $user_qustion['id']);
}
template('hospital/answer');
