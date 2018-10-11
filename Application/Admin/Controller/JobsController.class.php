<?php
/**
 * 招贤纳士
 */
 namespace Admin\Controller;
use Appframe\AdminbaseController;
class JobsController extends AdminbaseController {

	/**
	 * @access private
	 */
	private $jobsdb,$jiondb;
	function _initialize() {
		parent::_initialize();
		$this->jobsdb = M('jobs');
		$this->jiondb = M('jobs_jion');
	}

	/**
	 * 招聘列表
	 */
	public function index() {
		$where='1=1';
		$keyword = I("get.keyword");
		$start_time = I("get.start_time");
		$end_time = I("get.end_time");
		if($start_time)$st=strtotime($start_time." 00:00:00");
		if($end_time)$et=strtotime($end_time." 23:59:59");
		if($st) $where.=" and edittime >= '$st'";
		if($et) $where.=" and edittime<= '$et'";
		$status = I("get.status");
		if(!empty($keyword)){
			$where.=" and title like '%$keyword%'";
		}
		if(!empty($status)){
			$where.=" and status = '$status' ";
		}
		$count = $this->jobsdb->where($where)->count();
		$page = $this->page($count,10);
		$list=$this->jobsdb->where($where)->limit($page->firstRow.','.$page->listRows)->order(array("listorder" => "ASC","edittime" => "DESC"))->select();
		foreach ($list as $k=>$v){
			$jnumb=$this->jiondb->where("jid=$v[jid]")->count();
			$list[$k][jnumb]=$jnumb;
		}
		$this->assign("page",$page->show('Admin'));
		$this->assign ( 'datas', $list );
		$this->display ();
	}

	/**
	 * 招聘信息添加
	 */
	public function add() {
		if (isset ( $_POST ['dosubmit'] )){
			$title=$this->_post('title');
			if(!$title)$this->error('职位名称不能为空！');
			$people=$this->_post('people');
			if(!$title)$this->error('招聘人数不能为空！');
			$address=$this->_post('address');
			if(!$address)$this->error('工作地点不能为空！');
			$edittime=strtotime($this->_post('edittime'));
			$ndesc = $this->_post('ndesc');
			if(!$ndesc)$this->error('招聘简介不能为空！');
			$data = array ();
			$data['title']=$title;
			$data['people']=$people;
			$data['address']=$address;
			$data['edittime']=$edittime;
			$data['ndesc']=$ndesc;
			$data['status']=$this->_post('status');
			$content=$_POST['content'];
			$content=editor_safe_replace($content);
			$data['detail']=$content;
			$re=$this->jobsdb->add( $data );
			if ($re) {
				$this->success('添加成功！',U("Jobs/index")); exit();
			} else {
				$this->error('添加失败！');
			}
		}else{
			$this->display ('info');
		}
	}
	/**
	 * 招聘信息修改
	 */
	public function edit(){
		if (isset ( $_POST ['dosubmit'] )) {
			$title=$this->_post('title');
			$jid=$this->_post('jid');
			if(!$title)$this->error('职位名称不能为空！');
			$people=$this->_post('people');
			if(!$title)$this->error('招聘人数不能为空！');
			$address=$this->_post('address');
			if(!$address)$this->error('工作地点不能为空！');
			$ndesc = $this->_post('ndesc');
			if(!$ndesc)$this->error('招聘简介不能为空！');
			if(!$jid)$this->error('id错误！');
			$edittime=strtotime($this->_post('edittime'));
			$data = array ();
			$data['title']=$title;
			$data['people']=$people;
			$data['address']=$address;
			$data['ndesc']=$ndesc;
			$data['edittime']=$edittime;
			$data['status']=$this->_post('status');
			$content=$_POST['content'];
			$content=editor_safe_replace($content);
			$data['detail']=$content;
			$re=$this->jobsdb->where("jid=$jid")->save ( $data );
			if ($re) {
				$this->success('更新成功',U("Jobs/index")); exit();
			} else {
				$this->error('更新失败');
			}
		}else{
			$jid= I("get.jid");
			if(!$jid)$this->error('jid参数错误！');
			$info=$this->jobsdb->where("jid=$jid")->find();
			$this->assign ( 'info', $info );
			$this->display ('info');
		}
	}

	/**
	 * 删除招聘信息
	 */
	public function del(){
		if($_POST[aid]){
			$arr_id=$_POST[aid];
			foreach ($arr_id as $key=>$id){
				$this->jobsdb->where("jid=$id")->delete();
			}
			$this->success("删除操作成功！");
		}
		else{
			$jid=$this->_get('jid');
			if(!$jid) $this->error('参数传递错误');
			$this->jobsdb->where("jid=$jid")->delete();
			$this->success("删除操作成功！");
		}

	}

	/**
	 * 排序
	 */
	public function listorder(){
		if(isset($_GET['dosubmit'])) {
			foreach($_POST['listorders'] as $id => $listorder) {
				$this->jobsdb->where("jid=$id")->save(array('listorder'=>$listorder));
			}
			$this->success("排序成功！");
		} else {
			$this->error("排序失败");
		}
	}
	/**
	 * 删除加入人员
	 */
	public function del_m(){
		if($_POST[aid]){
			$arr_id=$_POST[aid];
			foreach ($arr_id as $key=>$id){
				$this->jiondb->where("id=$id")->delete();
			}
			$this->success("删除操作成功！");
		}
		else{
			$id=$this->_get('id');
			if(!$id) $this->error('参数传递错误');
			$this->jiondb->where("id=$id")->delete();
			$this->success("删除操作成功！");
		}

	}
	/**
	 * 查看
	 */
	public function detail_m(){
		if(isset($_POST['dosubmit'])){
			$id = I("post.jobjoinid");
			if(!$id)$this->error("获取参数异常，请联系管理员！");
			$data['status'] = $_POST["status"];
			$this->jiondb->where("id=".$id)->save($data);
			$this->success("审核成功！",U('Jobs/mlist',array('jid'=>$_POST['jid'])));
			exit();
		}else{
			$id=$this->_get('id');
			if($id){
				$where="id='$id'";
				$list=$this->jiondb->where($where)->find();
				$jobs= $this->jobsdb->where("jid='$list[jid]'")->find();
			}
			$this->assign ( 'list', $list );
			$this->assign ( 'jobs', $jobs);
			$this->display();
		}
	}
	/*databletest*/
	/**
	 * 招聘管理
	 */
	public function mlist(){
        $draw = $_GET['draw'];
		$jid=I("get.jid");
        if($draw){
            //order
            $order_column = $_GET['order']['0']['column'];//那一列排序，从0开始
            $order_dir = $_GET['order']['0']['dir'];//ase desc 升序或者降序
            $order = "";
            if(isset($order_column)){
                $i = intval($order_column);
                switch($i){
                    case 0;$order = "realname ".$order_dir;break;
                    case 1;$order = "sex ".$order_dir;break;
                    case 2;$order = "education ".$order_dir;break;
                    case 3;$order = "linkphone ".$order_dir;break;
                    case 4;$order = "email ".$order_dir;break;
                    case 5;$order = "addttime ".$order_dir;break;
                    default;$order = 'addttime desc';
                }
            }
            $start = $_GET['start'];//从多少开始
            $length = $_GET['length'];//数据长度
			$jid?$where="jid=".intval($jid):$where="1=1";
            $recordsTotal= $this->jiondb->where($where)->count();
            $recordsFiltered=$recordsTotal;
            $infos=$this->jiondb->where($where)->limit($start,$length)->order($order)->select();
            foreach($infos as $k=>$v){
                $infos[$k]['sex']=$v['sex']==1?男:女;
                $i=$v['education'];
                switch($i){
                    case 1;$infos[$k]['education'] = "专科";break;
                    case 2;$infos[$k]['education'] = "本科";break;
                    case 3;$infos[$k]['education'] = "硕士";break;
                    case 4;$infos[$k]['education'] = "博士";break;
                    case 5;$infos[$k]['education'] = "博士以上";break;
                    default;$infos[$k]['education'] = '不详';
                }
                $infos[$k]['addttime']=date('Y-m-d H:i:s',$v['addttime']);
            }
            echo json_encode(array(
                "draw" => intval($draw),
                "recordsTotal" => intval($recordsTotal),
                "recordsFiltered" => intval($recordsFiltered),
                "data" => $infos
            ),JSON_UNESCAPED_UNICODE);
        }else{
            $this->display();
        }

	}

}


?>