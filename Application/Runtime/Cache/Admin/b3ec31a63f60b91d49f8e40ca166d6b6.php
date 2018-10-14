<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>菜单管理</title>
  <meta name="keywords" content="菜单管理">
  <meta name="description" content="菜单管理">
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
          <h5>菜单管理</h5>
          <div class="ibox-tools">
            <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
              <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
              <li><a href="<?php echo U('Menu/add');?>">添加菜单</a>
              </li>
              </li>
            </ul>
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <div class="ibox-content">
          <form name="myform"  method="post" class="J_ajaxForm" action="<?php echo U('Menu/listorders');?>">
            <div class="table-list">
              <table width="100%"  class="table table-striped">
                <thead>
                <tr>
                  <th>排序</th>
                  <th>id</th>
                  <th>菜单名称</th>
                  <th>管理操作</th>
                </tr>
                </thead>
                <tbody>
                <?php echo ($categorys); ?>
                </tbody>
              </table>
              <div class="form-actions">
                <input type="submit" class="btn btn-primary btn_submit J_ajax_submit_btn" value="排序" />
              </div>
            </div>
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
  $('#data .input-daterange').datepicker({
    keyboardNavigation: false,
    forceParse: false,
    autoclose: true
  });
</script>