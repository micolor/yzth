<?php
namespace Home\Controller;
use Appframe\BaseController;
class IndexController extends BaseController {
    protected $Adp,$Ads;
    function _initialize() {
        parent::_initialize();
        $this->Adp = D("ad_position");
        $this->Ads = D("ads");
        $this->News = M("news");
        $this->Partner = M("partner");
    }
    //首页
    public function index(){
        //轮播广告
        $banner = $this->Ads->where('ad_adp_id=1 and ad_status=1')->order("ad_order asc")->select();
        $this->assign('banner', $banner);
        //客户故事视频
        $video = $this->Ads->where('ad_adp_id=2 and ad_status=1')->order("ad_order asc")->find();
        $this->assign('video', $video);
        //客户见证（客户案例）
        $where = "catid = '4' and status = '1'";
        $client_case = $this->News->where($where)->order(array("listorder"=>"asc","edittime"=>"desc"))->limit(2)->select();
        $this->assign('client_case', $client_case);
        //课程体系
        $where = "catid = '3' and status = '1'";
        $lesson = $this->News->where($where)->order(array("listorder"=>"asc","edittime"=>"desc"))->limit(2)->select();
        $this->assign('lesson', $lesson);
        //合作伙伴
        $where = "link_static = '1'";
        $partner = $this->Partner->where($where)->order(array("link_order"=>"asc","link_add_time"=>"desc"))->select();
        $this->assign('partner', $partner);
        //新闻资讯
        $where = "catid = '7' and status = '1'";
        $news = $this->News->where($where)->order(array("listorder"=>"asc","edittime"=>"desc"))->limit(2)->select();
        $this->assign('news', $news);
        $this->display();
    }
}
