<?php
namespace Home\Controller;
use Appframe\BaseController;
class CaseController extends BaseController {
    protected $Ads;

    function _initialize() {
        parent::_initialize();
        $this->Ads = D("ads");
    }

    //主页
    /**
     *
     */
    public function index(){
        $detail = $this->Ads->where('ad_adp_id=58')->select();
        $this->assign('detail', $detail);
        $this->display();
    }

}
