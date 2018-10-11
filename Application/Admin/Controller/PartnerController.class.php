<?php
/**
 * 合作伙伴
 */

namespace Admin\Controller;

use Appframe\AdminbaseController;

class PartnerController extends AdminbaseController
{

    /**
     * @access private
     */
    protected $Link;

    function _initialize()
    {
        parent::_initialize();
        $this->Link = M("Partner");
    }

    /**
     *  合作伙伴列表
     */
    public function index()
    {

        $where = " link_id > 0 ";
        $count = $this->Link->where($where)->count();    //信息总数
        $page = $this->page($count, 10);
        $datas = $this->Link->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("link_id" => "DESC"))->select();
        $this->assign("page", $page->show('Admin'));

        foreach ($datas as $k => $row) {
            $datas[$k]['link_type_name'] = ($row['link_type'] == 1) ? '文字' : '图片';
            $datas[$k]['link_status_name'] = ($row['link_static'] == 1) ? '开启' : '关闭';
        }

        $this->assign('datas', $datas);
        $this->display();
    }


    /**
     *  添加合作伙伴
     */

    public function add()
    {

        if (isset ($_POST ['dosubmit'])) {
            $datas = array();
            $link_name = trim(I("post.link_name"));
            $link_url = trim(I("post.link_url"));
            $link_type = I("post.link_type");
            $link_static = I("post.link_static");
            $link_img = I("post.link_img");
            $link_order = I("post.link_order");
            if ($link_img) $datas["link_img"] = $link_img;
            $datas["link_name"] = $link_name;
            $datas["link_url"] = $link_url;
            $datas["link_type"] = $link_type;
            $datas["link_static"] = $link_static;
            $datas["link_order"] = $link_order;
            $datas['link_add_time'] = time();
            $status = $this->Link->add($datas);
            if ($status) {
                $this->success("恭喜您,合作伙伴添加成功！", "/Admin/Partner/index");
            } else {
                $this->error("对不起，合作伙伴添加失败");
            }
        } else {

            $detail['link_type'] = '1';
            $detail['link_static'] = '1';
            $detail['link_order'] = '10';

            $this->assign('detail', $detail);

            $this->display('form');
        }

    }


    /**
     *  编辑合作伙伴
     */
    public function edit()
    {
        if (isset($_POST['dosubmit'])) {
            $link_id = I("post.link_id");
            if (!$link_id) $this->error("获取合作伙伴ID异常,请联系管理员！");
            $datas = array();
            $link_name = trim(I("post.link_name"));
            $link_url = trim(I("post.link_url"));
            $link_type = I("post.link_type");
            $link_static = I("post.link_static");
            $link_img = I("post.link_img");
            $link_order = I("post.link_order");
            if ($link_img) $datas["link_img"] = $link_img;
            $datas["link_name"] = $link_name;
            $datas["link_url"] = $link_url;
            $datas["link_type"] = $link_type;
            $datas["link_static"] = $link_static;
            $datas["link_order"] = $link_order;
            $datas['link_add_time'] = time();
            $status = $this->Link->where(" link_id = '$link_id' ")->save($datas);
            if ($status) {
                $this->success("恭喜您,合作伙伴修改成功！", "/Admin/Partner/index");
            } else {
                $this->error("对不起,合作伙伴修改失败");
            }


        } else {
            $linkid = (int)$_GET['link_id'];
            $detail = $this->Link->where(" link_id = '$linkid' ")->find();
            $this->assign('detail', $detail);
            $this->display();
        }
    }

    /**
     *  删除合作伙伴
     */
    public function delete()
    {
        $link_id = isset($_GET['link_id']) ? trim($_GET['link_id']) : '';
        if (!$link_id)
            $linkids = $_POST["linkids"];
        if (is_array($linkids)) {
            foreach ($linkids as $id) {
                $staus = $this->Link->where(array("link_id" => $id))->delete();
                if (!$staus)
                    $this->error("对不起,合作伙伴删除失败！");
            }
            $this->success("恭喜您,合作伙伴删除成功！");
        } else {
            $staus = $this->Link->where(array("link_id" => $link_id))->delete();
            if ($staus) {
                $this->success("恭喜您,合作伙伴删除成功！");
            } else {
                $this->error("对不起,合作伙伴删除失败！");
            }
        }
    }
}


?>