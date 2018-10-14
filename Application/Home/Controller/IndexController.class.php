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
        $this->Products = M("products");
        $this->Partner = M("partner");
        $this->itemDB = M("item");
    }
    //首页
    public function index(){
        //推荐产品（10）
        $where = "status = '1' and istj='1'";
        $tj = $this->Products->where($where)->field(array('nid','title','thumb'))->order(array("listorder"=>"asc","edittime"=>"desc"))->limit(10)->select();
        $this->assign('tj', $tj);
        //新闻资讯
        $where = "catid = '1' and status = '1'";
        $news = $this->News->where($where)->order(array("listorder"=>"asc","edittime"=>"desc"))->limit(5)->select();
        $this->assign('news', $news);
        //关于我们
        $abouts = $this->itemDB->find();
        $this->assign('abouts', $abouts);
        //产品展示(8)
        $where = "status = '1'";
        $products = $this->Products->where($where)->field(array('nid','title','thumb'))->order(array("listorder"=>"asc","edittime"=>"desc"))->limit(8)->select();
        $this->assign('products', $products);
        $products = $this->Products->where($where)->field(array('nid','title','thumb'))->order(array("listorder"=>"asc","edittime"=>"desc"))->limit(8)->select();
        $this->assign('products', $products);
        $this->display();
    }
}
