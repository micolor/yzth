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
                    <h5>站点配置</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div style="display: block;" class="ibox-content">
                    <div class="panel blank-panel">
                        <div class="panel-heading">
                            <div class="panel-options">

                                <ul class="nav nav-tabs">
                                    <li class="active"><a aria-expanded="true" data-toggle="tab" href="#tab-1">基本配置</a>
                                    </li>
                                    <li class=""><a aria-expanded="false" data-toggle="tab" href="#tab-2">邮箱配置</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel-body">
                            <form novalidate="novalidate" class="form-horizontal m-t" id="signupForm" action="" method="post">
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                      <div class="form-group">
                                            <label class="col-sm-2 control-label">系统名称</label>
                                            <div class="col-sm-10  control">
                                                <input name="sitename" value="<?php echo ($Site["sitename"]); ?>" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">系统地址</label>
                                            <div class="col-sm-10  control">
                                                <input name="siteurl" class="form-control" value="<?php echo ($Site["siteurl"]); ?>" class="form-control" type="text">
                                                <span class="help-block m-b-none">请以“/”结尾</span>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">系统版权</label>
                                            <div class="col-sm-10  control">
                                                <input name="copyright" class="form-control" value="<?php echo ($Site["copyright"]); ?>" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">系统简介</label>
                                            <div class="col-sm-10  control">
                                                <textarea id="ccomment" name="siteinfo" class="form-control" required="" aria-required="true"><?php echo ($Site["siteinfo"]); ?></textarea>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮件发送模式</label>
                                        <div class="col-sm-10  control">
                                            <label class="control-label">SMTP 函数发送</label>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮件服务器</label>
                                        <div class="col-sm-10  control">
                                            <input type="text" class="form-control" name="smtp_server" id="smtp_server" size="30" value="<?php echo ($Site["smtp_server"]); ?>"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮件发送端口</label>
                                        <div class="col-sm-10  control">
                                            <input type="text" class="form-control" name="smtp_port" id="smtp_port" size="30" value="<?php echo ($Site["smtp_port"]); ?>"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">发件人地址</label>
                                        <div class="col-sm-10  control">
                                            <input type="text" class="form-control" name="smtp_mail" id="smtp_mail" size="30" value="<?php echo ($Site["smtp_mail"]); ?>"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">用户密码</label>
                                        <div class="col-sm-10  control">
                                            <input type="password" class="form-control" name="smtp_password" id="smtp_password" size="30" value="<?php echo ($Site["smtp_password"]); ?>"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <input name="dosubmit" type="submit" value="提交" class="btn btn-primary"
                                           id="dosubmit">
                                    <button class="btn btn-white" href="/Admin/Config" type="reset">重制</button>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
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