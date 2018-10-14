<?php
namespace Home\Controller;
use Appframe\BaseController;
class WebsiteController extends BaseController {
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
        $detail = $this->Ads->where('ad_adp_id=59')->select();
        $this->assign('detail', $detail);
//        print_r($detail);
        $this->display();
    }

}
