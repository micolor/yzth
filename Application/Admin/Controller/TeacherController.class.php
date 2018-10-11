<?php
/**
 * 导师管理
 */

namespace Admin\Controller;

use Appframe\AdminbaseController;

class TeacherController extends AdminbaseController
{

    /**
     * @access private
     */
    protected $dbTeams, $dbMembers;

    function _initialize()
    {
        parent::_initialize();
        $this->dbTeams = M("teacher");
        $this->dbMembers = M("members");
    }

    /**
     *  导师列表
     */
    public function index()
    {
        $where = " 1=1 ";
        $count = $this->dbTeams->where($where)->count();    //信息总数
        $page = $this->page($count, 10);
        $datas = $this->dbTeams->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("listorder" => "ASC", "id" => "DESC"))->select();
        $this->assign("page", $page->show('Admin'));
        $this->assign('datas', $datas);
        $this->display();
    }


    /**
     *  添加团队
     */
    public function add()
    {
        if (isset ($_POST ['dosubmit'])) {
            $datas = array();
            $team_name = trim(I("post.name"));
            $team_desc = $_POST["tdesc"];
            $team_content = $_POST["tcontent"];
            $listorder = $_POST["listorder"];
            $thumb = I("post.thumb");
            if ($thumb) $datas["thumb"] = $thumb;
            $datas["name"] = $team_name;
            $datas["tdesc"] = $team_desc;
            $datas["tcontent"] = $team_content;
            $datas["listorder"] = $listorder;
            $datas['add_at'] = date('Y-m-d H:m:s', time());
            $datas['update_at'] = date('Y-m-d H:m:s', time());
            $status = $this->dbTeams->add($datas);
            if ($status) {
                $this->success("添加成功！");
            } else {
                $this->error("添加失败！");
            }
        } else {
            $members = $this->dbMembers->field("id,member_name")->where("status = 1")->select();
            $this->assign("members", $members);
            $this->display();
        }

    }


    /**
     *
     */
    public function edit()
    {
        if (isset($_POST['dosubmit'])) {
            $id = I("post.id");
            if (!$id) $this->error("参数有误！");
            $datas = array();
            $team_name = trim(I("post.name"));
            $team_desc = $_POST["tdesc"];
            $team_content = $_POST["tcontent"];
            $listorder = $_POST["listorder"];
            $thumb = I("post.thumb");
            if ($thumb) $datas["thumb"] = $thumb;
            $datas["name"] = $team_name;
            $datas["tdesc"] = $team_desc;
            $datas["tcontent"] = $team_content;
            $datas["listorder"] = $listorder;
            $datas['update_at'] = date('Y-m-d H:m:s', time());
            $status = $this->dbTeams->where(" id = '$id' ")->save($datas);
            if ($status) {
                $this->success("修改成功！", "/Admin/Teacher/index");
            } else {
                $this->error("修改失败");
            }
        } else {
            $id = I("get.id");
            if (!$id) $this->error("参数有误！");
            $detail = $this->dbTeams->where("id = " . $id)->find();

            $members = $this->dbMembers->field("id,member_name")->where("status = 1")->select();
            $this->assign("members", $members);
            $this->assign("detail", $detail);
            $this->display();
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
                $staus = $this->dbTeams->where(array("id" => $id))->delete();
                if (!$staus)
                    $this->error("删除失败！");
            }
            $this->success("删除成功！");
        } else {
            $staus = $this->dbTeams->where(array("id" => $id))->delete();
            if ($staus) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }
    }

    //排序
    public function listorders()
    {
        $listorders = $_POST['listorders'];
        foreach ($listorders as $id => $listorder) {
            $da_order['listorder'] = $listorder;
            $this->dbTeams->where(" id = '$id' ")->save($da_order);
        }
        $this->success("排序更新成功！");
    }
}


?>