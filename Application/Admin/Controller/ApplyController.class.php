<?php

namespace Admin\Controller;

use Appframe\AdminbaseController;

class ApplyController extends AdminbaseController
{

    private $apply;

    function _initialize()
    {
        parent::_initialize();
        $this->apply = M('apply');
    }

    /**
     *  在线报名列表
     */
    public function index()
    {
        $where = " id > 0 ";
        $count = $this->apply->where($where)->count();    //信息总数
        $page = $this->page($count, 10);
        $datas = $this->apply->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("id" => "DESC"))->select();
        $this->assign("page", $page->show('Admin'));
        $this->assign('datas', $datas);
        $this->display();
    }

    /**
     * 更新状态
     * @return bool|void
     */
    public function edit()
    {
        $id = $this->_post('cid');
        $status = $this->_post('status');
        if ($id && $status) {
            $data['status'] = $status;
            $data["update_time"] = date("Y-m-d H:i:s",time());
            $status = $this->apply->where(" id = '$id' ")->save($data);
            if ($status) {
                echo "ok";
            } else {
                echo "error";
            }
        } else {
            echo "error";
        }
    }

    /**
     *  删除
     */
    public function delete()
    {
        $id = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$id)
            $ids = $_POST["ids"];
        if (is_array($ids)) {
            foreach ($ids as $id) {
                $staus = $this->apply->where(array("id" => $id))->delete();
                if (!$staus)
                    $this->error("对不起,删除失败！");
            }
            $this->success("删除成功！");
        } else {
            $staus = $this->apply->where(array("id" => $id))->delete();
            if ($staus) {
                $this->success("删除成功！");
            } else {
                $this->error("对不起,删除失败！");
            }
        }
    }

    /**
     * 查看详细
     * @return bool|void
     */
    public function detail()
    {
        $id = $this->_get('id');
        $detail= $this->apply->where(" id = '$id' ")->find();
        $this->assign('detail',$detail);
        $this->display();
    }

}

