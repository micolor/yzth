<?php
/**
 * 关于我们
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/7/17
 * Time: 14:56
 */

namespace Home\Controller;

use Appframe\BaseController;

class AboutsController extends BaseController
{
    protected $dbTeams;
    function _initialize()
    {
        parent::_initialize();
        $this->dbTeams = M("item");
    }
    public function index(){
        $detail = $this->dbTeams->where("id = '1'")->find();
        $this->assign('detail',$detail);
        $this->display();
    }
}