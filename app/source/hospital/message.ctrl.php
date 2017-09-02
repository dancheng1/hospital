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


if($do == 'list'){
    $openid = $_GPC['openid'];
    $text = $_GPC['text'];
    $fuyou_wx = pdo_fetch("SELECT * FROM ".tablename('account_wechats')." where acid = 2");
    $appid = $fuyou_wx['key'];
    $secret = $fuyou_wx['secret'];
    $access_token = get_token($appid, $secret);
    echo $appid . '<br/>' . $secret . '<br/>' . $access_token;
    sendText($access_token, $openid, $text);
}

//获取token
function get_token($appid, $secret){
    $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$appid}&secret={$secret}";
    $json = https_request($url);
    $arr = json_decode($json, true);
    return $arr['access_token'];
}

//客服向用户发送文本
function sendText($access_token,$openid, $text){
    $url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token={$access_token}";
    $textarr = array("touser"=>$openid, "msgtype"=>"text", "text"=>array("content"=>$text));
    $jsontext = my_json_encode("text", $textarr);
    $result = https_request($url, $jsontext);
}


//请求接口   通过http  中的get 或 post
function httpRequest($url){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $output = curl_exec($ch);
    curl_close($ch);
    if($output == false){
        return "cURL Error:" . curl_error($ch);
    }
    return $output;
}
//请求接口   通过https 中的get 或 post
function https_request($url, $data=null){
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
    if(!empty($data)){
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    //执行并获取HTML文档内容
    $output = curl_exec($curl);
    //释放curl句柄
    curl_close($curl);
    return $output;
}

function my_json_encode($type, $p){
    if(PHP_VERSION >= '5.4'){
        $str = json_encode($p, JSON_UNESCAPED_SLASHES|JSON_UNESCAPED_UNICODE);
    } else {
        switch($type){
            case 'text':
                isset($p['text']['content']) && ($p['text']['content'] = urlencode($p['text']['content']));
                break;
        }
        $str = urldecode(json_encode($p));
    }
    return $str;
}