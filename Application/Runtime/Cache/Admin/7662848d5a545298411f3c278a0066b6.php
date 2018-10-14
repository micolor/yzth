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
          <h5>修改菜单</h5>
          <div class="ibox-tools">
            <a aria-expanded="true" class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
              <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
              <li><a href="/Admin/Menu/index.html">返回菜单管理</a>
              </li>
            </ul>
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <div style="display: block;" class="ibox-content">
          <form novalidate="novalidate" class="form-horizontal m-t" id="myform" action="<?php echo U('Menu/edit');?>" method="post">
            <input type="hidden" name="id" value="<?php echo ($Menudata['id']); ?>" />
            <div class="form-group">
              <label class="col-sm-2 control-label">上级</label>
              <div class="col-sm-10  control">
                <select name="parentid" class="form-control" >
                  <option value="0">作为一级菜单</option>
                  <?php if(is_array($Menucache)): $i = 0; $__LIST__ = $Menucache;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value='<?php echo ($vo['id']); ?>' <?php if(($Menudata['parentid']) == $vo['id']): ?>selected<?php endif; ?>> <?php echo ($vo['name']); ?>
                    </option>
                    <?php if(is_array($vo['lower'])): $i = 0; $__LIST__ = $vo['lower'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$lo): $mod = ($i % 2 );++$i;?><option value='<?php echo ($lo['id']); ?>' <?php if(($Menudata['parentid']) == $lo['id']): ?>selected<?php endif; ?>>&nbsp;├ <?php echo ($lo['name']); ?>
                      </option>
                      <?php if(is_array($lo['lower'])): $i = 0; $__LIST__ = $lo['lower'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$loo): $mod = ($i % 2 );++$i;?><option value='<?php echo ($loo['id']); ?>'  <?php if(($Menudata['parentid']) == $loo['id']): ?>selected<?php endif; ?>>&nbsp;│&nbsp;├ <?php echo ($loo['name']); ?>
                        </option><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
                </select>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">名称</label>
              <div class="col-sm-10  control">
                <input type="text" class="form-control" name="name" value="<?php echo ($Menudata['name']); ?>">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目</label>
              <div class="col-sm-10  control">
                <input type="text" class="form-control" name="app" value="<?php echo ($Menudata['app']); ?>">
                <span class="help-block m-b-none">第一个字母必须大写例如 Admin</span>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">模块</label>
              <div class="col-sm-10  control">
                <input type="text" class="form-control" name="model" value="<?php echo ($Menudata['model']); ?>">
                <span class="help-block m-b-none"> 第一个字母必须大写例如 Index</span>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">方法</label>
              <div class="col-sm-10  control">
                <input type="text" class="form-control" name="action" value="<?php echo ($Menudata['action']); ?>">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">参数</label>
              <div class="col-sm-10  control">
                <input type="text" class="form-control" name="data" value="<?php echo ($Menudata['data']); ?>">
                <span class="help-block m-b-none"> 例:groupid=1&amp;type=2</span>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">是否显示</label>
              <div class="col-sm-10  control">
                <input type="radio" name="status" value="1"  <?php if(($Menudata['status']) == "1"): ?>checked<?php endif; ?> > 是 <input type="radio" name="status" value="0" <?php if(($Menudata['status']) == "0"): ?>checked<?php endif; ?>> 否
              </div>
            </div>
            <div class="hr-line-dashed"></div>

            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-2">
                <input type="hidden" name="type" value="1" />
                <input name="dosubmit" type="submit" value="提交"  class="btn btn-primary" id="dosubmit">
                <button class="btn btn-white" href="/Admin/Menu" type="reset">重置</button>
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