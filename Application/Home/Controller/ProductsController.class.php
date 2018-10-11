<?php
/**
 * 课程体系
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/7/17
 * Time: 14:34
 */

namespace Home\Controller;

use Appframe\BaseController;

class ProductsController extends BaseController
{
    protected $News,$ncontent;
    function _initialize()
    {
        parent::_initialize();
        $this->News = M("news");
        $this->ncontent = M ( 'ncontent' );
        //左侧导航-课程体系
        $aside = $this->News->field('title as cate_name,nid')->where("catid = '3' and status='1'")->order(array("listorder" => "asc","edittime" => "desc"))->select();
        foreach ($aside as $k =>$v){
            $aside[$k]['url'] = '/lesson/detail/id/'.$v['nid'].'.html';
        }
        $title = array("cate_name"=>'课程体系',"url"=>'');
        array_unshift($aside,$title);
        $active = $_SERVER['REQUEST_URI'];
        $this->assign('aside',$aside);
        $this->assign('active',$active);
    }
    public function index()
    {
        $this->display();
    }

    public function detail()
    {
        $id =  $this->_get('id');
        $where = "nid = '$id'";
        $info = $this->News->where($where)->find();
        if(!$info) $this->error("参数有误!");
        $cinfo = $this->ncontent->where($where)->find();
        if ($cinfo) $info = array_merge($info, $cinfo);
        $webconfig = $this->webConfig($info,'');
        $this->assign('webconfig', $webconfig);
        $this->assign ( 'detail', $info);
        $this->display();
    }
}