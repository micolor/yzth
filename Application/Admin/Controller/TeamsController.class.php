<?php
/**
 * 团队管理
 */
 namespace Admin\Controller;
use Appframe\AdminbaseController;
class TeamsController extends AdminbaseController {

	/**
	 * @access private
	 */
	protected $dbTeams,$dbMembers;
	function _initialize() {
		parent::_initialize();
		$this->dbTeams = M("teams");
		$this->dbMembers = M("members");
	}

	/**
	 *  团队列表
	 */
	public function index() {

		$where = " 1=1 ";
		$count = $this->dbTeams->where($where)->count();	//信息总数
		$page = $this->page($count, 10);
		$datas = $this->dbTeams->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("id" => "DESC"))->select();
		foreach($datas as $key => $value){
			$leader_id = $value["leader_id"];
			if($leader_id){
				$leader = $this->dbMembers->where("id = ".$leader_id)->find();
				$datas[$key]["leader_name"] = $leader["member_name"];
			}else{
				$datas[$key]["leader_name"] = "未设置";
			}
		}
		$this->assign("page", $page->show('Admin'));
		$this->assign('datas', $datas);
		$this->display();
	}


	/**
	 *  添加团队
	 */
	public function add() {
		if (isset ( $_POST ['dosubmit'] )) {
			$datas = array();
		    $team_name = trim(I("post.team_name"));
//			$team_desc = I("post.team_desc");
			$team_desc = $_POST["team_desc"];
			$team_content = $_POST["team_content"];
			$thumb = I("post.thumb");
			$leader_id = I("post.leader_id");
			if($thumb)$datas["thumb"] = $thumb;
			$datas["team_name"] = $team_name;
			$datas["team_desc"] = $team_desc;
			$datas["team_content"] = $team_content;
			$datas["leader_id"] = $leader_id;
            $datas['addtime'] = time();
		    $status = $this->dbTeams->add($datas);
			if ($status) {
				$this->success("添加成功！");
			} else {
				$this->error("添加失败！");
			}
		}else{
			$members = $this->dbMembers->field("id,member_name")->where("status = 1")->select();
			$this->assign("members",$members);
			$this->display();
		}
			
	}


	/**
	 *
	 */
	public function edit() {
		if(isset($_POST['dosubmit'])){
			$id = I("post.id");
			if(!$id)$this->error("获取合作伙伴ID异常,请联系管理员！");
			$datas = array();
			$team_name = trim(I("post.team_name"));
			$team_desc = $_POST["team_desc"];
			$team_content = $_POST["team_content"];
//			$team_desc = I("post.team_desc"); 富文本已这种方式接收时，会把<span><p>等标签也当字符串处理。在页面输出时，会出现<span>.....</span>
			$thumb = I("post.thumb");
			$leader_id = I("post.leader_id");
			if($thumb)$datas["thumb"] = $thumb;
			$datas["team_name"] = $team_name;
			$datas["team_desc"] = $team_desc;
			$datas["team_content"] = $team_content;
			$datas["leader_id"] = $leader_id;
			$datas['addtime'] = time();
		 	$status = $this->dbTeams->where(" id = '$id' ")->save($datas);
			if ($status){
				$this->success("修改成功！","/Admin/Teams/index");
			}else{
				$this->error("修改失败");
			}


		}else{
			$id = I("get.id");
			if(!$id)$this->error("未获取到团队ID，请联系管理员！");
			$detail = $this->dbTeams->where("id = ".$id)->find();

			$members = $this->dbMembers->field("id,member_name")->where("status = 1")->select();
			$this->assign("members",$members);
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
					$staus = $this->dbTeams->where(array("id"=>$id))->delete();
					if(!$staus)
					$this->error("删除失败！");
				  }
				  $this->success("删除成功！");
		  }else{
				  $staus = $this->dbTeams->where(array("id"=>$id))->delete();
				  if ($staus) {
					  $this->success("删除成功！");
				  }else{
					  $this->error("删除失败！");
				  }
		  }
  }
}


?>