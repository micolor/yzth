<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>文章管理</title>
<meta name="keywords" content="文章管理">
<meta name="description" content="文章管理">
<link rel="shortcut icon" href="favicon.ico">
<link href="/statics/Hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/statics/Hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="/statics/Hplus/css/animate.css" rel="stylesheet">
<link href="/statics/Hplus/css/style.css?v=4.1.0" rel="stylesheet">
<link href="/statics/Hplus/css/plugins/iCheck/custom.css" rel="stylesheet">

<link href="/statics/Hplus/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>文章管理</h5>
					<div class="ibox-tools">
						<a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
							<i class="fa fa-wrench"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li><a  href="javascript:layyer('<?php echo U('Admin/New/add');?>','添加文章')">添加文章</a></li>
						</ul>
						<a class="collapse-link">
							<i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<!--搜索start-->
					<div class="row">
						<form name="searchform" action="" method="get" >
							<input type="hidden" value="Admin" name="g">
							<input type="hidden" value="New" name="m">
							<input type="hidden" value="index" name="a">
								<div class="col-sm-4 m-b-xs">
									<label class="text-left inline m-t-xs pull-left" >添加时间：</label>
									<div class="inline" style="width:75%" id="data">
										<div class="input-daterange input-group" id="datepicker">
											<input class="input-sm form-control" name="start_time" value="<?php echo ($_GET['start_time']); ?>" type="text">
											<span class="input-group-addon">到</span>
											<input class="input-sm form-control" name="end_time" value="<?php echo ($_GET['end_time']); ?>" type="text">
										</div>
									</div>
								</div>
							<div class="col-sm-2 m-b-xs">
								<select class="input-sm form-control input-s-sm inline" name="catid">
									<option value="" <?php if($_GET['catid'] == ''): ?>selected<?php endif; ?>>默认全部</option>
									<?php if(is_array($Menucache)): $i = 0; $__LIST__ = $Menucache;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value='<?php echo ($vo['cate_id']); ?>' <?php if(($_GET['catid']) == $vo['cate_id']): ?>selected<?php endif; ?>><?php echo ($vo['cate_name']); ?>
										</option>
										<?php if(is_array($vo['lower'])): $i = 0; $__LIST__ = $vo['lower'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$lo): $mod = ($i % 2 );++$i;?><option value='<?php echo ($lo['cate_id']); ?>' <?php if(($_GET['catid']) == $lo['cate_id']): ?>selected<?php endif; ?>>&nbsp;├<?php echo ($lo['cate_name']); ?>
											</option>
											<?php if(is_array($lo['lower'])): $i = 0; $__LIST__ = $lo['lower'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$loo): $mod = ($i % 2 );++$i;?><option value='<?php echo ($loo['cate_id']); ?>'  <?php if(($_GET['catid']) == $loo['cate_id']): ?>selected<?php endif; ?>>&nbsp;└<?php echo ($loo['cate_name']); ?>
												</option><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
								</select>
							</div>
							<div class="col-sm-2 m-b-xs">
								<select name="status" class="input-sm form-control input-s-sm inline" >
									<option value='0' >全部</option>
									<option value="1" <?php if($_GET['status']==1 ): ?>selected<?php endif; ?> >已发布</option>
									<option value="2" <?php if($_GET['status']==2 ): ?>selected<?php endif; ?> >未发布</option>
								</select>
							</div>
							<div class="col-sm-3 m-b-xs">
							<select name="searchtype" class="input-sm form-control input-s-sm pull-left" style="width: 40%">
								<option value='0' >请选择</option>
								<option value='1' <?php if($_GET['searchtype']==1 ): ?>selected<?php endif; ?> >标题</option>
								<option value='2' <?php if($_GET['searchtype']==2 ): ?>selected<?php endif; ?> >简介</option>
								<option value='3' <?php if($_GET['searchtype']==3 ): ?>selected<?php endif; ?> >作者</option>
								<option value='4' <?php if($_GET['searchtype']==4 ): ?>selected<?php endif; ?> >ID</option>
							</select>
							<input name="keyword" type="text" value="<?php echo ($_GET['keyword']); ?>" class="input-sm form-control inline" style="width: 60%"/>
							</div>
							<div class="col-sm-1 m-b-xs">	<input type="submit" name="search" value="搜索" class="btn btn-sm btn-primary" /></div>
						</form>
					</div>
					<!--搜索end-->
					<div class="table-responsive">
						<form name="myform" id="myform" action="" method="post">
							<table class="table table-striped">
								<thead>
								<tr>
									<th>
										<div class="icheckbox_square-green" style="position: relative;" id="checkall">
											<input type="checkbox" style="position: absolute; opacity: 0;">
										</div>
									</th>
									<th>排序</th>
									<th>ID</th>
									<th>标题</th>
									<th>栏目</th>
									<th>是否发布</th>
									<th>点击量</th>
									<th>发布人</th>
									<th>更新时间</th>
									<th>管理操作</th>
								</tr>
								</thead>
								<tbody>
								<?php if(!$list): ?><tr><td>暂无数据</td></tr><?php endif; ?>
								<?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
										<td>
											<div class="icheckbox_square-green" style="position: relative;">
												<input type="checkbox" name="aid[]" value="<?php echo ($vo["nid"]); ?>" style="position: absolute; opacity: 0;">
											</div>
										</td>
										<td>
											<input name='listorders[<?php echo ($vo["nid"]); ?>]' type='text' size='3' value='<?php echo ($vo["listorder"]); ?>' class="form-control input-sm input-listorder">
										</td>
										<td><?php echo ($vo["nid"]); ?></td>
										<td><a href="<?php echo U('/news/detail',array('id'=>$vo['nid']));?>" target="_blank" title="<?php echo ($vo["tile"]); ?>">
											<span style="" ><?php echo ($vo["title"]); ?></span>
										</a>
										</td>
										<td><?php echo ($vo["cate_name"]); ?></td>
										<td>
											<?php if($vo['status'] == 1): ?><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
												<?php else: ?>
												<span class="glyphicon glyphicon-remove" aria-hidden="true"></span><?php endif; ?></td>
										<td><?php echo ($vo["nid"]); ?></td>
										<td><?php echo ($vo["author"]); ?></td>
										<td><?php echo (date("Y-m-d H:i:s",$vo["edittime"])); ?></td>
										<td>
											<a href="javascript:layyer('<?php echo U('Admin/New/edit',array('nid'=>$vo[nid]));?>','修改文章')">修改</a>&nbsp;|&nbsp;<a  href="<?php echo U('Admin/New/del',array('nid'=>$vo[nid]));?>" onclick="Delete(this);return false;">删除</a>
										</td>
									</tr><?php endforeach; endif; ?>
								</tbody>
							</table>
							<div>
								<input type="button" class="btn btn-primary" value="排序"  style="cursor:pointer" onclick="myform.action='<?php echo U('Admin/New/listorder',array('dosubmit'=>1));?>';myform.submit();"/>
								<input type="button" class="btn btn-danger" value="删除" style="cursor:pointer" onclick="datadel()"/>
							</div>
						</form>
						<div id="pages"><?php echo ($page); ?></div>
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

<script src="/statics/Hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="/statics/Hplus/js/plugins/cropper/cropper.min.js"></script>
<!-- layer javascript -->
<script src="/statics/Hplus/js/plugins/layer/layer.min.js"></script>
</body>
</html>
<script type="text/javascript">
	//弹框
	var Delete = function(t){
		layer.confirm('确认要删除吗？',function(index){
			location.href=t;
		});
	}
	//checkbox效果
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
			$('input[name="aid[]"]:checked').each(function(){
				chk_value.push($(this).val());
			});
			if($('input[name="aid[]"]:checked').length==0){
				layer.msg('未选取任何内容', {icon:1,time:3000});
			}else{
				$.get(
						'/Admin/New/del.html',
						{nid:chk_value},
						function(data){
							if(data.status == 1){
								window.location.reload();
								$('input[name="aid[]"]').removeAttr("checked");
								layer.msg('删除成功', {icon:1,time:3000});
							}else{
								layer.msg(data.info, {icon:1,time:3000});
							}
						}

				);
			}
		});
	}
function layyer(url,titile){
		//iframe层
		parent.layer.open({
			type: 2,
			title: titile,
			shadeClose: true,
			shade: 0.8,
			area: ['80%', '95%'],
			content: url //iframe的url
		});
	}

	//时间
	$('#data .input-daterange').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true
	});
</script>