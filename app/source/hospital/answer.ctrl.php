<?php
/**
 * Created by PhpStorm.
 * User: dancheng
 * Date: 2017/8/15
 * Time: 10:50
 */
defined('IN_IA') or exit('Access Denied');
$do = in_array($do, array('list')) ? $do : 'list';
load()->model('site');
load()->model('mc');
checkauth();
if($do == 'list'){
    $id = intval(isset($_GPC['id']) ? $_GPC['id'] : 0);
    if($id == 0){
        $where = '';
        if($_POST){
            if($_GPC['pd'] == 'add'){
                $data['title'] = trim($_POST['title']);
                $data['question'] = trim($_POST['question']);
                pdo_insert('user_qustion', $data);
            }
            if($_GPC['pd'] == 'soso'){
                $sousuo = trim($_POST['sousuo']);
                $where .= " where title = '" . $sousuo . "'";
            }
        }
        $qustions = pdo_fetchall("SELECT * FROM " . tablename('user_qustion') . $where);
        template('hospital/answer/answerjd');
    } if($id == 1){
        $sousuo = '';
        if($_POST){
            $sousuo = trim($_POST['sousuo']);
        }
        template('hospital/answer/answer');
    } if($id == 2){
        $sousuo = '';
        if($_POST){
            $sousuo = trim($_POST['sousuo']);
        }
        template('hospital/answer/answerjy');
    } if($id == 3){
        $sousuo = '';
        if($_POST){
            $sousuo = trim($_POST['sousuo']);
        }
        $qustions = pdo_fetchall("SELECT * FROM " . tablename('user_qustion') . $where);
        template('hospital/answer/answerjd');
    } if($id == 4){
        $where = isset($_GPC['sousuo']) ? " and title like '%" . $_GPC['sousuo'] . "%'" : '';
        $pindex = max(1, intval($_GPC['page']));
        $psize = max(3, intval($_GPC['psize']));
        $site_articles1 = pdo_fetchall("SELECT * FROM ".tablename('site_article')." where pcate = 1 " . $where . " order by createtime desc LIMIT " . ($pindex - 1) * $psize . "," . $psize);
        echo json_encode($site_articles1);
    } if($id == 5){
        $where = isset($_GPC['sousuo']) ? " and title like '%" . $_GPC['sousuo'] . "%'" : '';
        $pindex = max(1, intval($_GPC['page']));
        $psize = max(3, intval($_GPC['psize']));
        $site_articles2 = pdo_fetchall("SELECT * FROM ".tablename('site_article')."  where pcate = 2 " . $where . " order by createtime desc LIMIT " . ($pindex - 1) * $psize . "," . $psize);
        echo json_encode($site_articles2);
    } if($id == 6){
        $where = isset($_GPC['sousuo']) ? " where title like '%" . $_GPC['sousuo'] . "%'" : '';
        $pindex = max(1, intval($_GPC['page']));
        $psize = max(3, intval($_GPC['psize']));
        $qustions = pdo_fetchall("SELECT * FROM ".tablename('user_qustion') . $where . " order by id desc LIMIT " . ($pindex - 1) * $psize . "," . $psize);
        echo json_encode($qustions);
    } if($id == 7){
        $pid = $_POST['pid'];
        $answer = pdo_fetch("SELECT * FROM " . tablename('doctor_answer') . " where questionId = " . $pid);
        echo json_encode($answer['ansuer']);
    } if($id == 8){
        template('hospital/answer/answer_add');
    }
}
