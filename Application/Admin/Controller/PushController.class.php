<?php
 namespace Admin\Controller;
 use Appframe\AdminbaseController;
class PushController extends AdminbaseController {
	public $db_push_from;
    function _initialize() {
        parent::_initialize();
        $this->db_push_from=D('push_from');
    }

    public function index(){

		$data =  M('push')->where(" parent_id = '0' ")->order('sort_order desc')->select();

		foreach($data as $key=>$row)
		{
		    $data[$key][child] = $this->get_child($row[push_id] );
		}

		$this->assign ( 'data', $data );

		$this->display();
    }
    
    
	function get_child($cate_id)
		{
		   $data =  M('push')->where(" parent_id = '$cate_id' ")->order('sort_order desc')->select();
		   foreach($data as $key=>$row)
		   {
			 $data[$key][child] =  $this->get_child($row[push_id]);
		   }
		   return $data;
		}
    
		
		public function add(){
			
		if(isset($_POST['dosubmit'])){
			$data = array();
			$push_name = trim(I("post.push_name"));
			if(!$push_name)$this->error("推荐位名称不能为空！");
			$parent_id = I("post.parent_id");
			$sort_order = I("post.sort_order");
			$data["push_name"] = $push_name;
			$data["parent_id"] = $parent_id;
			$data["sort_order"] = $sort_order;
    		$rel=M('push')->add($data);
    		if($rel){
    			$this->success("添加成功！","/Admin/Push/index");
    		}else{
    			$this->error("添加失败！");
    		}
    	}else{
			$id=intval($_GET['push_id']);
			$data = M('push')->where("parent_id =0 ")->order(" sort_order asc ")->select();
			foreach($data as $key=>$row)
			{
				$data[$key][child] = $this->get_child("$row[push_id] ");
			}
			$cate=array();
			$cate['parent_id']=$id;
			$cate['sort_order']='255';
			$this->assign('data',$data);
			$this->assign('cate',$cate);

			$this->display('push_form');
		}
		}
		
		
 	//编辑
    function edit(){
    	if(isset($_POST['dosubmit'])){
			$id=intval($this->_post('push_id'));
			if(!$id)$this->error("获取推荐为ID失败，请联系管理员！");
			$data = array();
			$push_name = trim(I("post.push_name"));
			if(!$push_name)$this->error("推荐位名称不能为空！");
			$parent_id = I("post.parent_id");
			$sort_order = I("post.sort_order");
			$data["push_name"] = $push_name;
			$data["parent_id"] = $parent_id;
			$data["sort_order"] = $sort_order;
			$rel=M('push')->where("push_id=$id")->save($data);
			if($rel){
				$this->success("修改成功！","/Admin/Push/index");
			}else{
				$this->error("修改失败！");
			}
    	}else{
			$id=intval($_GET['push_id']);
			if(empty($id)) $this->error("参数错误");
			$data = M('push')->where("parent_id =0 ")->order(" sort_order asc ")->select();
			foreach($data as $key=>$row)
			{
				$data[$key][child] = $this->get_child("$row[push_id] ");
			}
			$cate =M('push')->where("push_id=$id")->find();
			$this->assign('data',$data);
			$this->assign('cate',$cate);
			$this->display('push_form');
			}
    		
    }
    
    
 //推荐位删除
    function delete(){
		$id=intval($this->_get('push_id'));
		if(empty($id)) $this->error("参数错误");
		$finfo=M('push')->where("parent_id=$id")->find();
		if($finfo){
			$this->error("请先删除该分类下的子分类！");
		}
		$rel=M('push')->where("push_id=$id")->delete();
    	if($rel){
			$this->success("删除成功！");
		}else{
			$this->error("删除失败！");
		}
    }

	//批量删除
	public function deleteall(){
		$pushids = I("post.pushids");
		if(is_array($pushids)){
			foreach ($pushids as $id){
				if (empty($id)) $this->error("参数错误");
				$finfo = M('push')->where("parent_id=$id")->find();
				if ($finfo) {
					$this->error("请先删除相关的下级分类，再删除父级别的分类！");
				}
				$rel = M('push')->where("push_id=$id")->delete();
				if (!$rel) {
					$this->error("对不起，删除中出现错误！");
				}
			}
			$this->success("删除成功！");
		}else{
			$this->error("批量删除失败！");
		}
	}



	/*管理推荐位里的文章*/
	public function init(){
				$push_id=intval($_GET['push_id']);
				if(!$push_id)$this->showmessage('参数传递错误');
				$push_name=M('push')->where(array('push_id' => $push_id))->find();
				$push_name=$push_name['push_name'];
				$where="push_id=$push_id";
				$page = max(intval($_GET['page']), 1);
				$data = $this->db_push_from->where($where)->select();
				$catname =M('newcat')->where()->select();
			   foreach ($catname as $k=>$v){
				$cat_name[$v['cate_id']]=$v;
			   }
			   unset($catname);
			  $this->assign('data',$data);
			$this->assign('cat_name',$cat_name);
			$this->assign('push_name',$push_name);
			$this->display('position_list');

	}

  /*
   * 修改推荐位文章
   * */
	public function editnews(){
		if(isset($_POST['dosubmit'])) {
			$p_id=intval($_POST['id']);
			if(!$p_id)$this->error('参数传递错误');
			$info=array();
			$p_title = I("post.p_title");
			if(!$p_title)$this->error("名称不能为空！");
			$p_description = I("post.p_description");
			$info["p_title"] = $p_title;
			$info["p_description"] = $p_description;
			$return_id=$this->db_push_from->where(array('p_id'=>$p_id))->save($info);
			if($return_id){
				$this->success('修改成功');
			}else{
				$this->error('修改失败');
			}
		}
		else{
			$id= $_GET['p_id'];
				if(!$id) $this->error('参数传递错误');
				$where = array('p_id' => $id);
				$an_info = $this->db_push_from->where($where)->find();
				$this->assign('an_info',$an_info);

			$push = M("push")->where("push_id = ".$an_info["push_id"])->find();
			$this->assign("push",$push);
			$this->display('position_edit');
		}
	}
    
	/**
	 * 排序
	 */
	public function listorder() {
		if(isset($_POST['dosubmit'])) {
			foreach($_POST['listorders'] as $id => $listorder) {
				$this->db_push_from->where(array('p_id'=>$id))->save(array('p_listorder'=>$listorder));
			}
			$this->success("排序成功");
		} else {
			$this->error("排序失败");
		}
	}

	/*新闻移出推荐位*/
	public function remove() {
	if($_POST[aids]){
		$arr_id=$_POST[aids];
	   	foreach ($arr_id as $key=>$id){
			$this->db_push_from->where(array('p_id'=>$id))->delete();
		}
		$this->success('移出成功');
	  }
	}
	
	
}

?>
