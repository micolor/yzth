<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>导师管理</title>
	<meta name="keywords" content="导师管理">
	<meta name="description" content="导师管理">
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
					<h5>导师管理</h5>
					<div class="ibox-tools">
						<a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
							<i class="fa fa-wrench"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li><a href="<?php echo U('Teacher/add');?>">添加导师</a>
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
								<th width="5%">
									<div class="icheckbox_square-green" style="position: relative;" id="checkall">
										<input type="checkbox" style="position: absolute; opacity: 0;">
										<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
									</div>
								</th>
								<th width="10%" align="left">排序</th>
								<th>导师姓名</th>
								<th>导师照片</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<form name="myform" action="<?php echo U('Teacher/listorders');?>" method="post">
							<?php if((!$datas)): ?><tr>
									<td colspan="5">暂无数据</td>
								</tr><?php endif; ?>
							<?php if(is_array($datas)): foreach($datas as $key=>$li): ?><tr>
									<td>
										<div class="icheckbox_square-green" style="position: relative;">
											<input type="checkbox" name="linkids[]" value="<?php echo ($li["id"]); ?>" style="position: absolute; opacity: 0;">
											<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
										</div>
									</td>
									<td align="left"><input name='listorders[<?php echo $li['id']?>]' type='text' size='3' value='<?php echo $li['listorder']?>' class='form-control input-sm input-listorder'></td>
									<td><?php echo ($li["name"]); ?></td>
									<td><img src="<?php echo ($li["thumb"]); ?>" width="50" height="50"></td>
									<td align='left'>
										<a href="<?php echo U('Teacher/edit',array('id'=>$li['id']));?>" title="修改"><span class="glyphicon" aria-hidden="true">修改</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="<?php echo U('Teacher/delete',array('id'=>$li['id']));?>" onclick="Delete(this);return false;" title="删除"><span class="glyphicon" aria-hidden="true">删除</span></a>
									</td>
								</tr><?php endforeach; endif; ?>
							</form>
							</tbody>
						</table>
						<div style="width:100%;margin-top: -20px;">
							<input type="button" class="btn btn-primary J_ajax_submit_btn" style="width:100px;background-color: #ED5565;border-color: #ED5565;" onclick="datadel()" value="批量删除" />
							<input type="submit" class="btn btn-primary J_ajax_submit_btn" name="dosubmit" value="排序" onClick="document.myform.action='<?php echo U('Teacher/listorders');?>';myform.submit();" />
						</div>
						<?php echo ($page); ?>
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

	$(function(){

		$(".icheckbox_square-green").click(function(){
			// 判断是否是全选checkbox 1 是 设置所有checkbox  2 否 设置单个checkbox
			if($(this).attr("id") == "checkall"){
				if(typeof($(this).find("input[type=checkbox]").attr("checked")) == "undefined"){
					$(".icheckbox_square-green").addClass("checked");
					$("input[type=checkbox]").attr("checked","checked");
				}else{
					$(".icheckbox_square-green").removeClass("checked");
					$("input[type=checkbox]").removeAttr("checked");
				}
			}else{
				if(typeof($(this).find("input[type=checkbox]").attr("checked")) == "undefined"){
					$(this).addClass("checked");
					$(this).find("input[type=checkbox]").attr("checked","checked");
				}else{
					$(this).removeClass("checked");
					$(this).find("input[type=checkbox]").removeAttr("checked");
				}
			}
		});

	});

	/*批量删除*/
	function datadel(){
		layer.confirm('确认要删除吗？',function(index){
			var chk_value =[];
			$('input[name="linkids[]"]:checked').each(function(){
				chk_value.push($(this).val());
			});
			if($('input[name="linkids[]"]:checked').length==0){
				layer.msg('未选取任何内容', {icon:1,time:1000});
			}else{
				$.post(
						'/Admin/Teacher/delete.html',
						{ids:chk_value},
						function(data){
							if(data.status == 1){
								window.location.reload();
								$('input[name="linkids[]"]').removeAttr("checked");
								layer.msg('删除成功', {icon:1,time:2000});
							}else{
								layer.msg('删除失败', {icon:1,time:2000});
							}
						}

				);
			}
		});
	}

</script>