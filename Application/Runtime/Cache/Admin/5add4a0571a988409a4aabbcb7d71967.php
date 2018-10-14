<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico">
<link href="/statics/Hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/statics/Hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="/statics/Hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/statics/Hplus/css/animate.css" rel="stylesheet">
<link href="/statics/Hplus/css/style.css?v=4.1.0" rel="stylesheet">

    <link rel="stylesheet" href="<?php echo ($CSS_PATH); ?>default.css"/>
    <link rel="stylesheet" href="<?php echo ($CSS_PATH); ?>prettify.css"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>联系我们</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div style="display: block;" class="ibox-content">
                    <form novalidate="novalidate" class="form-horizontal m-t" id="myform" action="" method="post">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系人</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="text" name="linkman" id="linkman" class="form-control" value="<?php echo ($info["linkman"]); ?>">
                            </div>
                            <label class="col-sm-2 control-label">手机</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="text" name="mobile" id="mobile" class="form-control" value="<?php echo ($info["mobile"]); ?>">
                            </div>
                            <label class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="text" name="phone" id="phone" class="form-control" value="<?php echo ($info["phone"]); ?>">
                            </div>
                            <label class="col-sm-2 control-label">QQ</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="text" name="qq" id="qq" class="form-control" value="<?php echo ($info["qq"]); ?>">
                            </div>
                            <label class="col-sm-2 control-label">传真</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="text" name="fax" id="fax" class="form-control" value="<?php echo ($info["fax"]); ?>">
                            </div>

                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="email" name="email" id="email" class="form-control" value="<?php echo ($info["email"]); ?>">
                            </div>
                            <label class="col-sm-2 control-label">淘宝商铺</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="text" name="tbshop" id="tbshop" class="form-control" value="<?php echo ($info["tbshop"]); ?>">
                            </div>
                            <label class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-10  control" style="margin-bottom: 20px;">
                                <input type="text" name="address" id="address" class="form-control"
                                       value="<?php echo ($info["address"]); ?>">
                            </div>
                            <div id="parterlogo">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                           style="display: block;margin-left:10px">公司二维码</label>
                                    <div class="col-sm-8">
                                        <div id="uploader">
                                            <!--用来存放item-->
                                            <div id="fileList" class="uploader-list">
                                                <?php if($info[thumb]): ?><div class="file-item thumbnail">
                                                        <img src="<?php echo ($info["thumb"]); ?>">
                                                    </div><?php endif; ?>
                                            </div>
                                            <input type="hidden" name="thumb" id="filepath" value="<?php echo ($info["thumb"]); ?>">
                                            <div id="filePicker">选择图片</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>">
                                <input name="dosubmit" type="submit" value="提交" class="btn btn-primary" id="dosubmit">
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
<link href='/Public/uploader/webuploader.css' rel='stylesheet'>
<script src="/Public/uploader/webuploader.js"></script>
<style>
    .thumbnail {
        width: 210px;
        height: 210px;
        background: #F8F8F8;
        border: 1px solid #C1C1C1;
        margin-top: 12px;
        line-height: 205px;
        text-align: center
    }

    .thumbnail img {
        width: 200px;
        height: 200px;
        margin-top: -2px;
    }
</style>
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

  $(function () {
// validate signup form on keyup and submit
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#myform").validate({
      rules: {
        address: {
          required: true,
          minlength: 1
        }
      },
      messages: {
        address: {
          required: icon + "请输入地址",
          minlength: icon + "地址不能为空"
        }
      }
    });

  });

  $(function () {
    var link_type = $("#link_type").val();
    if (link_type == 1) {
      $("#urltype_wz").addClass("checked");
      $("#urltype_wz").find("input[type=radio]").attr("checked", "");
    } else {
      $("#urltype_tp").addClass("checked");
      $("#urltype_tp").find("input[type=radio]").attr("checked", "");
      $("#parterlogo").show();
    }

    var link_static = $("#link_static").val();
    if (link_static == 1) {
      $("#static_yes").addClass("checked");
      $("#static_yes").find("input[type=radio]").attr("checked", "");
    } else {
      $("#static_no").addClass("checked");
      $("#static_no").find("input[type=radio]").attr("checked", "");
    }

    $("#urltype_wz").click(function () {
      $(this).addClass("checked");
      $(this).find("input[type=radio]").attr("checked", "checked");

      $("#urltype_tp").removeClass("checked");
      $("#urltype_tp").find("input[type=radio]").removeAttr("checked");
      $("#parterlogo").hide();
      $("#link_type").val(1);

    });

    $("#urltype_tp").click(function () {
      $(this).addClass("checked");
      $(this).find("input[type=radio]").attr("checked", "checked");

      $("#urltype_wz").removeClass("checked");
      $("#urltype_wz").find("input[type=radio]").removeAttr("checked");
      $("#parterlogo").show();
      $("#link_type").val(2);
    });

    $("#static_yes").click(function () {
      $(this).addClass("checked");
      $(this).find("input[type=radio]").attr("checked", "checked");

      $("#static_no").removeClass("checked");
      $("#static_no").find("input[type=radio]").removeAttr("checked");
      $("#link_static").val(1);
    });

    $("#static_no").click(function () {
      $(this).addClass("checked");
      $(this).find("input[type=radio]").attr("checked", "checked");

      $("#static_yes").removeClass("checked");
      $("#static_yes").find("input[type=radio]").removeAttr("checked");
      $("#link_static").val(2);
    });
  });
  var uploader = WebUploader.create({
    auto: true,
    // swf文件路径
    swf: '/Public/uploader/Uploader.swf',
    // 文件接收服务端。
    server: '/Admin/Fileuploade/ajax_upload.html',
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '#filePicker',
    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
    resize: false,
    multiple: false,
    duplicate: true,
    // 只允许选择图片文件。
    accept: {
      title: 'Images',
      extensions: 'gif,jpg,jpeg,bmp,png',
      mimeTypes: 'image/*'
    }
  });
  uploader.on('uploadSuccess', function (file, data) {
    var $li = $(
        '<div class="file-item thumbnail">' +
        '<img src="' + data.src + '">' +
        '</div>'
    )
    $("#fileList").html($li);
    $("#filepath").val(data.src);
  });
  uploader.on('uploadError', function (file) {
    alert('上传出错');
  });
</script>