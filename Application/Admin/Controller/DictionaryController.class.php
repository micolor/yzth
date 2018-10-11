<?php
/**
 * 数据字典
 */
 namespace Admin\Controller;
use Appframe\AdminbaseController;
class DictionaryController extends AdminbaseController {

	/**
	 * @access private
	 */
	protected $dictionary;
	function _initialize() {
		parent::_initialize();
		$this->dictionary = M("dictionary");
	}

	/**
	 *  字典列表
	 */
	public function index() {

		$where = " 1=1 ";
		$dname = trim(I("get.dname"));
		if($dname)$where .= " and dname like '%".$dname."%'";
		$dcode = trim(I("get.dcode"));
		if($dname)$where .= " and dcode like '%".$dcode."%'";
		$count = $this->dictionary->where($where)->count();	//信息总数
		$page = $this->page($count, 10);
		$datas = $this->dictionary->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("id" => "asc"))->select();
		$this->assign("page", $page->show('Admin'));
		$this->assign('datas', $datas);
		$this->display();
	}


	/**
	 *  添加数据字典
	 */
	public function add() {
		if (isset ( $_POST ['dosubmit'] )) {
			$datas = array ();
		    $dcode = trim(I("post.dcode"));
			if(!$dcode)$this->error("未获取字典编码！");
			$dname = trim(I("post.dname"));
			$dvalue = trim(I("post.dvalue"));
			$datas["dcode"] = $dcode;
			$datas["dname"] = $dname;
			$datas["dvalue"] = $dvalue;
            $datas['addtime'] = time();
		    $status = $this->dictionary->add($datas);
			if ($status) {
				$this->success("添加成功！");
			} else {
				$this->error("添加失败！");
			}
		}else{
			$this->display();
		}
	}


	/**
	 *  编辑数据字典
	 */
	public function edit() {
		if(isset($_POST['dosubmit'])){
			$id = I("post.id");
			if(!$id)$this->error("获取字典ID异常,请联系管理员！");
			$datas = array ();
			$dcode = trim(I("post.dcode"));
			if(!$dcode)$this->error("未获取字典编码！");
			$dname = trim(I("post.dname"));
			$dvalue = I("post.dvalue");
			$datas["dcode"] = $dcode;
			$datas["dname"] = $dname;
			$datas["dvalue"] = $dvalue;
			$datas['addtime'] = time();
			$status = $this->dictionary->where(" id = ".$id)->save($datas);
			if($status){
				$this->success("修改成功！","/Admin/Dictionary/index");
			}else{
				$this->error("修改失败，请确认是否修改数据！");
			}


		}else{
			$id = I("get.id");
			$detail = $this->dictionary->where(" id = ".$id)->find();
			$this->assign('detail', $detail);
			$this->display();
		}
	}

	/**
	 *  删除数据字典
	 */
  public function delete() {
		 $id = isset($_GET['id'])?trim($_GET['id']):'';
		  if(!$id)
		  $ids =$_POST["ids"];
		  if(is_array($ids)){
				 foreach ($ids as $id){
					$staus = $this->dictionary->where(array("id"=>$id))->delete();
					if(!$staus)
					$this->error("对不起,删除失败！");
				  }
				  $this->success("恭喜您,删除成功！");
		  }else{
				  $staus = $this->dictionary->where(array("id"=>$id))->delete();
				  if ($staus) {
					  $this->success("恭喜您,删除成功！");
				  }else{
					  $this->error("对不起,删除失败！");
				  }
		  }
  }
}


?>