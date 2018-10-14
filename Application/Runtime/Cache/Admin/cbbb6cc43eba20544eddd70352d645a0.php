<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
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
                    <h5>修改密码</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                    <div style="display: block;" class="ibox-content">
                        <form novalidate="novalidate" class="form-horizontal m-t" id="signupForm" action="" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10  control">
                                    <label class="control-label text-left"><?php echo ($User["username"]); ?></label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">E-mail</label>
                                <div class="col-sm-10  control">
                                    <label class="control-label text-left"><?php echo ($User["email"]); ?></label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">旧密码</label>
                                <div class="col-sm-10  control">
                                    <input type="password" name="password" id="password" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-10  control">
                                    <input type="password" name="new_password" id="new_password" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">重复新密码</label>
                                <div class="col-sm-10  control">
                                    <input type="password" name="new_pwdconfirm" id="new_pwdconfirm" class="form-control" >
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
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

$(function () {
// validate signup form on keyup and submit
var icon = "<i class='fa fa-times-circle'></i> ";
$("#signupForm").validate({
rules: {
password: {
required: true,
minlength: 6,
remote: {
url: "<?php echo U('Admin/Adminmanage/public_verifypass');?>",     //后台处理程序
type: "get",               //数据发送方式
dataType: "json",           //接受数据格式
    dataType: "json",           //接受数据格式
    data: {                     //要传递的数据
        password: function() {
            return $("#password").val();
        }
    }
    }
},
new_password: {
required: true,
minlength: 6,
},
new_pwdconfirm: {
    required: true,
    minlength: 6,
    equalTo: "#new_password"
}
},
messages: {
password: {
required: icon + "请输入您的密码",
minlength: icon + "密码必须5个字符以上",
remote: icon + "密码输入有误"
},
new_password: {
required: icon + "请输入新密码",
minlength: icon + "密码必须6个字符以上",
},
new_pwdconfirm: {
required: icon + "请再次输入密码",
minlength: icon + "密码必须6个字符以上",
equalTo: icon + "两次输入的密码不一致"
}
}
});

// propose username by combining first- and lastname
$("#username").focus(function () {
var firstname = $("#firstname").val();
var lastname = $("#lastname").val();
if (firstname && lastname && !this.value) {
this.value = firstname + "." + lastname;
}
});
});
</script>