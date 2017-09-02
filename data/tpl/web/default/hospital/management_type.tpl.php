<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>

<style>

    .label{line-height: 1.8}

</style>


<ul class="nav nav-tabs">

    <?php  if($do == 'list' || $do == 'add' || $do == 'son_type') { ?><li <?php  if($do == 'list') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management_type/list')?>">档案类型列表</a></li><?php  } ?>
    <?php  if($do == 'list' || $do == 'add') { ?><li <?php  if($do == 'add') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management_type/add')?>">添加档案类型</a></li><?php  } ?>

    <?php  if($do == 'son_type' || $do == 'add_son_type' || $do == 'update_son_type') { ?><li <?php  if($do == 'son_type') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management_type/son_type', array('id' => $id))?>">病情类型列表</a></li><?php  } ?>
    <?php  if($do == 'son_type' || $do == 'add_son_type') { ?><li <?php  if($do == 'add_son_type') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management_type/add_son_type', array('id' => $id))?>">添加病情类型</a></li><?php  } ?>

</ul>

<?php  if($do=='list') { ?>

<div class="panel panel-info">
    <div class="panel-heading">档案类型列表</div>
</div>
<form method="post" class="form-horizontal" action="./index.php?c=hospital&a=management_type&do=list&pd=del&page=<?php  echo $pindex;?>" id="form2">
    <div class="panel panel-default ">
        <div class="table-responsive panel-body">
            <table class="table table-hover">
                <input type="hidden" name="do" value="del" />
                <thead class="navbar-inner">
                <tr>
                    <th style="width:5%;">删?</th>
                    <th style="width:20%;">名称</th>
                    <th style="width:20%;text-align:right">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php  foreach($archive_types as $archive_type){ ?>
                <tr>
                    <td><input type="checkbox" name="ssid[]" value="<?php  echo $archive_type['id']; ?>" class=""></td>
                    <td><?php  echo $archive_type['typeName']; ?></td>
                    <td class="text-right" style="overflow:visible;">
                        <div class="btn-group">
                            <a href="<?php  echo url('hospital/management_type/son_type',array('id' => $archive_type['id']))?>" title="详情" class="btn btn-success">详情</a>
                        </div>
                        <div class="btn-group">
                            <a href="<?php  echo url('hospital/management_type/update',array('id' => $archive_type['id']))?>" title="修改" class="btn btn-success">修改</a>
                        </div>
                    </td>
                </tr>
                <?php  } ?>
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
</form>

<script>
    require(['trade', 'bootstrap'], function(trade){
        trade.init();
        $('#form2').submit(function(){
            if($(":checkbox[name='ssid[]']:checked").size() > 0){
                return confirm('删除后不可恢复，您确定删除吗？');
            }
            util.message('没有选择类别', '', 'error');
            return false;
        });
    });
</script>

<?php  } ?>

<?php  if($do=='update') { ?>

<form action="./index.php?c=hospital&a=management_type&do=list&pd=update&page=<?php  echo $page;?>" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">修改分类</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">分类名称</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="<?php  if($archive_type) echo $archive_type['typeName']; ?>" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="hidden" name="id" value="<?php  echo $archive_type['id'];?>"/>
            <input type="submit" value="提交" class="btn btn-primary"/>
        </div>
    </div>
</form>

<?php  } ?>

<?php  if($do=='add') { ?>

<form action="./index.php?c=hospital&a=management_type&do=list&pd=add&page=<?php  echo $page;?>" method="post" class="form-horizontal" role="form" id="form12" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">添加分类</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">分类名称</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="" class="form-control"/>
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
<?php  } ?>

<?php  if($do=='son_type') { ?>

<form method="post" class="form-horizontal" action="./index.php?c=hospital&a=management_type&do=son_type&pd=del" id="form_dancheng">
    <div class="panel panel-default ">
        <div class="table-responsive panel-body">
            <table class="table table-hover">
                <input type="hidden" name="do" value="del" />
                <thead class="navbar-inner">
                <tr>
                    <th style="width:5%;">删?</th>
                    <th style="width:20%">档案类型</th>
                    <th style="width:20%;">名称</th>
                    <th style="width:20%;">是否含有推送模板</th>
                    <th style="width:20%;text-align:right">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php  foreach($archive_type_sons as $archive_type_son){ ?>
                <tr>
                    <td><input type="checkbox" name="ssid[]" value="<?php  echo $archive_type_son['id']; ?>" class=""></td>
                    <td><?php  echo $archive_type['typeName']; ?></td>
                    <td><?php  echo $archive_type_son['name']; ?></td>
                    <td>
                        <?php  $archive_msgs = pdo_fetchall("SELECT * FROM ".tablename('archive_msg') . " where typeId = " . $archive_type_son['id']);
                        if(!empty($archive_msgs)){
                            echo '有';
                        } else {
                            echo '无';
                        }
                        ?>
                    </td>
                    <td class="text-right" style="overflow:visible;">
                        <div class="btn-group">
                            <a href="<?php  echo url('hospital/management_msg/list',array('id' => $archive_type_son['id'], 'parent_id' => $id))?>" title="修改" class="btn btn-success">消息推送模板管理</a>
                        </div>
                        <div class="btn-group">
                            <a href="<?php  echo url('hospital/management_type/update_son_type',array('id' => $archive_type_son['id'], 'parent_id' => $id))?>" title="修改" class="btn btn-success">修改</a>
                        </div>
                    </td>
                </tr>
                <?php  } ?>
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
</form>

<script>
    require(['trade', 'bootstrap'], function(trade){
        trade.init();
        $('#form_dancheng').submit(function(){
            if($(":checkbox[name='ssid[]']:checked").size() > 0){
                return confirm('删除后不可恢复，您确定删除吗？');
            }
            util.message('没有选择病情类型', '', 'error');
            return false;
        });
    });
</script>

<?php  } ?>


<?php  if($do=='add_son_type') { ?>

<form action="./index.php?c=hospital&a=management_type&do=son_type&pd=add&page=<?php  echo $page;?>" method="post" class="form-horizontal" role="form" id="form1233" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">添加病情类型</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">病情类型名称</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="hidden" value="<?php  echo $id ?>" name="id">
            <input type="submit" value="提交" class="btn btn-primary"/>
        </div>
    </div>
</form>
<?php  } ?>

<?php  if($do=='update_son_type') { ?>

<form action="./index.php?c=hospital&a=management_type&do=son_type&pd=update&id=<?php  echo $parent_id ?>" method="post" class="form-horizontal" role="form" id="form1222" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">修改病情类型</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">病情类型名称</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="<?php  if($archive_type_son) echo $archive_type_son['name']; ?>" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="hidden" value="<?php  echo $sonid; ?>" name="son_id">
            <input type="submit" value="提交" class="btn btn-primary"/>
        </div>
    </div>
</form>
<?php  } ?>
<?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/footer', TEMPLATE_INCLUDEPATH)) : (include template('common/footer', TEMPLATE_INCLUDEPATH));?>

