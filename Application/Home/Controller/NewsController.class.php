<?php

namespace Home\Controller;

use Appframe\BaseController;

class NewsController extends BaseController
{
    public $catdb, $ncontent, $news;

    function _initialize()
    {
        parent::_initialize();
        $this->catdb = M("newcat");
        $this->ncontent = M("ncontent");
        $this->news = M("news");
    }

    /**
     * 新闻报道
     * @param $catid
     * @return string
     */
    public function index()
    {
        $where = 'catid = 1 and status = 1';
        $keyword = $this->_get("keyword");
        if (!empty($keyword)) {
            $where .= " and title like '%$keyword%'";
        }
        $count = M("news")->where($where)->count();
        $page = $this->page($count, 18);
        $list = M("news")->where($where)->order(array("listorder" => "asc", "edittime" => "desc"))->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign("page", $page->show('Home'));
        $this->assign('list', $list);
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
            if ($detail) $info = array_merge($info, $detail);
        } else {
            $this->error("内容不存在或已删！");
        }
        $this->assign('detail', $info);
        $this->display();
    }


}