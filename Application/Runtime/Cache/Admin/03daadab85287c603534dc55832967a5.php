<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                    <h5>个人信息</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                    <div style="display: block;" class="ibox-content">
                        <form novalidate="novalidate" class="form-horizontal m-t" id="myform" action="" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10  control">
                                    <label class="control-label text-left"><?php echo ($data["username"]); ?></label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">E-mail</label>
                                <div class="col-sm-10  control">
                                    <input type="text" name="email" class="form-control" id="email" value="<?php echo ($data["email"]); ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">真实姓名</label>
                                <div class="col-sm-10  control">
                                    <input type="text" name="user_real_name" class="form-control" id="user_real_name" value="<?php echo ($data["user_real_name"]); ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">固定电话</label>
                                <div class="col-sm-10  control">
                                    <input type="text" name="user_home_tel" class="form-control" id="user_home_tel" value="<?php echo ($data["user_home_tel"]); ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系手机</label>
                                <div class="col-sm-10  control">
                                    <input type="text" name="user_tel" class="form-control" id="user_tel" value="<?php echo ($data["user_tel"]); ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系地址</label>
                                <div class="col-sm-10  control">
                                    <input type="text" name="user_address" class="form-control" id="user_address" value="<?php echo ($data["user_address"]); ?>">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <input type="hidden" name="id" value="<?php echo ($data["id"]); ?>"/>
                                    <input type="hidden" name="username" value="<?php echo ($data["username"]); ?>"/>
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