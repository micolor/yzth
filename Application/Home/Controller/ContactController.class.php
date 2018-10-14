<?php
namespace Home\Controller;
use Appframe\BaseController;
class ContactController extends BaseController {
    private $itemDB;

    function _initialize()
    {
        parent::_initialize();
        $this->itemDB = M("item");
        //左侧导航
        $aside = array();
        $aside['0']['cate_name'] = '联系我们';
        $aside['0']['url'] = '/contact';
        $aside['0']['active'] = 'index';
        $this->assign('aside',$aside);
    }

    //主页
    public function index()
    {
        $info = $this->itemDB->find();
        $this->assign('info', $info);
        $this->display();
    }
}
