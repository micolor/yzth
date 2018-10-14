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
        $this->News = M("products");
        $this->Newscat = M("products_cat");
        $this->ncontent = M ( 'ncontent' );
    }
    public function index()
    {
        $catid = $this->_get("cid");
        $title= "产品展示";
        $keyword = $this->_get("keyword");
        $where = '1=1 and status=1 ';
        if (!empty($keyword)) {
            $where .= " and title like '%$keyword%'";
        }
        if (!empty($catid)) {
            $where .= " and catid = '$catid'";
            $info = $this->Newscat->where("cate_id = '{$catid}'")->find();
            if($info && $info['cate_name']) $title=$info['cate_name'];
        }
        $count = M("products")->where($where)->count();
        $page = $this->page($count, 15);
        $list = M("products")->where($where)->order(array("listorder" => "asc", "addtime" => "desc"))->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign("page", $page->show('Admin'));
        $this->assign('list', $list);
        $this->assign('title', $title);
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