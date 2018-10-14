<?php
/**
 * 公司信息管理类
 *
 */
namespace Admin\Controller;

use Appframe\AdminbaseController;

class CommanageController extends AdminbaseController
{
    private $itemDB, $contactusDB;

    function _initialize()
    {
        parent::_initialize();
        $this->itemDB = M("item");
        $this->contactusDB = M("contactus");
    }


    /**
     *添加关于我们
     */
    public function aboutus()
    {
        if (isset($_POST['dosubmit'])) {
            $id = I("post.id");
            if (!$id) $this->error("获取ID参数异常,请联系管理员！");
            $data['title'] = I("post.title");
            $data['content'] = $_POST['content'];
            $thumb = I("post.thumb");
            if ($thumb) $data["thumb"] = $thumb;
            $data['etime'] = time();
            if (empty($data['content'])) $this->error('请填写内容！');
            $rs = $this->itemDB->where('id = ' . $id)->save($data);
            if ($rs) {
                $this->success('编辑成功!');
            } else {
                $this->error('编辑失败！');
            }
        } else {
            $info = $this->itemDB->where("id = '1'")->find();
            $this->assign('info', $info);
            $this->display();
        }
    }

    /**
     *添加技术参数
     */
    public function jxcs()
    {
        if (isset($_POST['dosubmit'])) {
            $id = I("post.id");
            if (!$id) $this->error("获取ID参数异常,请联系管理员！");
            $data['title'] = I("post.title");
            $data['content'] = $_POST['content'];
            $thumb = I("post.thumb");
            if ($thumb) $data["thumb"] = $thumb;
            $data['etime'] = time();
            if (empty($data['content'])) $this->error('请填写内容！');
            $rs = $this->itemDB->where('id = ' . $id)->save($data);
            if ($rs) {
                $this->success('编辑成功!');
            } else {
                $this->error('编辑失败！');
            }
        } else {
            $info = $this->itemDB->where("id = '2'")->find();
            $this->assign('info', $info);
            $this->display();
        }
    }

    /**
     *添加生产设备
     */
    public function scsb()
    {
        if (isset($_POST['dosubmit'])) {
            $id = I("post.id");
            if (!$id) $this->error("获取ID参数异常,请联系管理员！");
            $data['title'] = I("post.title");
            $data['content'] = $_POST['content'];
            $thumb = I("post.thumb");
            if ($thumb) $data["thumb"] = $thumb;
            $data['etime'] = time();
            if (empty($data['content'])) $this->error('请填写内容！');
            $rs = $this->itemDB->where('id = ' . $id)->save($data);
            if ($rs) {
                $this->success('编辑成功!');
            } else {
                $this->error('编辑失败！');
            }
        } else {
            $info = $this->itemDB->where("id = '3'")->find();
            $this->assign('info', $info);
            $this->display();
        }
    }

    /**
     *销售网络
     */
    public function xswl()
    {
        if (isset($_POST['dosubmit'])) {
            $id = I("post.id");
            if (!$id) $this->error("获取ID参数异常,请联系管理员！");
            $data['title'] = I("post.title");
            $data['content'] = $_POST['content'];
            $thumb = I("post.thumb");
            if ($thumb) $data["thumb"] = $thumb;
            $data['etime'] = time();
            if (empty($data['content'])) $this->error('请填写内容！');
            $rs = $this->itemDB->where('id = ' . $id)->save($data);
            if ($rs) {
                $this->success('编辑成功!');
            } else {
                $this->error('编辑失败！');
            }
        } else {
            $info = $this->itemDB->where("id = '4'")->find();
            $this->assign('info', $info);
            $this->display();
        }
    }

    public function contactus()
    {
        if (isset($_POST['dosubmit'])) {
            $id = I("post.id");
            if (!$id) $this->error("获取ID参数异常,请联系管理员！");
            $data['address'] = trim(I("post.address"));
            $data['phone'] = trim(I("post.phone"));
            $data['fax'] = trim(I("post.fax"));
            $data['email'] = trim(I("post.email"));
            $data['qq'] = trim(I("post.qq"));
            $data["thumb"] = I("post.thumb");
            $data["linkman"] = I("post.linkman");
            $data["mobile"] = I("post.mobile");
            $data["tbshop"] = I("post.tbshop");
            $data['addtime'] = time();
            F('Contact', $data);
            $rs = $this->contactusDB->where('id = ' . $id)->save($data);
            if ($rs) {
                $this->success('编辑成功!');
            } else {
                $this->error('编辑失败！');
            }
        } else {
            $info = $this->contactusDB->find();
            $this->assign('info', $info);
            $this->display();
        }
    }
}

?>
