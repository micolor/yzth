<?php
/**
 * 客户留言
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/7/17
 * Time: 14:56
 */

namespace Home\Controller;

use Appframe\BaseController;

class MessageController extends BaseController
{
    protected $db;

    function _initialize()
    {
        parent::_initialize();
        $this->db = D('apply');
    }

    /**
     * 客户留言
     */
    public function index()
    {
        $code = $this->_post("checkcode");
        if (isset($code)) {
            if ($code != $_SESSION['code']) {
                $this->error("验证码错误!");
            }
            $data = array();
            $data['name'] = $this->_post("Guest_Name");
            $data['tel'] = $this->_post("Guest_TEL");
            $data['email'] = $this->_post("Guest_Email");
            $data['fax'] = $this->_post("Guest_FAX");
            $data['address'] = $this->_post("Guest_ADD");
            $data['zip'] = $this->_post("Guest_ZIP");
            $data['content'] = $this->_post("Content");
            $data['company'] = $this->_post("Company");
            $data['add_time'] = date('Y-m-d H:i:s',time());
            $this->db->add($data);
            $this->success("提交成功!");
            exit();
        }
        $this->display();
    }
}