<?php

namespace Admin\Controller;
use Appframe\AdminbaseController;
class ProductscatController extends AdminbaseController {
    function _initialize() {
        parent::_initialize();
    }

    
    public function index(){
    $data = M('products_cat')->where("parent_id =0 ")->order(" sort_order asc ")->select();
    foreach($data as $key=>$row)
		{
		    $data[$key][child] = $this->get_child("$row[cate_id] ");
		}
    	$this->assign('data',$data);
    	$this->display();
    }
    
	function get_child($cate_id)
	{
	   $data =  M('products_cat')->where(" parent_id = '$cate_id' ")->order('sort_order desc')->select();
	   foreach($data as $key=>$row)
	   {
		 $data[$key][child] =  $this->get_child($row[cate_id]);
	   }
	   return $data;
	}

    //添加
    function add(){
    	if(isset($_POST['dosubmit'])){
			$data = array();
			$data["cate_name"] = I("post.cate_name");
			$data["parent_id"] = I("post.parent_id");
			$data["sort_order"] = I("post.sort_order");
			$data["category_desc"] = I("post.category_desc");
			$data["category_keywords"] = I("post.category_keywords");
			$data["is_show"] = I("post.is_show");
			$cthumb = I("post.cthumb");
			if($cthumb){
				$data["cthumb"] = I("post.cthumb");
			}
    		$rel=M('products_cat')->add($data);
    		if($rel){
    			$this->success("添加成功！","/Admin/Productscat/index");
    		}else{
    			$this->error("添加失败！");
    		}
    	}else{
			$id=intval($_GET['cate_id']);
			$data = M('products_cat')->where("parent_id =0 ")->order(" sort_order asc ")->select();
			foreach($data as $key=>$row)
			{
				$data[$key][child] = $this->get_child("$row[cate_id] ");
			}
			$cate=array();
			$cate['parent_id']=$id;
			$this->assign('data',$data);
			$this->assign('cate',$cate);
    		$this->display();
    	}
    	
    }

    //编辑
    function edit(){
    	if(isset($_POST['dosubmit'])){
			$data=array();
			$id=intval($this->_post('cate_id'));
			if(!$id)$this->error("未获取到栏目ID，请联系管理员！");
			$cate_name = trim(I("post.cate_name"));
			$parent_id = I("post.parent_id");
			$sort_order = I("post.sort_order");
			$category_desc = I("post.category_desc");
			$category_keywords = I("post.category_keywords");
			$cthumb = I("post.cthumb");

			$data["cate_name"] = $cate_name;
			$data["parent_id"] = $parent_id;
			$data["sort_order"] = $sort_order;
			$data["category_desc"] = $category_desc;
			$data["category_keywords"] = $category_keywords;
			$data["cthumb"] = $cthumb;
            $data["is_show"] = I("post.is_show");
			$rel=M('products_cat')->where("cate_id=$id")->save($data);
    		if($rel){
    			$this->success("修改成功！",'/Admin/Productscat/index');
    		}else{
    			$this->error("修改失败！");
    		}
    	}else{
			$id=intval($_GET['cate_id']);
			if(empty($id)) $this->error("参数错误");
			$data = M('products_cat')->where("parent_id =0 ")->order(" sort_order asc ")->select();
			foreach($data as $key=>$row)
			{
				$data[$key][child] = $this->get_child("$row[cate_id] ");
			}

			// 获取修改的栏目数据
			$cate =M('products_cat')->where("cate_id=$id")->find();


			$this->assign('data',$data);
			$this->assign('cate',$cate);
			$this->display();
    	}
    		
    }
    
    //删除
    function delete(){
		$cateid = isset($_GET[cate_id])?$_GET[cate_id]:'';
		if(!$cateid)$cateid =$_POST[cate_id];
		if(is_array($cateid)){
			foreach ($cateid as $id){
				if (empty($id)) $this->error("参数错误");
				$finfo = M('products_cat')->where("parent_id=$id")->find();
				if ($finfo) {
					$this->error("请先删除相关的下级分类，再删除父级别的分类！");
				}
				$rel = M('products_cat')->where("cate_id=$id")->delete();
				if (!$rel) {
					$this->error("对不起，删除中出现错误！");
				}
			}
			$this->success("删除成功！");
		}else {
			if (empty($cateid)) $this->error("参数错误");
			$finfo = M('products_cat')->where("parent_id=$cateid")->find();
			if ($finfo) {
				$this->error("请先删除该分类下的子分类！");
			}
			$rel = M('products_cat')->where("cate_id=$cateid")->delete();
			if ($rel) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
    }

    //排序
    function listorders(){
        $listorders  = $_POST['listorders'];
		foreach($listorders as $id=>$listorder){
			 $da_order['sort_order'] = $listorder;
			 M('products_cat')->where(" cate_id = '$id' ")->save($da_order);
		}	
        $this->success("排序更新成功！");
    }

}

?>
