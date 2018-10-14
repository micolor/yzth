<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>角色管理</title>
  <meta name="keywords" content="角色管理">
  <meta name="description" content="角色管理">
  <link rel="shortcut icon" href="favicon.ico">
<link href="/statics/Hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/statics/Hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="/statics/Hplus/css/animate.css" rel="stylesheet">
<link href="/statics/Hplus/css/style.css?v=4.1.0" rel="stylesheet">
<link href="/statics/Hplus/css/plugins/iCheck/custom.css" rel="stylesheet">

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>角色管理</h5>
          <div class="ibox-tools">
            <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
              <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
              <li><a href="<?php echo U('Rbac/roleadd');?>">添加角色</a>
              </li>
              </li>
            </ul>
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <div class="ibox-content">
          <div class="table-responsive">
            <form name="myform" action="<?php echo U("Rbac/listorders");?>" method="post">
            <table class="table table-striped">
              <thead>
              <tr>
                <th>排序</th>
                <th>ID</th>
                <th>角色名称</th>
                <th>角色描述</th>
                <th>状态</th>
                <th>管理操作</th>
              </tr>
              </thead>
              <tbody>
              <?php if(is_array($data)): foreach($data as $key=>$vo): ?><tr>
                  <td><input name='listorders[<?php echo ($vo["id"]); ?>]' type='text' size='3' value='<?php echo ($vo["listorder"]); ?>' class="form-control input-sm input-listorder"></td>
                  <td><?php echo ($vo["id"]); ?></td>
                  <td><?php echo ($vo["name"]); ?></td>
                  <td><?php echo ($vo["remark"]); ?></td>
                  <td>
                    <?php if($vo['status'] == 1): ?><font color="red">√</font>
                      <?php else: ?>
                      <font color="red">╳</font><?php endif; ?>
                  </td>
                  <td>
                    <?php if($vo['id'] == 1): ?><font color="#cccccc">权限设置</font> | <a href="<?php echo U('Management/manager',array('role_id'=>$vo['id']));?>">成员管理</a> | <font color="#cccccc">修改</font> | <font color="#cccccc">删除</font>
                      <?php else: ?>
                      <a href="<?php echo U("Rbac/authorize",array("id"=>$vo["id"]));?>">权限设置</a> | <a href="<?php echo U('Management/manager',array('role_id'=>$vo['id']));?>">成员管理</a> | <a href="<?php echo U('Rbac/roleedit',array('id'=>$vo['id']));?>">修改</a> | <a href="<?php echo U('Rbac/roledelete',array('id'=>$vo['id']));?>" onclick="Delete(this);return false;">删除</a><?php endif; ?>
                  </td>
                </tr><?php endforeach; endif; ?>
              </tbody>
            </table>
            <div class="form-actions">
              <input type="submit" class="btn btn-primary J_ajax_submit_btn" name="dosubmit" value="排序" />
            </div>
          </div>
          </form>
        </div>

      </div>
    </div>

  </div>
</div>
<!-- 全局js -->
<script src="/statics/Hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="/statics/Hplus/js/bootstrap.min.js?v=3.3.6"></script>
<!-- Peity -->
<script src="/statics/Hplus/js/plugins/peity/jquery.peity.min.js"></script>
<!-- 自定义js -->
<script src="/statics/Hplus/js/content.js?v=1.0.0"></script>
<!-- iCheck -->
<script src="/statics/Hplus/js/plugins/iCheck/icheck.min.js"></script>
<!-- Peity -->
<script src="/statics/Hplus/js/demo/peity-demo.js"></script>
<!-- layer -->
<script src="/statics/Hplus/js/plugins/layer/layer.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>

</body>
</html>
<script type="text/javascript">
  var Delete = function(t){
    if(confirm('是否确定删除?')) location.href=t;
  }
</script>