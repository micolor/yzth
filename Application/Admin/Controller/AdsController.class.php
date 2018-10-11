<?php
namespace Admin\Controller;

use Appframe\AdminbaseController;

class AdsController extends AdminbaseController
{

    /**
     * @access private
     */
    protected $Ads, $Ad_position;

    function _initialize()
    {
        parent::_initialize();
        $this->Ads = D("Ads");
        $this->Ad_position = D("Ad_position");
    }

    /**
     *  单页列表
     */
    public function index()
    {
        $where = " ad_id > 0 ";

        if ($_GET[ad_name]) $where .= " and ad_name like '%$_GET[ad_name]%' ";
        if ($_GET[ad_adp_id]) $where .= " and ad_adp_id = '$_GET[ad_adp_id]' ";
        if ($_GET[status]) $where .= " and ad_status = '$_GET[status]' ";

        $count = $this->Ads->where($where)->count();    //信息总数
        $page = $this->page($count, 15);
        $articles = $this->Ads->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("ad_id" => "DESC"))->select();
        foreach ($articles as $k => $row) {
            $articles[$k]['ad_type'] = ($row['ad_type'] == '1') ? '图片' : (($row['ad_type'] == '3') ? 'FLASH' : '文字');
            if ($row['ad_adp_id']) {
                $one = D('Ad_position')->where(array("adp_id" => (int)$row['ad_adp_id']))->find();
            }
            $articles[$k]['adp_name'] = $one['adp_name'];
        }
        $this->assign("page", $page->show('Admin'));
        $this->assign('articles', $articles);

        $where = " adp_id > 0 ";
        $se = $this->Ad_position->where($where)->order(array("adp_id" => "DESC"))->select();
        $this->assign('se', $se);

        $this->display();
    }


    /**
     *  添加
     */
    public function add()
    {
        if (isset($_POST['dosubmit'])) {
            $datas = array();
            $ad_name = trim(I("post.ad_name"));
            $ad_desc = trim(I("post.ad_desc"));
            $ad_adp_id = I("post.ad_adp_id");
            $ad_link = I("post.ad_link");
            $ad_status = I("post.ad_status");
            $ad_order = I("post.ad_order");
            $ad_link_man = I("post.ad_link_man");
            $ad_link_note = I("post.ad_link_note");
            $ad_type = I("post.ad_type");
            $ad_file = I("post.ad_file");
            if ($ad_file) $datas["ad_file"] = $ad_file;
            $datas["ad_name"] = $ad_name;
            $datas["ad_adp_id"] = $ad_adp_id;
            $datas["ad_desc"] = $ad_desc;
            $datas["ad_link"] = $ad_link;
            $datas["ad_status"] = $ad_status;
            $datas["ad_order"] = $ad_order;
            $datas["ad_link_man"] = $ad_link_man;
            $datas["ad_link_note"] = $ad_link_note;
            $datas["ad_type"] = $ad_type;
            $status = $this->Ads->add($datas);
            if ($status) {
                $this->success("恭喜您,广告添加成功！");
            } else {
                $this->error("对不起，广告添加失败");
            }
        } else {
            $where = " adp_id > 0 ";
            $articles = $this->Ad_position->where($where)->order(array("adp_id" => "DESC"))->select();
            $this->assign('articles', $articles);
            $ad['ad_status'] = '1';
            $ad['ad_type'] = '1';
            $ad['ad_order'] = '0';
            $this->assign('ad', $ad);
            $this->display('form');
        }

    }


    /**
     *  编辑
     */
    public function edit()
    {
        if (isset($_POST['dosubmit'])) {
            $ad_id = I("post.id");
            if (!$ad_id) $this->error("获取广告ID参数异常，请联系管理员！");
            $datas = array();
            $ad_name = trim(I("post.ad_name"));
            $ad_desc = trim(I("post.ad_desc"));
            $ad_adp_id = I("post.ad_adp_id");
            $ad_link = I("post.ad_link");
            $ad_status = I("post.ad_status");
            $ad_order = I("post.ad_order");
            $ad_link_man = I("post.ad_link_man");
            $ad_link_note = I("post.ad_link_note");
            $ad_type = I("post.ad_type");
            $ad_file = I("post.ad_file");
            if ($ad_file) $datas["ad_file"] = $ad_file;
            $datas["ad_name"] = $ad_name;
            $datas["ad_desc"] = $ad_desc;
            $datas["ad_adp_id"] = $ad_adp_id;
            $datas["ad_link"] = $ad_link;
            $datas["ad_status"] = $ad_status;
            $datas["ad_order"] = $ad_order;
            $datas["ad_link_man"] = $ad_link_man;
            $datas["ad_link_note"] = $ad_link_note;
            $datas["ad_type"] = $ad_type;
            $status = $this->Ads->where(" ad_id = " . $ad_id)->save($datas);
            if ($status) {
                $this->success("恭喜您,广告修改成功！");
            } else {
                $this->error("对不起,广告修改失败");
            }


        } else {
            $id = (int)$_GET['id'];
            $ad = $this->Ads->where(" ad_id = '$id' ")->find();
            $this->assign('ad', $ad);

            $where = " adp_id > 0 ";
            $articles = $this->Ad_position->where($where)->order(array("adp_id" => "DESC"))->select();
            $this->assign('articles', $articles);

            $this->display('form');
        }
    }

    /**
     *  删除
     */
    public function delete()
    {

        $sid = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$sid) {
            $uids = isset($_POST['uid']) ? ($_POST['uid']) : '';
            if (is_array($uids)) {
                foreach ($uids as $aid) {
                    $staus = $this->Ads->where(array("ad_id" => $aid))->delete();
                }
            }
        } else {
            $staus = $this->Ads->where(array("ad_id" => $sid))->delete();
        }
        if ($staus) {
            $this->success("删除广告成功！");
        } else {
            $this->error("广告删除失败！");
        }
    }
}

?>
