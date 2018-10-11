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
        $this->dbTeams = M("teacher");
        //左侧导航
        $aside = array();
        $aside['0']['cate_name'] = '关于我们';
        $aside['0']['url'] = '';
        $aside['0']['active'] = '';
        $aside['1']['cate_name'] = '公司简介';
        $aside['1']['url'] = '/abouts.html';
        $aside['2']['cate_name'] = '导师介绍';
        $aside['2']['url'] = '/abouts/teacher.html';
        $active = $_SERVER['REQUEST_URI'];
        $this->assign('aside',$aside);
        $this->assign('active',$active);
    }
    public function index(){
        $this->display();
    }
    public function teacher()
    {
        $where = " 1=1 ";
        $count = $this->dbTeams->where($where)->count();    //信息总数
        $page = $this->page($count, 20);
        $datas = $this->dbTeams->where($where)->limit($page->firstRow . ',' . $page->listRows)->order(array("listorder"=> "ASC","id" => "DESC"))->select();
        foreach ($datas as $k => $v){
            $datas[$k]['listdesc'] = explode("|",$v['tdesc']);
        }
        $this->assign("page", $page->show('Admin'));
        $this->assign('datas', $datas);
        $this->display();
    }
    public function detail()
    {
        $id = $this->_get('id');
        if(!$id) $this->error("参数有误！");
        $detail = $this->dbTeams->where("id = '$id'")->find();
        if($detail)$detail['listdesc'] = explode("|",$detail['tdesc']);
        $this->assign('detail',$detail);
        $cate = array("cate_name"=>"导师介绍");
        $this->assign('cate', $cate);
        $this->display();
    }
}