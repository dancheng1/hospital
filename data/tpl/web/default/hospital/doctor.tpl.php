<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>

<style>

    .label{line-height: 1.8}

</style>


<ul class="nav nav-tabs">

    <li <?php  if($do == 'list' || $do == 'update') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/doctor/list')?>">医生列表</a></li>

    <li <?php  if($do == 'add') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/doctor/add', array('page' => $pindex));?>">添加医生</a></li>

</ul>

<?php  if($do=='list') { ?>

<div class="panel panel-info">
    <div class="panel-heading">筛选</div>
    <div class="panel-body">
        <form action="./index.php" method="get" class="form-horizontal" role="form">
            <input type="hidden" name="c" value="hospital">
            <input type="hidden" name="a" value="doctor">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">医生编号</label>
                <div class="col-sm-6 col-md-8 col-lg-8 col-xs-12">
                    <input type="text" class="form-control" name="id" value="<?php  echo $_GPC['id'];?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">姓名</label>
                <div class="col-sm-6 col-md-8 col-lg-8 col-xs-12">
                    <input type="text" class="form-control" name="username" value="<?php  echo $_GPC['username'];?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">职位</label>
                <div class="col-sm-6 col-md-8 col-lg-8 col-xs-12">
                    <select name="level" class="form-control">
                        <option value="" selected="selected">不限</option>
                        <option value="1" <?php  if(1 == $_GPC['level']) { ?> selected="selected"<?php  } ?>>教授</option>
                        <option value="2" <?php  if(2 == $_GPC['level']) { ?> selected="selected"<?php  } ?>>副教授</option>
                        <option value="3" <?php  if(3 == $_GPC['level']) { ?> selected="selected"<?php  } ?>>主任医生</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">科室</label>
                <div class="col-sm-6 col-md-8 col-lg-8 col-xs-12">
                    <select name="sectionid" class="form-control">
                        <option value="" selected="selected">不限</option>
                        <?php  if(is_array($sections)) { foreach($sections as $section) { ?>
                        <option value="<?php  echo $section['id'];?>"<?php  if($section['id'] == $_GPC['sectionid']) { ?> selected="selected"<?php  } ?>><?php  echo $section['name'];?></option>
                        <?php  } } ?>
                    </select>
                </div>
                <div class="pull-right col-xs-12 col-sm-3 col-md-2 col-lg-2">
                    <button class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
                </div>
            </div>
        </form>
    </div>
</div>
<form method="post" class="form-horizontal" action="./index.php?c=hospital&a=doctor&do=list&pd=del&page=<?php  echo $pindex;?>" id="form2">
    <div class="panel panel-default ">
        <div class="table-responsive panel-body">
            <table class="table table-hover">
                <input type="hidden" name="do" value="del" />
                <thead class="navbar-inner">
                <tr>
                    <th style="width:5%;">删?</th>
                    <th style="width:10%;">医生编号</th>
                    <th style="width:10%;">头像</th>
                    <th style="width:15%;">医生姓名</th>
                    <th style="min-width:30%;">手机</th>
                    <th style="min-width:30%;">科室</th>
                    <th style="min-width:30%;">职位</th>
                    <th style="width:20%;text-align:right">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php  if(is_array($doctors)) { foreach($doctors as $li) { ?>
                <tr>
                    <td><input type="checkbox" name="id[]" value="<?php  echo $li['id'];?>" class=""></td>
                    <td><?php  echo $li['id'];?></td>
                    <td><img src="<?php  if(!(!isset($li['img_url']) || $li['img_url'] == '')) { ?><?php  echo $li['img_url'];?><?php  } ?>" style="height: 20px; height: 20px"></td>
                    <td>
                        <?php  echo $li['name'];?>
                    </td>
                    <td><?php  echo $li['phone'];?></td>
                    <td>
                        <?php 
                         $sect = pdo_fetch("SELECT * FROM ".tablename('section_office')." where id = ".$li['section_id']);
                         echo $sect['name'];
                        ?>
                    </td>
                    <td>
                        <?php 
                            switch($li['level']){
                                case 1:
                                    echo '教授';
                                    break;
                                case 2:
                                    echo '副教授';
                                    break;
                                case 3:
                                    echo '主任医生';
                                    break;
                            }
                        ?>
                    </td>
                    <td class="text-right" style="overflow:visible;">
                        <div class="btn-group">
                            <a href="<?php  echo url('hospital/doctor/update',array('id' => $li['id'], 'page' => $pindex))?>" title="编辑" class="btn btn-success">编辑</a>
                        </div>
                    </td>
                </tr>
                <?php  } } ?>
                <tr>
                    <td><input type="checkbox" name="" onclick="var ck = this.checked;$(':checkbox').each(function(){this.checked = ck});"></td>
                    <td colspan="7">
                        <input type="submit" name="submit" class="btn btn-primary" value="删除">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <?php  echo $pager;?>
</form>

<script>
    require(['trade', 'bootstrap'], function(trade){
        trade.init();
        $('#form2').submit(function(){
            if($(":checkbox[name='id[]']:checked").size() > 0){
                return confirm('删除后不可恢复，您确定删除吗？');
            }
            util.message('没有选择医生', '', 'error');
            return false;
        });
    });
</script>

<?php  } ?>

<?php  if($do=='update') { ?>

<form action="./index.php?c=hospital&a=doctor&do=list&pd=update&page=<?php  echo $page;?>" method="post" class="form-horizontal" role="form" id="form12" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">修改医生信息</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">头像</label>
                <div class="col-sm-9 col-xs-12">
                    <img src="<?php  if(!(!isset($doctor['img_url']) || $doctor['img_url'] == '')) { ?><?php  echo $doctor['img_url'];?><?php  } ?>" style="height: 100px; height: 100px">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">修改头像</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="file" name="img_url">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">医生姓名</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="<?php  if(isset($doctor)) { ?><?php  echo $doctor['name'];?><?php  } ?>" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机号</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="phone" value="<?php  if(isset($doctor)) { ?><?php  echo $doctor['phone'];?><?php  } ?>" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">科室</label>
                <div class="col-sm-9 col-xs-12">
                    <select name="sectionid" class="form-control">
                        <!--<option value="" selected="selected">不限</option>-->
                        <?php  if(is_array($sections)) { foreach($sections as $section) { ?>
                        <option value="<?php  echo $section['id'];?>" <?php  if(isset($doctor) && $section['id'] == $doctor['section_id']) { ?>selected="selected"<?php  } ?>><?php  echo $section['name'];?></option>
                        <?php  } } ?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">职位</label>
                <div class="col-sm-9 col-xs-12">
                    <select name="level" class="form-control">
                        <option value="1" <?php  if(isset($doctor) && 1 == $doctor['level']) { ?>selected="selected"<?php  } ?>>教授</option>
                        <option value="2" <?php  if(isset($doctor) && 2 == $doctor['level']) { ?>selected="selected"<?php  } ?>>副教授</option>
                        <option value="3" <?php  if(isset($doctor) && 3 == $doctor['level']) { ?>selected="selected"<?php  } ?>>主任医生</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">医生介绍</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="intro" value="<?php  if(isset($doctor)) { ?><?php  echo $doctor['intro'];?><?php  } ?>" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="hidden" name="id" value="<?php  echo $doctor['id'];?>"/>
            <input type="submit" value="提交" class="btn btn-primary"/>
        </div>
    </div>
</form>

<script>
    require(['validator'], function($){
        $(function(){
            $('#form12').bootstrapValidator({
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: '姓名不能为空'
                            }
                        }
                    },
                    phone: {
                        validators: {
                            notEmpty: {
                                message: '手机不能为空'
                            },
                            regexp: {
                                regexp: /1\d{10}/,
                                message: '手机号格式不正确'
                            }
                        }
                    }
                }
            });
        });
    });
</script>
<?php  } ?>
<?php  if($do == 'add') { ?>

<form action="./index.php?c=hospital&a=doctor&do=list&pd=add&page=<?php  echo $page;?>" method="post" class="form-horizontal" role="form" id="form1" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">添加医生</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">头像</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="file" name="img_url">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">医生姓名</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机号</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="phone" value="" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">科室</label>
                <div class="col-sm-9 col-xs-12">
                    <select name="sectionid" class="form-control">
                        <!--<option value="" selected="selected">不限</option>-->
                        <?php  if(is_array($sections)) { foreach($sections as $section) { ?>
                        <option value="<?php  echo $section['id'];?>"><?php  echo $section['name'];?></option>
                        <?php  } } ?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">职位</label>
                <div class="col-sm-9 col-xs-12">
                    <select name="level" class="form-control">
                        <option value="1">教授</option>
                        <option value="2">副教授</option>
                        <option value="3">主任医生</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">医生介绍</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="intro" value="" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="submit" value="提交" class="btn btn-primary"/>
        </div>
    </div>
</form>

<script>
    require(['validator'], function($){
        $(function(){
            $('#form1').bootstrapValidator({
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: '姓名不能为空'
                            }
                        }
                    },
                    phone: {
                        validators: {
                            notEmpty: {
                                message: '手机不能为空'
                            },
                            regexp: {
                                regexp: /1\d{10}/,
                                message: '手机号格式不正确'
                            }
                        }
                    }
                }
            });
        });
    });
</script>
<?php  } ?>

<?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/footer', TEMPLATE_INCLUDEPATH)) : (include template('common/footer', TEMPLATE_INCLUDEPATH));?>

