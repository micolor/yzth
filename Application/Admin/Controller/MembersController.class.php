<?php
/**
 * 职员管理
 */
 namespace Admin\Controller;
use Appframe\AdminbaseController;
class MembersController extends AdminbaseController {

	/**
	 * @access private
	 */
	protected $dbMember,$dbDictonary;
	function _initialize() {
		parent::_initialize();
		$this->dbMember = M("members");
		$this->dbDictonary = M("dictionary");
	}

	/**
	 *  职员列表
	 */
	public function index() {

		$where = " 1=1 ";
		$count = $this->dbMember->where($where)->count();	//信息总数
		$page = $this->page($count, 10);
		$datas = $this->dbMember->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("id" => "DESC"))->select();
		$this->assign("page", $page->show('Admin'));
		foreach($datas as $k=>$row){
			$position = $this->dbDictonary->where("dcode = 'job_position' and dvalue = ".$row["job_position"])->find();
			$datas[$k]['position'] = $position["dname"];
		}
		
		$this->assign('datas', $datas);
		$this->display();
	}


	/**
	 *  添加合作伙伴
	 */

public function add() {
	
		if (isset ( $_POST ['dosubmit'] )) {
			$datas = array ();
		    $member_name = trim(I("post.member_name"));
			$job_position = I("post.job_position");
			$sex = I("post.sex");
			$phone = I("post.phone");
			$jobyear = I("post.jobyear");
			$intime = I("post.intime");
			$teamid = I("post.teamid");
			$ygxs = I("post.ygxs");
			if($intime){
				$intime= strtotime($intime);
				$datas["intime"] = $intime;
			}
			$outtime = I("post.outtime");
			if($outtime){
				$outtime = strtotime($outtime);
				$datas["outtime"] = $outtime;
			}
			$status = I("post.status");
			$headimage = I("post.headimage");
			if($headimage)$datas["headimage"] = $headimage;
			$datas["member_name"] = $member_name;
			$datas["job_position"] = $job_position;
			$datas["sex"] = $sex;
			$datas["phone"] = $phone;
			$datas["jobyear"] = $jobyear;
			$datas["status"] = $status;
			$datas["teamid"] = $teamid;
			$datas["ygxs"] = $ygxs;
            $datas['addtime'] = time();
		    $status =	 $this->dbMember->add($datas);
			if ($status) {
				$this->success("添加成功！");
			} else {
				$this->error("添加失败！");
			}
		}else{
			$positions = $this->dbDictonary->where("dcode = 'job_position'")->select();
			$teams = M("teams")->select();
			$this->assign("positions",$positions);
			$this->assign("teams",$teams);
			$this->display();
		}
			
	}


	/**
	 *  编辑合作伙伴
	 */
	public function edit() {
		if(isset($_POST['dosubmit'])){
			$id = I("post.id");
			if(!$id)$this->error("获取合作伙伴ID异常,请联系管理员！");
			$datas = array ();
			$member_name = trim(I("post.member_name"));
			$job_position = I("post.job_position");
			$sex = I("post.sex");
			$phone = I("post.phone");
			$jobyear = I("post.jobyear");
			$intime = I("post.intime");
			$teamid = I("post.teamid");
			$ygxs = I("post.ygxs");
			if($intime){
				$intime= strtotime($intime);
				$datas["intime"] = $intime;
			}
			$outtime = I("post.outtime");
			if($outtime){
				$outtime = strtotime($outtime);
				$datas["outtime"] = $outtime;
			}
			$status = I("post.status");
			$headimage = I("post.headimage");
			if($headimage)$datas["headimage"] = $headimage;
			$datas["member_name"] = $member_name;
			$datas["job_position"] = $job_position;
			$datas["sex"] = $sex;
			$datas["phone"] = $phone;
			$datas["jobyear"] = $jobyear;
			$datas["status"] = $status;
			$datas["teamid"] = $teamid;
			$datas["ygxs"] = $ygxs;
			$datas['addtime'] = time();
		 	$status = $this->dbMember->where(" id = '$id' ")->save($datas);
			 
			if ($status){
				$this->success("修改成功！","/Admin/Members/index");
			}else{
				$this->error("修改失败");
			}


		}else{
			$id = I("get.id");
			if(!$id)$this->error("未获取到职员ID，请联系管理员！");
			$detail = $this->dbMember->where("id = ".$id)->find();
			$positions = $this->dbDictonary->where("dcode = 'job_position'")->select();
			$teams = M("teams")->select();
			$this->assign("teams",$teams);
			$this->assign("positions",$positions);
			$this->assign("detail",$detail);
			$this->display();
		}
	}

	/**
	 *  删除合作伙伴
	 */
  public function delete() {
		 $id = isset($_GET['id'])?trim($_GET['id']):'';
		  if(!$id)
		  $ids =$_POST["ids"];
		  if(is_array($ids)){
				 foreach ($ids as $id){
					$staus = $this->dbMember->where(array("id"=>$id))->delete();
					if(!$staus)
					$this->error("删除失败！");
				  }
				  $this->success("删除成功！");
		  }else{
				  $staus = $this->dbMember->where(array("id"=>$id))->delete();
				  if ($staus) {
					  $this->success("删除成功！");
				  }else{
					  $this->error("删除失败！");
				  }
		  }
  }
}


?>