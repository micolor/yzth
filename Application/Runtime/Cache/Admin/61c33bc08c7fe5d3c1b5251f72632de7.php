<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员管理</title>
    <meta name="keywords" content="管理员管理">
    <meta name="description" content="管理员管理">
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
                    <h5>管理员管理</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="<?php echo U('Management/adminadd');?>">添加管理员</a>
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
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>用户名</th>
                                <th>所属角色</th>
                                <th>最后登录IP</th>
                                <th>最后登录时间</th>
                                <th>E-mail</th>
                                <th>备注</th>
                                <th>管理操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if(is_array($Userlist)): foreach($Userlist as $key=>$vo): ?><tr>
                                <td><?php echo ($vo["id"]); ?></td>
                                <td><?php echo ($vo["username"]); ?></td>
                                <td><?php echo ($vo["role_name"]); ?></td>
                                <td><?php echo ($vo["last_login_ip"]); ?></td>
                                <td>
                                    <?php if($vo['last_login_time'] == 0): ?>该用户还没登陆过
                                        <?php else: ?>
                                        <?php echo (date("y-m-d H:i:s",$vo["last_login_time"])); endif; ?>
                                </td>
                                <td><?php echo ($vo["email"]); ?></td>
                                <td><?php echo ($vo["remark"]); ?></td>
                                <td>
                                    <?php if($User['username'] == $vo['username']): ?>修改&nbsp;|&nbsp;删除
                                        <?php else: ?>
                                        <a href="<?php echo U('Management/edit',array('id'=>$vo[id]));?>" title="修改">修改</a>&nbsp;|&nbsp;<a href="<?php echo U('Management/delete',array('id'=>$vo['id']));?>" onclick="Delete(this);return false;" title="删除">删除</a><?php endif; ?>
                                </td>
                            </tr><?php endforeach; endif; ?>
                            </tbody>
                        </table>
                        <?php echo ($Page); ?>
                    </div>

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