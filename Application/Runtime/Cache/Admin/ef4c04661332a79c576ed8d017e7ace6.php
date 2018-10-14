<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico">
<link href="/statics/Hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/statics/Hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="/statics/Hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/statics/Hplus/css/animate.css" rel="stylesheet">
<link href="/statics/Hplus/css/style.css?v=4.1.0" rel="stylesheet">

    <link rel="stylesheet" href="/Public/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="/Public/kindeditor/plugins/code/prettify.css"/>
    <script charset="utf-8" src="/Public/kindeditor/kindeditor-min.js"></script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>修改导师信息</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="<?php echo U('Teacher/index');?>">返回导师管理</a>
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
                            <label class="col-sm-2 control-label">导师姓名</label>
                            <div class="col-sm-10  control">
                                <input type="text" name="name" class="form-control" id="name"
                                       value="<?php echo ($detail["name"]); ?>">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div id="parterlogo">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">导师照片</label>
                                <div class="col-sm-8">
                                    <!--用来存放item-->
                                    <div id="fileList" class="uploader-list">
                                        <div class="file-item thumbnail">
                                            <?php if($detail[thumb]): ?><img src="<?php echo ($detail["thumb"]); ?>"><?php endif; ?>
                                        </div>
                                    </div>
                                    <input type="hidden" name="thumb" id="filepath" value="<?php echo ($detail["thumb"]); ?>">
                                    <div id="filePicker">选择图片</div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">导师简介</label>
                            <div class="col-sm-10 ">
                                <textarea type="text" name="tdesc" style="min-height: 100px;" class="form-control" id="tdesc"><?php echo ($detail["tdesc"]); ?></textarea>
                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                            <span style="color: #666"><br/>备注：多个 | 分开</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">导师介绍</label>
                            <div class="col-sm-10 ">
                                <textarea name='tcontent' id="tcontent"
                                          style="width:90%; height:400px; max-width:637px;resize:none;"><?php echo ($detail["tcontent"]); ?></textarea>
                                <script>
                                  KindEditor.ready(function (K) {
                                    K.create('textarea[name="tcontent"]', {
                                      autoHeightMode: true,
                                      resizeType: 1,
                                      afterCreate: function () {
                                        this.loadPlugin('autoheight');
                                      },
                                      items: ['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                                        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                                        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 'selectall',
                                        'title', 'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', '-',
                                        'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image', 'multiimage',
                                        'advtable', 'table', 'pagebreak', 'clearhtml', 'template', 'quickformat', 'link', 'unlink', 'media', 'flash']
                                    });
                                  });
                                </script>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">排序</label>
                            <div class="col-sm-10  control">
                                <input type="text" name="listorder" class="form-control" id="listorder"
                                       value="<?php echo ($detail["listorder"]); ?>">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <input type="hidden" name="id" value="<?php echo ($detail["id"]); ?>"/>
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
        width: 320px;
        background: #F8F8F8;
        border: 1px solid #C1C1C1;
        line-height: 300px;
        min-height: 320px;
        text-align: center
    }
    .thumbnail img {
        width: 300px;
        height: 300px;
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
        team_name: {
          required: true,
          minlength: 1
        },
        team_desc: {
          required: true,
          minlength: 1
        }
      },
      messages: {
        team_name: {
          required: icon + "请输入导师姓名",
          minlength: icon + "导师姓名不能为空"
        },
        team_desc: {
          required: icon + "请输入导师简介",
          minlength: icon + "导师简介不能为空"
        }
      }
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
  });
</script>