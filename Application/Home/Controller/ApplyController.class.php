<?php
/**
 * 在线报名
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/7/17
 * Time: 14:56
 */

namespace Home\Controller;

use Appframe\BaseController;

class ApplyController extends BaseController
{
    protected $Partner, $Apply;

    function _initialize()
    {
        parent::_initialize();
        $this->Partner = M("partner");
        $this->Apply = M("apply");
    }

    public function index()
    {
        //合作伙伴
        $where = "link_static = '1'";
        $partner = $this->Partner->where($where)->order(array("link_order" => "asc", "link_add_time" => "desc"))->select();
        $this->assign('partner', $partner);
        $this->display();
    }

    /**
     * 报名
     */
    public function todo()
    {
        if(!isset($_SERVER['HTTP_REFERER']) || !stripos($_SERVER['HTTP_REFERER'],'www.52jixiao.com')) {
            $this->error("cann`t access");
        }
        //判断验证码有效性
        $name = $this->_post('name');
        $sex = $this->_post('sex');
        $code = $this->_post('code');
        $mobile = $this->_post('mobile');
        $company = $this->_post('company');
        $datas = array();
        $datas['name'] = $name;
        $datas['sex'] = $sex;
        $datas['mobile'] = $mobile;
        $datas['company'] = $company;
        $datas['status'] = '1';
        $datas['add_time'] = date('Y-m-d H:m:s', time());
        $datas['update_time'] = date('Y-m-d H:m:s', time());
        $datas['ip'] = $_SERVER['HTTP_X_REAL_IP'];
        //校验验证码
        $codedb = M('verification_code', 'sms_', 'DB_BS');
        $codeInfo = $codedb->where(array('mobile', $datas['mobile'], 'yzcode' => $code))->order(" sendtime desc ")->find();
        if (!$codeInfo || (strtotime($codeInfo['sendtime']) + 900) < time()) {
            $this->error("验证码不存在或已过期!");
        }
        $info = $this->Apply->where("ip = '{$_SERVER['HTTP_X_REAL_IP']}'")->order(array("add_time" => "desc"))->find();
        if ($info && $info['add_time']) {
            if ((time() - strtotime($info['add_time'])) < 3600) {
                $this->error("操作频繁！");
            }
        }
        $res = $this->Apply->add($datas);
        if ($res) {
            $this->success("操作成功");
        } else {
            $this->error("操作失败");
        }
    }
}