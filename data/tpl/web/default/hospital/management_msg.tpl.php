<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>

<style>

    .label{line-height: 1.8}

</style>


<ul class="nav nav-tabs">
    <?php  if($do == 'list') { ?><li><a href="<?php  echo url('hospital/management_type/son_type', array('id' => $parent_id))?>">病情类型列表</a></li><?php  } ?>

    <li <?php  if($do == 'list') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management_msg/list', array('id' => $id, 'parent_id' => $parent_id))?>">消息推送模板列表</a></li>

    <li <?php  if($do == 'add') { ?>class="active"<?php  } ?>><a href="<?php  echo url('hospital/management_msg/add', array('id' => $id, 'parent_id' => $parent_id))?>">添加消息推送模板</a></li>

</ul>

<?php  if($do=='list') { ?>

<div class="panel panel-info">
    <div class="panel-heading">筛选</div>
</div>
<form method="post" class="form-horizontal" action="./index.php?c=hospital&a=management_msg&do=list&pd=del&id=<?php  echo $id; ?>&parent_id=<?php  echo $parent_id; ?>" id="form2">
    <div class="panel panel-default ">
        <div class="table-responsive panel-body">
            <table class="table table-hover">
                <input type="hidden" name="do" value="del" />
                <thead class="navbar-inner">
                <tr>
                    <th style="width:5%;">删?</th>
                    <th style="width:20%;">名称</th>
                    <th style="min-width:10%;">间隔时间</th>
                    <th style="min-width:50%;">推送信息</th>
                    <th style="width:20%;text-align:right">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php  foreach($archive_msgs as $archive_msg){ ?>
                <tr>
                    <td><input type="checkbox" name="ssid[]" value="<?php  echo $archive_msg['id']; ?>" class=""></td>
                    <td><?php  echo $archive_msg['name']; ?></td>
                    <td>
                        <?php  if(isset($archive_msg['daytime']) && $archive_msg['daytime'] != 0) echo $archive_msg['daytime'] . '天'; ?>
                        <?php  if(isset($archive_msg['monthtime']) && $archive_msg['monthtime']!= 0) echo $archive_msg['monthtime'] . '月'; ?></td>
                    </td>
                    <td>
                        <?php  echo $archive_msg['pushmsg']; ?>
                    </td>
                    <td class="text-right" style="overflow:visible;">
                        <div class="btn-group">
                            <a href="<?php  echo url('hospital/management_msg/update',array('msg_id' => $archive_msg['id'], 'parent_id' => $parent_id, 'id' => $id))?>" title="修改" class="btn btn-success">修改</a>
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
            util.message('没有选择消息模板', '', 'error');
            return false;
        });
    });
</script>

<?php  } ?>

<?php  if($do=='update') { ?>

<form action="./index.php?c=hospital&a=management_msg&do=list&pd=update&id=<?php  echo $id ?>&parent_id=<?php  echo $parent_id; ?>" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">修改消息模板</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">名称</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="<?php  if($archive_msg) echo $archive_msg['name']; ?>" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">推送间隔时间</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="daytime" value="<?php  if($archive_msg) if(isset($archive_msg['daytime']) && $archive_msg['daytime'] != 0) echo $archive_msg['daytime']; ?>" class="form-control"/>天
                    <input type="text" name="monthtime" value="<?php  if($archive_msg) if(isset($archive_msg['monthtime']) && $archive_msg['monthtime'] != 0) echo $archive_msg['monthtime']; ?>" class="form-control"/>月
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">推送消息</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="pushmsg" value="<?php  if($archive_msg) echo $archive_msg['pushmsg']; ?>" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="hidden" name="msg_id" value="<?php  echo $msg_id; ?>"/>
            <input type="submit" value="提交" class="btn btn-primary"/>
        </div>
    </div>
</form>

<?php  } ?>

<?php  if($do=='add') { ?>

<form action="./index.php?c=hospital&a=management_msg&do=list&pd=add&id=<?php  echo $id ?>&parent_id=<?php  echo $parent_id; ?>" method="post" class="form-horizontal" role="form" id="form12" enctype="multipart/form-data">
    <div class="panel panel-info">
        <div class="panel-heading">添加消息推送模板</div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">名称</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="name" value="" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">推送间隔时间</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="daytime" value="" class="form-control"/>天
                    <input type="text" name="monthtime" value="" class="form-control"/>月
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">推送消息</label>
                <div class="col-sm-9 col-xs-12">
                    <input type="text" name="pushmsg" value="" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-9 col-xs-12">
            <input type="hidden" name="typeId" value="<?php  echo $id; ?>"/>
            <input type="submit" value="提交" class="btn btn-primary"/>
        </div>
    </div>
</form>
<?php  } ?>
<?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/footer', TEMPLATE_INCLUDEPATH)) : (include template('common/footer', TEMPLATE_INCLUDEPATH));?>

