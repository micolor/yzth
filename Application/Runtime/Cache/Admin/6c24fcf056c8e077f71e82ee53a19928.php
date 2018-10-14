<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
  <link rel="shortcut icon" href="favicon.ico">
<link href="/statics/Hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/statics/Hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="/statics/Hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/statics/Hplus/css/animate.css" rel="stylesheet">
<link href="/statics/Hplus/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5><?php if($detail['adp_id'] != null): ?>修改<?php else: ?>添加<?php endif; ?>广告位</h5>
          <div class="ibox-tools">
            <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
              <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
              <li><a href="<?php echo U('Adp/index');?>">返回广告位管理</a>
              </li>
              </li>
            </ul>
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <div style="display: block;" class="ibox-content">
          <form novalidate="novalidate" class="form-horizontal m-t" id="myform" action="" method="post">
            <div class="form-group">
              <label class="col-sm-2 control-label">广告位名称</label>
              <div class="col-sm-10  control">
                <input type="text" name="adp_name" class="form-control" id="adp_name" value="<?php echo ($detail["adp_name"]); ?>">
              </div>
            </div>
            <div class="hr-line-dashed"></div>

            <div class="form-group">
              <label class="col-sm-2 control-label">广告位宽度</label>
              <div class="col-sm-10  control">
                <input type="text" name="adp_width" value="<?php echo ($detail["adp_width"]); ?>" id="adp_width" class="form-control" placeholder="如：数字 160">
              </div>
            </div>
            <div class="hr-line-dashed"></div>

            <div class="form-group">
              <label class="col-sm-2 control-label">广告位高度</label>
              <div class="col-sm-10  control">
                <input type="text" name="adp_height" value="<?php echo ($detail["adp_height"]); ?>" id="adp_height" class="form-control" placeholder="如：数字 160">
              </div>
            </div>
            <div class="hr-line-dashed"></div>

            <div class="form-group">
              <label class="col-sm-2 control-label">显示数目</label>
              <div class="col-sm-10  control">
                <input type="text" name="adp_num" value="<?php echo ($detail["adp_num"]); ?>" id="adp_num" class="form-control" placeholder="如：数字 1">
              </div>
            </div>
            <div class="hr-line-dashed"></div>

            <div class="form-group">
              <label class="col-sm-2 control-label">广告位描述</label>
              <div class="col-sm-10  control">
                <textarea id="adp_desc" name="adp_desc" class="form-control" rows="2" cols="20"><?php echo ($detail["adp_desc"]); ?></textarea>
              </div>
            </div>
            <div class="hr-line-dashed"></div>

            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-2">
                <input type="hidden" name="adp_id" value="<?php echo ($detail["adp_id"]); ?>" />
                <input name="dosubmit" type="submit" value="提交"  class="btn btn-primary" id="dosubmit">
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
<!-- 自定义js -->
<script src="/statics/Hplus/js/content.js?v=1.0.0"></script>
<!-- jQuery Validation plugin javascript-->
<script src="/statics/Hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/statics/Hplus/js/plugins/validate/messages_zh.min.js"></script>
<!-- iCheck -->
<script src="/statics/Hplus/js/plugins/iCheck/icheck.min.js"></script>
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
<script>
  $.validator.setDefaults({
    highlight: function (element) {
      $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function (element) {
      element.closest('.form-group').removeClass('has-error').addClass('has-success');
    },
    errorElement: "span",
    errorPlacement: function (error, element) {
      if (element.is(":radio") || element.is(":checkbox")) {
        error.appendTo(element.parent().parent().parent());
      } else {
        error.appendTo(element.parent());
      }
    },
    errorClass: "help-block m-b-none",
    validClass: "help-block m-b-none"
  });

  // 正整数验证
  jQuery.validator.addMethod("isBiggerThanZero", function(value, element) {
    return this.optional(element) || /^[1-9]\d*$/.test(value);
  }, "只能输入正整数");

  $(function () {
// validate signup form on keyup and submit
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#myform").validate({
      rules: {
        adp_name:{
          required: true,
          minlength: 1
        },
        adp_width:{
          required: true,
          isBiggerThanZero: true
        },
        adp_height:{
          required: true,
          isBiggerThanZero: true
        },
        adp_num:{
          required: true,
          isBiggerThanZero: true
        }
      },
      messages: {
        adp_name:{
          required: icon + "请输入广告位名称",
          minlength: icon + "广告位不能为空"
        },
        adp_width: {
          required: icon + "请输入广告位宽度",
          isBiggerThanZero: icon + "必须输入正整数"
        },
        adp_height: {
          required: icon + "请输入广告位高度",
          isBiggerThanZero: icon + "必须输入正整数"
        },
        adp_num: {
          required: icon + "请输入显示数目",
          isBiggerThanZero: icon + "必须输入正整数"
        }
      }
    });

  });



</script>