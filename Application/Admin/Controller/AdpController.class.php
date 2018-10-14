<?php
namespace Admin\Controller;
use Appframe\AdminbaseController;
class AdpController extends AdminbaseController {

	/**
	* @access private
	*/
    protected $Adp;

    function _initialize() {
        parent::_initialize();
        $this->Adp = D("ad_position");
    }

    /**
     *  公告列表
     */
    public function index() {		
		$count = $this->Adp->count();	//信息总数
		$page = $this->page($count, 15);
		$datas = $this->Adp->limit($page->firstRow . ',' . $page->listRows)->order(array("adp_id" => "DESC"))->select();
		$this->assign("page", $page->show('Admin'));
		foreach ($datas as $k=>$v){
			$datas[$k]['htmlstatus']=($datas[$k]['adp_status']=="1")?'开启':'关闭';
		}



		$this->assign('datas', $datas);

		

        $this->display('index');
    }


    /**
     *  添加
     */
    public function add() {
     if(isset($_POST['dosubmit'])){
        $datas=array();
		 $adp_name = trim(I("post.adp_name"));
		 $adp_width = I("post.adp_width");
		 $adp_height = I("post.adp_height");
		 $adp_num = I("post.adp_num");
		 $adp_desc = I("post.adp_desc");
		 if(!$adp_name)$this->error("请输入广告位名称");
		 $datas["adp_name"] = $adp_name;
		 $datas["adp_width"] = $adp_width;
		 $datas["adp_height"] = $adp_height;
		 $datas["adp_num"] = $adp_num;
		 $datas["adp_desc"] = $adp_desc;
		$datas['adp_addtime']=time();
		$status =	 $this->Adp->add($datas);
		
        if ($status) {
            $this->success("恭喜您,广告位添加成功！",'/Admin/Adp/index');
        } else {
            $this->error("对不起，广告位添加失败");
        }
     }else{	
     	        $this->display('form');
     }
 
  }
    


    /**
     *  编辑
     */
    public function edit() {
    	if(isset($_POST['dosubmit'])){
			$adp_id = I("post.adp_id");
			if(!$adp_id)$this->error('获取广告位ID失败，请联系管理员！');
			$datas=array();
			$adp_name = trim(I("post.adp_name"));
			$adp_width = I("post.adp_width");
			$adp_height = I("post.adp_height");
			$adp_num = I("post.adp_num");
			$adp_desc = I("post.adp_desc");
			if(!$adp_name)$this->error("请输入广告位名称");
			$datas["adp_name"] = $adp_name;
			$datas["adp_width"] = $adp_width;
			$datas["adp_height"] = $adp_height;
			$datas["adp_num"] = $adp_num;
			$datas["adp_desc"] = $adp_desc;
			$datas['adp_addtime']=time();
			  $status = $this->Adp->where(" adp_id = ".$adp_id)->save($datas);
			  if ($status) {
				  $this->success("恭喜您,广告位修改成功！",'/Admin/Adp/index');
			  } else {
				  $this->error("对不起,广告位修改失败");
			  }
		
		
    	}else{
			 $adp_id  = (int) $_GET['adp_id'];
			 $detail = $this->Adp->where(" adp_id  = '$adp_id' ")->find();

			 $this->assign('detail', $detail);
			 
			 $this->display('form');
		}
    }

    /**
     *  删除
     */
    public function delete() {
        
        $adp_id =isset($_GET[adp_id])?$_GET[adp_id]:'';
        if(!$adp_id)
        	$adp_id =$_POST[adp_id];
        if(is_array($adp_id)){
        	foreach ($adp_id as $id){
        		$staus = $this->Adp->where(array("adp_id"=>$id))->delete();
        		if(!$staus)
        			$this->error("对不起,广告位批删除中出现错误！");
        	}
        	$this->success("恭喜您,广告位批删除成功！");
        }else{
                $staus = $this->Adp->where(array("adp_id"=>$adp_id))->delete();
		        if ($staus) {
		            $this->success("恭喜您,广告位删除成功！");
		        }else{
					$this->error("对不起,广告位删除失败！");
				}
        }

    }
    
    
    
    
    
    
}

?>