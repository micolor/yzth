<?php
namespace Admin\Controller;
use Appframe\AdminbaseController;
class LeanmanageController extends AdminbaseController
{

    private $leanmessage;
    function _initialize() {
        parent::_initialize();
        $this->leanmessage = M('leanmessage');
    }


    /**
     *  联系我们列表
     */
    public function index() {
        $where = " id > 0 ";
        $count = $this->leanmessage->where($where)->count();	//信息总数
        $page = $this->page($count, 10);
        $datas = $this->leanmessage->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("id" => "DESC"))->select();
        $this->assign("page", $page->show('Admin'));

        foreach($datas as $key=>$row){
            $datas[$key]['leanname_name'] = ($row['leanname'] );
            $datas[$key]['email_name'] = ($row['email'] );
            $datas[$key]['message_name'] = ($row['message'] );
        }
        $this->assign('datas', $datas);
        $this->display();
    }




    public function add()
    {
        if (isset($_POST['dosubmit'])) {
            $data = array();
            $data["leanname"] = I("post.leanname");
            $data["email"] = I("post.email");
            $data["message"] = I("post.message");
            /*$data["uploadfile"] = I("post.uploadfile");*/
            $data["addtime"] = time();
            $rel = M('leanmessage')->add($data);
            if ($rel) {
                $this->success("提交成功！", '/leanmanage/index');
            } else {
                $this->error("提交失败！");
            }
        } else {
            $this->display();
        }

    }

    /**
     *  查看联系我们
     */
    public function query() {
        $id = (int) $_GET['id'];
        $detail = $this->leanmessage->where(" id = '$id' ")->find();
        $this->assign('detail', $detail);
        $this->display();
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
                $staus = $this->leanmessage->where(array("id"=>$id))->delete();
                if(!$staus)
                    $this->error("对不起,删除失败！");
            }
            $this->success("删除成功！");
        }else{
            $staus = $this->leanmessage->where(array("id"=>$id))->delete();
            if ($staus) {
                $this->success("删除成功！");
            }else{
                $this->error("对不起,删除失败！");
            }
        }
    }

}

