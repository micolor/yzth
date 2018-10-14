<?php

namespace Admin\Controller;

use Appframe\AdminbaseController;

class NewController extends AdminbaseController
{
    public $catdb, $newsdb, $ncontentdb, $db_push;

    function _initialize()
    {
        parent::_initialize();
        $this->catdb = D('newcat');
        $this->newsdb = D('news');
        $this->ncontentdb = D('ncontent');
        $this->db_push = D('push');
    }

    /**
     * 新闻列表
     */
    public function index()
    {
        $catid = $this->_get("catid");
        $status = $this->_get("status");
        $searchtype = $this->_get("searchtype");
        $keyword = $this->_get("keyword");
        $start_time = $this->_get('start_time');
        $end_time = $this->_get('end_time');
        if ($start_time) $st = strtotime($start_time . ' 00:00:00');
        if ($end_time) $et = strtotime($end_time . ' 23:59:59');
        $where = '1=1  ';
        if (!empty($st) && !empty($et)) {
            $where .= " and  `addtime` >'$start_time' AND  `addtime`<'$end_time' ";
        }
        if (!empty($keyword) && $searchtype == 1) {
            $where .= " and title like '%$keyword%'";
        }
        if (!empty($keyword) && $searchtype == 2) {
            $where .= " and  ndesc like '%$keyword%'";
        }
        if (!empty($keyword) && $searchtype == 3) {
            $where .= " and  author like '%$keyword%'";
        }
        if (!empty($keyword) && $searchtype == 4) {
            $where .= " and  nid ='$keyword'";
        }

        if (!empty($catid)) {
            $where .= " and catid = '$catid'";
        }
        if (!empty($status)) {
            $where .= " and status = '$status'";
        }
        $Menucache = $this->Menulistarray();
        $count = M("news")->where($where)->count();
        $page = $this->page($count, 15);
        $list = M("news")->where($where)->order(array("listorder" => "asc", "addtime" => "desc"))->limit($page->firstRow . ',' . $page->listRows)->select();
        foreach ($list as $k => $v) {
            $catinfo = $this->catdb->where("cate_id=" . $v['catid'])->field('cate_name')->find();
            $list[$k]['cate_name'] = $catinfo['cate_name'];
            unset($catinfo);
        }
        $this->assign("page", $page->show('Admin'));
        $this->assign('list', $list);
        $this->assign('Menucache', $Menucache);

        $this->display();
    }

    /**
     * 显示栏目菜单列表
     */
    public function public_categorys()
    {
        $data = $this->catdb->where(" parent_id = '0' ")->order('sort_order desc')->select();
        foreach ($data as $key => $row) {
            $data[$key][child] = $this->get_child("$row[cate_id] ");
        }
        $html = '<ul id="category_tree"  class="filetree ">';
        $stu = '<ul>';
        foreach ($data as $k1 => $v1) {
            if (is_array($v1['child']) && $v1['child']) {
                $html .= "<li id='$v1[cate_id]'><span class='folder'>$v1[cate_name]</span>";
                $html .= '<ul>';
                foreach ($v1['child'] as $k2 => $v2) {
                    if (is_array($v2['child']) && $v2['child']) {
                        $html .= "<li id='$v2[cate_id]'><span class='folder'>$v2[cate_name]</span>";
                        foreach ($v2['child'] as $v3) {
                            $html .= '<ul>';
                            $html .= "<li id='$v3[cate_id]'><span class=''><a target='right' href='/index.php?m=Admin&c=New&a=index&catid=$v3[cate_id]' onclick=javascript:openwinx('/index.php?m=Admin&c=New&a=index&catid=$v3[cate_id]','')><img src='/st/images/add_content.gif' alt='添加'></a> <a href='/index.php?m=Admin&c=New&a=index&catid=$v3[cate_id]' target='right' onclick='open_list(this)'>$v3[cate_name]</a></span>
		</li>";
                        }
                        $html .= '</ul>';
                    } else {
                        $html .= "<li id='$v2[cate_id]'><span class=''><a target='right' href='/index.php?m=Admin&c=New&a=index&catid=$v2[cate_id]' onclick=javascript:openwinx('/index.php?m=Admin&c=New&a=index&catid=$v3[cate_id]','')><img src='/st/images/add_content.gif' alt='添加'></a> <a href='/index.php?m=Admin&c=New&a=index&catid=$v2[cate_id]' target='right' onclick='open_list(this)'>$v2[cate_name]</a></span></li>";
                    }
                }
                $html .= '</ul>';

            } else {
                $html .= "<li id='$v1[cate_id]'><span class=''><a target='right' href='/index.php?m=Admin&c=New&a=index&catid=$v1[cate_id]' onclick=javascript:openwinx('/index.php?m=Admin&c=New&a=index&catid=$v1[cate_id]','')><img src='/st/images/add_content.gif' alt='添加'></a> <a href='/index.php?m=Admin&c=New&a=index&catid=$v1[cate_id]' target='right' onclick='open_list(this)'>$v1[cate_name]</a></span></li>";
            }

        }
        $html .= '</ul>';
        $this->assign('html', $html);

        $this->display('category_tree');
        exit;
    }

    function get_child($cate_id)
    {
        $data = M('newcat')->where(" parent_id = '$cate_id' ")->order('sort_order desc')->select();
        foreach ($data as $key => $row) {
            $data[$key][child] = $this->get_child($row[cate_id]);
        }
        return $data;
    }

    /*
     * 上传缩略图
     */
    public function ajaximg()
    {
        ajaxsdoimg('/imageuploads/news/', $max_size_val = 2048, $max_width_val = '800');
        exit();
    }

    public function imageProcessing($i, $width, $height, $save)
    {
        import('ORG.Util.Image.ThinkImage');
        $img = new \ThinkImage ();
        $img->open($i)->crop($img->width(), $img->height(), 0, 0, $width, $height)->save($save);
    }

    public function add()
    {
        if (isset ($_POST ['dosubmit'])) {
            $title = $this->_post('title');
            if (!$title) $this->error('标题不能为空！');
            $ym = date('Ym', time());
            $addtime = strtotime($this->_post('addtime'));
            $data = array();
            $thumb = $this->_post('thumb');
            $ndesc = $this->_post('ndesc');
            $data['title'] = $title;
            $data['catid'] = $this->_post('catid');
            $data['keywords'] = $this->_post('keywords');
            $data['source'] = $this->_post('source');
            $data['author'] = $this->_post('author');
            $data['address'] = $this->_post('address');
            $data['status'] = $this->_post('status');
            $data['hits'] = intval($this->_post('hits'));
            $data['thumb'] = $thumb;
            $data['addtime'] = $data['edittime'] = $addtime;
            $data['cacheym'] = $ym;
            $data['vtime'] = $this->_post('vtime');
            $content = $_POST['content'];
            $content = editor_safe_replace($content);
            $data['ndesc'] = $ndesc;
            //自动提取摘要
            if (!$ndesc) {//摘要为空
                $content = stripslashes($content);
                $content = preg_replace('/<(style.*?)>(.*?)<(\/style.*?)>/si', ' ', $content);
                $introcude_length = 300;
                $data['ndesc'] = str_cut(str_replace(array("\r\n", "\t", '[page]', '[/page]', '&ldquo;', '&rdquo;', '&nbsp;'), '', strip_tags($content)), $introcude_length);
                $data['ndesc'] = addslashes($data['ndesc']);

            }

            //自动提取第一张缩略图
            if (!$thumb && $content) {
                $content = stripslashes($content);
                if (preg_match_all("/(src)=([\"|']?)([^ \"'>]+\.(gif|jpg|jpeg|bmp|png))\\2/i", $content, $matches)) {
                    $thumb = $matches[3][0];//原图
                    $imgname = substr($thumb, strrpos($thumb, '/') + 1);


                    //生成缩略图 暂时去掉生成缩略图，insigma可能需要开启GD库扩展。且看需求，可能就需要原始大小图片
                    $data ['thumb'] = $thumb;
                    /*$newthumb='/imageuploads/newscontent/thumb/400_400_'.$imgname;
                    if($thumb && $imgname){
                    $this->imageProcessing ( ".$thumb", 400, 400, ".$newthumb");
                    $data ['thumb'] = $newthumb;
                    }*/
                }
            }

            $nid = $this->newsdb->add($data);//添加主表新闻
            if ($nid) {
                $ndata = array();
                $ndata['nid'] = $nid;
                $ndata['content'] = $content;
                $ndata['paginationtype'] = $this->_post('paginationtype');
                $ndata['maxcharperpage'] = $this->_post('maxcharperpage');
                $this->ncontentdb->add($ndata);//添加内容
            }

            $this->success("操作成功");

        }
        $Menucache = $this->Menulistarray();
        $info['tempthumb'] = '/statics/img/admin_img/upload-pic.png';
        $info['maxcharperpage'] = '1000';
        $this->assign('info', $info);
        $this->assign('Menucache', $Menucache);
        $this->assign('act', U('New/add'));
        $this->display('info');
    }

    /**
     * 新闻修改
     */
    public function edit()
    {
        if (isset ($_POST ['dosubmit'])) {
            $title = $this->_post('title');
            $nid = $this->_post('nid');
            $cacheym = $this->_post('cacheym');
            if (!$title) $this->error('标题不能为空！');
            if (!$nid) $this->error('id错误！');
            if (!$cacheym) $this->error('cacheym错误！');
            $ym = $cacheym;
            $edittime = strtotime($this->_post('addtime'));
            $data = array();
            $ndesc = $this->_post('ndesc');
            $thumb = $this->_post('thumb');
            $data['title'] = $title;
            $data['catid'] = $this->_post('catid');
            $data['keywords'] = $this->_post('keywords');
            $data['source'] = $this->_post('source');
            $data['ndesc'] = $ndesc;
            $data['author'] = $this->_post('author');
            $data['address'] = $this->_post('address');
            $data['status'] = $this->_post('status');
            $data['hits'] = intval($this->_post('hits'));
            $data['thumb'] = $thumb;
            $data['edittime'] = $edittime;
            $data['cacheym'] = $ym;
            $data['vtime'] = $this->_post('vtime');
            $content = $_POST['content'];
            $content = editor_safe_replace($content);
            //自动提取摘要
            if (!$ndesc) {//摘要为空
                $content = stripslashes($content);
                $content = preg_replace('/<(style.*?)>(.*?)<(\/style.*?)>/si', ' ', $content);
                $introcude_length = 300;
                $data['ndesc'] = str_cut(str_replace(array("\r\n", "\t", '[page]', '[/page]', '&ldquo;', '&rdquo;', '&nbsp;'), '', strip_tags($content)), $introcude_length);
                $data['ndesc'] = addslashes($data['ndesc']);
            }

            //自动提取第一张缩略图
            if (!$thumb && $content) {
                $content = stripslashes($content);
                if (preg_match_all("/(src)=([\"|']?)([^ \"'>]+\.(gif|jpg|jpeg|bmp|png))\\2/i", $content, $matches)) {
                    $thumb = $matches[3][0];//原图
                    $imgname = substr($thumb, strrpos($thumb, '/') + 1);

                    //生成缩略图 暂时去掉生成缩略图，insigma可能需要开启GD库扩展。且看需求，可能就需要原始大小图片
                    $data ['thumb'] = $thumb;
                    /*$newthumb='/imageuploads/newscontent/thumb/400_400_'.$imgname;
                    if($thumb && $imgname){
                    $this->imageProcessing ( ".$thumb", 400, 400, ".$newthumb");
                    $data ['thumb'] = $newthumb;
                    }*/

                }
            }

            $re = $this->newsdb->where("nid=$nid")->save($data);//更新主表新闻
            if ($nid && $re) {
                $ndata = array();
                $ndata['content'] = $content;
                $ndata['paginationtype'] = $this->_post('paginationtype');
                $ndata['maxcharperpage'] = $this->_post('maxcharperpage');
                $ndata['nid'] = $nid;
                $info = $this->ncontentdb->where("nid=$nid")->find();
                if ($info) {
                    $this->ncontentdb->where("nid=$nid")->save($ndata);//更新内容
                } else {
                    $this->ncontentdb->add($ndata);//更新内容
                }
            }
            $this->success("操作成功");
        }
        //新闻分类
        $Menucache = $this->Menulistarray();
        $nid = $this->_get('nid');
        if (!$nid) $this->error('nid参数错误！');
        $info = $this->newsdb->where("nid=$nid")->find();//主表新闻
        $cinfo = $this->ncontentdb->where("nid=$nid")->find();//内容
        if ($cinfo) $info = array_merge($info, $cinfo);
        $info['tempthumb'] = $info['thumb'];
        if (!$info['thumb']) $info['tempthumb'] = '/statics/img/admin_img/upload-pic.png';
        $this->assign('Menucache', $Menucache);
        $this->assign('info', $info);
        $this->assign('act', U('New/edit'));
        $this->display('info');
    }

    /**
     * 删除新闻
     */
    public function del()
    {
        $type = 'news';
        $nid = I("get.nid");
        if (is_array($nid)) {
            foreach ($nid as $key => $id) {
                M("news")->where("nid=$id")->delete();
                M("ncontent")->where("nid=$id")->delete();
            }
            $this->success("删除操作成功！");
        } else {
            if (!$nid) $this->error('参数传递错误');
            M("news")->where("nid=$nid")->delete();
            M("ncontent")->where("nid=$nid")->delete();
            $this->success("删除操作成功！");
        }

    }

    /**
     * 排序
     */
    public function listorder()
    {
        if (isset($_GET['dosubmit'])) {
            foreach ($_POST['listorders'] as $id => $listorder) {
                M('news')->where("nid=$id")->save(array('listorder' => $listorder));
            }
            $this->success("排序成功！");
        } else {
            $this->error("排序失败");
        }
    }

    /*
     文章推荐位
     */

    public function push_list()
    {

        $data = $this->db_push->where(" parent_id = '0' ")->order('sort_order desc')->select();
        foreach ($data as $key => $row) {
            $data[$key][child] = $this->get_push_child("$row[push_id] ");

        }

        $html = '';
        foreach ($data as $k1 => $v1) {
            if (is_array($v1['child']) && $v1['child']) {
                $html .= "<tr><td align=\"center\">$v1[push_id]</td><td style=\"color:#8A8A8A;\">$v1[push_name]</td></tr>";
                foreach ($v1['child'] as $k2 => $v2) {
                    if (is_array($v2['child']) && $v2['child']) {
                        $html .= "<tr><td align=\"center\">$v2[push_id]</td><td style=\"color:#8A8A8A;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ $v2[push_name]</td></tr>";

                        foreach ($v2['child'] as $v3) {
                            $html .= "<tr class=\"cu\" style=\"cursor:pointer\" title=\"点击选择\" onclick=\"select_list(this,'$v3[push_name]',$v3[push_id])\"><td align=\"center\">$v3[push_id]</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ $v3[push_name]</td></tr>";
                        }

                    } else {
                        $html .= "<tr class=\"cu\" style=\"cursor:pointer\" title=\"点击选择\" onclick=\"select_list(this,'$v2[push_name]',$v2[push_id])\"><td align=\"center\">$v2[push_id]</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─ $v2[push_name]</td></tr>";
                    }
                }


            } else {
                $html .= "<tr class=\"cu\" style=\"cursor:pointer\"  title=\"点击选择\" onclick=\"select_list(this,'$v1[push_name]',$v1[push_id])\"><td align=\"center\">$v1[push_id]</td>
<td>$v1[push_name]</td></tr>";
            }


        }
        $this->assign('html', $html);
        $this->display('push_to_position');


    }

    function get_push_child($cate_id)
    {
        $data = $this->db_push->where(" parent_id = '$cate_id' ")->order('sort_order desc')->select();
        foreach ($data as $key => $row) {
            $data[$key][child] = $this->get_push_child($row[push_id]);
        }
        return $data;
    }


    /*
     *
     添加文章到推荐位
     * */
    public function push_add()
    {
        if (isset($_POST['dosubmit'])) {
            $id = explode('|', $_POST['id']);//新闻id
            $ids = explode('|', $_POST['ids']);//推荐位id
            $info = array();
            foreach ($ids as $push_id) {
                if ($push_id) {
                    foreach ($id as $new_id) {
                        if ($new_id) {
                            $an_info = M('news')->where(array('nid' => $new_id))->find();
                            if ($an_info['catid']) $cat_info = M('newcat')->where(array('cate_id' => $an_info['catid']))->find();
                            $info = array();
                            $info['new_id'] = $new_id;
                            $info['push_id'] = $push_id;
                            $info['cat_id'] = $cat_info['cate_id'];
                            $info['cat_name'] = $cat_info['cate_name'];
                            $info['p_title'] = $an_info['title'];
                            $info['p_thumb'] = $an_info['thumb'];
                            $info['p_description'] = $an_info['ndesc'];
                            $info['p_updatetime'] = $an_info['edittime'];
                            $return_id = M('push_from')->add($info);
                        }
                    }
                }

            }
            if ($return_id) {
                $this->showmessage('推送成功', $_SERVER ['HTTP_REFERER']);

            } else {
                $this->showmessage('推送失败', $_SERVER ['HTTP_REFERER']);

            }
        }

    }

    /**
     * 批量移动文章
     */
    public function remove()
    {
        if (isset($_POST['dosubmit'])) {
            $catid = intval($_POST['catid']);
            if ($_POST['fromtype'] == 0) {
                if ($_POST['ids'] == '') $this->showmessage('请选择源栏目或者指定ID', $_SERVER ['HTTP_REFERER']);
                if (!$_POST['tocatid']) $this->showmessage('请选择目标栏目', $_SERVER ['HTTP_REFERER']);
                $tocatid = intval($_POST['tocatid']);
                $ids = array_filter(explode(',', $_POST['ids']), "intval");
                $ids = implode(',', $ids);
                $wh = " nid IN($ids)";
                $data = array();
                $data['catid'] = $tocatid;
                $this->newsdb->where($wh)->save($data);
            } else {
                if (!$_POST['fromid']) $this->showmessage('请选择源栏目', $_SERVER ['HTTP_REFERER']);
                if (!$_POST['tocatid']) $this->showmessage('请选择目标栏目', $_SERVER ['HTTP_REFERER']);
                $tocatid = intval($_POST['tocatid']);
                $fromid = array_filter($_POST['fromid'], "intval");
                $fromid = implode(',', $fromid);
                $wh = " catid IN($fromid)";
                $data = array();
                $data['catid'] = $tocatid;
                $this->newsdb->where($wh)->save($data);
            }
            $this->showmessage('批量转移成功', $_SERVER ['HTTP_REFERER']);
        } else {
            $data = $this->catdb->where(" parent_id = '0' ")->order('sort_order desc')->select();
            foreach ($data as $key => $row) {
                $data[$key][child] = $this->get_child("$row[cate_id] ");
            }
            $html = $this->cat_tree($data);
            $ids = '';
            foreach ($_POST['aid'] as $v) {
                $ids .= $v . ',';
            }
            $ids = rtrim($ids, ',');
            $this->assign('html', $html);
            $this->assign('ids', $ids);
            $this->display('content_remove');
        }
    }

    /**
     *  使用拼装的方式，显示菜单关系
     * @param $type 类型
     */
    public function Menulistarray()
    {
        //顶级导航
        $Med = $this->catdb->where(array("parent_id" => 0))->order(array("sort_order" => "asc", "cate_id" => "desc"))->select();
        if (empty ($Med)) {
            return;
        }
        foreach ($Med as $key => $value) {
            $Med[$key]['lower'] = $this->MenuSet($value['cate_id']);
        }
        foreach ($Med as $key => $value) {
            $data[$value['cate_id']] = $value;
        }
        return $data;
    }

    /**
     * 根据菜单id 取得该菜单子菜单
     * @param int $id 菜单ID
     * @return array 数组
     */
    public function MenuSet($id)
    {
        $da = $this->catdb->where(array("parent_id" => (int)$id))->order("sort_order asc")->select();
        foreach ($da as $key => $value) {
            $data[$value['cate_id']] = $value;
            $data[$value['cate_id']]['lower'] = $this->MenuSet($value['cate_id']);
        }
        return $data;
    }

}

?>
