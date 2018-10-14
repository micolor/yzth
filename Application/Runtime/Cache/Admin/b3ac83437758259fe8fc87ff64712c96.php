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
					<h5>添加栏目</h5>
					<div class="ibox-tools">
						<a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
							<i class="fa fa-wrench"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li><a href="<?php echo U('Newcat/Index');?>">返回栏目管理</a>
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
							<label class="col-sm-2 control-label">分类名称</label>
							<div class="col-sm-10  control">
								<input type="text" name="cate_name" class="form-control" id="link_name" value="<?php echo ($cate["cate_name"]); ?>">
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">上级分类</label>
							<div class="col-sm-10 ">
								<select class="form-control m-b" name="parent_id" id="parent_id">
									<option value="0">作为顶级分类</option>
									<?php foreach ($data as $key=>$row) {?>
									<option value="<?php echo $row['cate_id']; ?>" <?php if($row['cate_id']==$cate['parent_id']) echo 'selected';?>><?php  echo $row['cate_name'];?></option>
									<?php foreach ($row[child] as $key=>$child1) {?>
									<option value="<?php echo $child1['cate_id']; ?>" <?php if($child1['cate_id']==$cate['parent_id']) echo 'selected';?>>&nbsp;&nbsp;├ <?php  echo $child1['cate_name'];?></option>
									<?php }}?>
								</select>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">分类排序</label>
							<div class="col-sm-10  control">
								<input type="text" name="sort_order" class="form-control" id="sort_order" value="100">
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10  control">
								<textarea id="category_desc" name="category_desc" class="form-control" rows="2" cols="20"><?php echo ($cate["category_desc"]); ?></textarea>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">关键字</label>
							<div class="col-sm-10  control">
								<input type="text" name="category_keywords" class="form-control" id="category_keywords" value="<?php echo ($cate["category_keywords"]); ?>">
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div id="parterlogo">
							<div class="form-group">
								<label class="col-sm-2 control-label">缩略图</label>
								<div class="col-sm-8">
									<!--用来存放item-->
									<div id="fileList" class="uploader-list">
										<div class="file-item thumbnail">
										</div>
									</div>
									<input type="hidden" name="cthumb" id="filepath" value="">
									<div id="filePicker">选择图片</div>
								</div>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">是否展示</label>
							<div class="col-sm-10  control">
								<input name="is_show" type="radio" value="1"/> 展示 &nbsp; &nbsp; &nbsp; &nbsp;
								<input name="is_show" type="radio" value="2"/> 不展示
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-2">
								<input type="hidden" name="cate_id" value="<?php echo ($cate["cate_id"]); ?>" />
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
<link href='/Public/uploader/webuploader.css' rel='stylesheet'>
<script src="/Public/uploader/webuploader.js"></script>
<style>
	.thumbnail{ width:320px; height:240px; background:#F8F8F8; border:1px solid #C1C1C1; line-height:250px; text-align:center}
	.thumbnail img { width:310px; height:230px;}
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
				cate_name:{
					required: true,
					minlength: 1
				}
			},
			messages: {
				cate_name:{
					required: icon + "请输入分类名称",
					minlength: icon + "分类名称不能为空"
				}
			}
		});
      $("#ggtype_tp").click(function () {
        $(this).addClass("checked");
        $(this).find("input[type=radio]").attr("checked", "checked");

        $("#ggtype_wz").removeClass("checked");
        $("#ggtype_wz").find("input[type=radio]").removeAttr("checked");
        $("#parterlogo").show();
        $("#ad_type").val(1);
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