<?php
/**
 * 公司信息管理类
 *
 */
namespace Admin\Controller;
use Appframe\AdminbaseController;

class CommanageController extends AdminbaseController {
	private $itemDB,$contactusDB;
    function _initialize() {
        parent::_initialize();
        $this->itemDB = M("item");
		$this->contactusDB =  M("contactus");
    }


    /**
     *添加关于我们
    */
	public function aboutus(){
		if(isset($_POST['dosubmit'])){
            $id = I("post.id");
			if(!$id)$this->error("获取ID参数异常,请联系管理员！");
			$data['title']= I("post.title");
			$data['content']= $_POST['content'];
			$thumb = I("post.thumb");
			if($thumb)$data["thumb"] = $thumb;
			$data['etime']= time();
			if(empty($data['content']))$this->error('请填写内容！');
			$rs    = $this->itemDB->where('id = '.$id)->save($data);
			if($rs){
				$this->success('编辑成功!');
			}else{
				$this->error('编辑失败！');
			}
		}else{
			$info = $this->itemDB->find();
			$this->assign('info',$info);
			$this->display();
		}
	}

	public function contactus(){
		if(isset($_POST['dosubmit'])){
			$id = I("post.id");
			if(!$id)$this->error("获取ID参数异常,请联系管理员！");
			$data['address']= trim(I("post.address"));
			$data['phone']= trim(I("post.phone"));
			$data['fax']= trim(I("post.fax"));
			$data['email']= trim(I("post.email"));
            $data['qq']= trim(I("post.qq"));
			$data["thumb"] = I("post.thumb");
			$data['addtime']= time();
			F('Contact',$data);
			$rs    = $this->contactusDB->where('id = '.$id)->save($data);
			if($rs){
				$this->success('编辑成功!');
			}else{
				$this->error('编辑失败！');
			}
		}else{
			$info = $this->contactusDB->find();
			$this->assign('info',$info);
			$this->display();
		}
	}
}

?>
