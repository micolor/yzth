<?php
/**
 * 技术参数
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/7/17
 * Time: 14:56
 */

namespace Home\Controller;

use Appframe\BaseController;

class JscsController extends BaseController
{
    protected $dbTeams;
    function _initialize()
    {
        parent::_initialize();
        $this->dbTeams = M("item");
    }
    public function index(){
        $detail = $this->dbTeams->where("id = '2'")->find();
        $this->assign('detail',$detail);
        $this->display();
    }
}