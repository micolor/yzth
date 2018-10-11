<?php

namespace Home\Controller;

use Appframe\BaseController;

class NewsController extends BaseController
{
    public $catdb, $ncontent, $news;

    function _initialize()
    {
        parent::_initialize();
        $this->catdb = D('newcat');
        $this->ncontent = D('ncontent');
        $this->news = M('news');
        //左侧导航-新闻报道
        $aside = $this->catdb->where("(cate_id = '2' or parent_id = '2') and is_show='1'")->order(array("parent_id" => "asc", "sort_order" => "asc"))->select();
        $aside['0']['url'] = '';
        $aside['1']['url'] = '/news/lists.html';
        $aside['2']['url'] = '/news/index.html';
        $active = $_SERVER['REQUEST_URI'];
        $this->assign('aside', $aside);
        $this->assign('active', $active);
    }

    /**
     * 新闻报道
     * @param $catid
     * @return string
     */
    public function index()
    {
        $where = 'catid = 7 and status = 1';
        $count = M("news")->where($where)->count();
        $page = $this->page($count, 10);
        $list = M("news")->where($where)->order(array("listorder" => "asc", "edittime" => "desc"))->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign("page", $page->show('Home'));
        $this->assign('list', $list);
        $webconfig = $this->webConfig("",'7');
        $this->assign('webconfig', $webconfig);
        $this->display();
    }

    /**
     * 开课信息
     * @param $catid
     * @return string
     */
    public function lists()
    {
        $where = 'catid = 6 and status = 1';
        $count = M("news")->where($where)->count();
        $page = $this->page($count, 10);
        $list = M("news")->where($where)->order(array("listorder" => "asc", "edittime" => "desc"))->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign("page", $page->show('Home'));
        $this->assign('list', $list);
        $webconfig = $this->webConfig("",'6');
        $this->assign('webconfig', $webconfig);
        $this->display();
    }

    /**
     * 新闻详情
     * @param $catid
     * @return string
     */
    public function detail()
    {
        $nid = $_GET['id'];
        $where = "nid = '$nid'";
        $info = $this->news->where($where)->find();
        $cate = null;
        if ($info) {
            $detail = $this->ncontent->where($where)->find();
            $cate = $this->catdb->where("cate_id='{$info['catid']}'")->find();
            if ($detail) $info = array_merge($info, $detail);
        } else {
            $this->error("内容不存在或已删！");
        }
        $webconfig = $this->webConfig($info,'');
        $this->assign('webconfig', $webconfig);
        $this->assign('cate', $cate);
        $this->assign('detail', $info);
        $this->display();
    }


}