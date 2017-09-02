<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>

<style>

    .label{line-height: 1.8}

</style>


<ul class="nav nav-tabs">

    <li <?php  if($do == 'list') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management/list')?>">档案列表</a></li>

    <li <?php  if($do == 'edit') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management/list')?>">查看档案</a></li>

</ul>

<?php  if($do=='list') { ?>

<div class="panel panel-info">
    <div class="panel-heading">筛选</div>
    <div class="panel-body">
        <form action="./index.php" method="get" class="form-horizontal" role="form">
            <input type="hidden" name="c" value="hospital">
            <input type="hidden" name="a" value="management">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">姓名</label>
                <div class="col-sm-6 col-md-8 col-lg-8 col-xs-12">
                    <input type="text" class="form-control" name="name" value="<?php  echo $_GPC['username'];?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">类别</label>
                <div class="col-sm-6 col-md-8 col-lg-8 col-xs-12">
                    <select name="typeid" class="form-control">
                        <option value="" selected="selected">不限</option>
                        <?php  foreach($archive_type_sons as $archive_type_son){ ?>
                            <option value="<?php  echo $archive_type_son['id']; ?>" <?php  if($archive_type_son['id'] == $_GPC['typeid']) echo 'selected="selected"' ?>><?php  echo $archive_type_son['typeName']; ?></option>
                        <?php  } ?>
                    </select>
                </div>
                <div class="pull-right col-xs-12 col-sm-3 col-md-2 col-lg-2">
                    <button class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
                </div>
            </div>
        </form>
    </div>
</div>
<form method="post" class="form-horizontal" action="./index.php?c=hospital&a=management&do=list&page=<?php  echo $pindex;?>" id="form2">
    <div class="panel panel-default ">
        <div class="table-responsive panel-body">
            <table class="table table-hover">
                <input type="hidden" name="do" value="del" />
                <thead class="navbar-inner">
                <tr>
                    <th style="width:5%;">删?</th>
                    <th style="width:10%;">姓名</th>
                    <th style="min-width:30%;">手机</th>
                    <th style="min-width:30%;">用户名称</th>
                    <th style="min-width:30%;">类别</th>
                    <th style="min-width:30%;">病情类型</th>
                    <th style="width:10%;">是否提醒</th>
                    <th style="width:10%;text-align:right">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php  if(is_array($managements)) { foreach($managements as $li) { ?>
                <tr>
                    <td><input type="checkbox" name="ssid[]" value="<?php  echo $li['id'];?>" class=""></td>
                    <td><?php  echo $li['name'];?></td>
                    <td><?php  echo $li['phone'];?></td>
                    <td>
                        <?php 
                         $sect = pdo_fetch("SELECT * FROM ".tablename('mc_members')." where uid = ".$li['ownerId']);
                         echo $sect['nickname'];
                        ?>
                    </td>
                    <td>
                        <?php 
                            $arch = pdo_fetch("SELECT * FROM ".tablename('archive_type')." where id = ".$li['type']);
                            echo $arch['typeName'];
                        ?>
                    </td>
                    <td>
                        <?php 
                            $type_son = pdo_fetch("SELECT * FROM ".tablename('archive_type_son')." where id = ".$li['type_son']);
                            echo $type_son['name'];
                        ?>
                    </td>
                    <td><?php  if($li['flag'] == 1) echo '是'; else echo '否'; ?></td>
                    <td class="text-right" style="overflow:visible;">
                        <div class="btn-group">
                            <a href="<?php  echo url('hospital/management/edit',array('id' => $li['id']))?>" title="编辑" class="btn btn-success">查看</a>
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
            if($(":checkbox[name='ssid[]']:checked").size() > 0){
                return confirm('删除后不可恢复，您确定删除吗？');
            }
            util.message('没有选择医生', '', 'error');
            return false;
        });
    });
</script>

<?php  } ?>

<?php  if($do=='edit') { ?>

<form action="./index.php?c=hospital&a=management&do=list&pd=update&page=<?php  echo $page;?>" method="post" class="form-horizontal" role="form" id="form12" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">档案详情</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">姓名</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="<?php  if(isset($management)) { ?><?php  echo $management['name'];?><?php  } ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机号</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="phone" value="<?php  if(isset($management)) { ?><?php  echo $management['phone'];?><?php  } ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">用户名</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="phone" value="<?php  if(isset($management)) { ?><?php  echo $management['ownerId'];?><?php  } ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">类别</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="phone" value="<?php  if(isset($management)) echo $arch111['typeName']; ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">病情类型</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="phone" value="<?php  if(isset($management)) echo $type_son111['name']; ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">身份证号码</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="intro" value="<?php  if(isset($management)) { ?><?php  echo $management['id_number'];?><?php  } ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">所处时间段</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="intro" value="<?php  if(isset($management)) { ?><?php  echo $management['date'];?><?php  } ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">建档时间</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="intro" value="<?php  if(isset($management)) { ?><?php  echo date('Y-m-d H:i:s', $management['stage_date']) ?><?php  } ?>" class="form-control" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">描述</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="intro" value="<?php  if(isset($management)) { ?><?php  echo $management['content'];?><?php  } ?>" class="form-control" disabled/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="hidden" name="id" value="<?php  echo $doctor['id'];?>"/>
            <input type="submit" value="返回" class="btn btn-primary"/>
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

<?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/footer', TEMPLATE_INCLUDEPATH)) : (include template('common/footer', TEMPLATE_INCLUDEPATH));?>

