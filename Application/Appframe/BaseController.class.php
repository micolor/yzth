<?php

namespace Appframe;

use Appframe\AppframeController;
use Com\Util\Page;

class BaseController extends AppframeController
{

    function _initialize()
    {
        parent::_initialize();

        $this->assign('CSS_PATH', "/statics/rooster/css/");
        $this->assign('IMG_PATH', "/statics/rooster/img/");
        $this->assign('JS_PATH', "/statics/rooster/js/");
        $this->assign('theme_path', "/Application/Weixin/View/statics/");
        $this->assign('config', F("Config"));
        if (!F('Contact')) {
            $contact = M("contactus")->find();
            F('Contact', $contact);
        } else {
            $contact = F('Contact');
        }
        $this->assign('contact', $contact);
        //案列见证
        $where = "catid = '4' and status = '1'";
        $case_left = M('news')->where($where)->order(array("listorder" => "asc", "edittime" => "desc"))->limit(2)->select();
        $this->assign('case_left', $case_left);
    }

    protected function page($Total_Size = 1, $Page_Size = 0, $Current_Page = 1, $listRows = 6, $PageParam = '', $PageLink = '', $Static = FALSE)
    {

        if ($Page_Size == 0) {
            $Page_Size = C("PAGE_LISTROWS");
        }
        if (empty($PageParam)) {
            $PageParam = C("VAR_PAGE");
        }

        if ($Page_Size == 0) {
            $Page_Size = C("PAGE_LISTROWS");
        }
        if (empty($PageParam)) {
            $PageParam = C("VAR_PAGE");
        }
        $Page = new Page($Total_Size, $Page_Size, $Current_Page, $listRows, $PageParam, $PageLink, $Static);
        $tpl = '<ul class="pagination" style="margin: 20px auto;"><li>{first}</li><li>{prev}</li><li>{list}</li><li>{next}</li><li>{last}</li></ul>';
        $Page->SetPager('Home', $tpl, array("listlong" => "6", "prev" => "上一页", "next" => "下一页", "list" => "*"));
        return $Page;
    }


    public function webConfig($detail,$catId)
    {
        $webConfig = array();
        if($detail){
            $webConfig['title'] = $detail['title'] ;
            $webConfig['keywords'] = $detail['keywords'];
            $webConfig['ndesc'] = $detail['ndesc'];
        }else if($catId){
            $info = M("newcat")->where("cate_id = '" . $catId . "'")->find();
            if ($info) {
                $webConfig['title'] = $info['cate_name'] . "-蒋春燕绩效工场";
                $webConfig['keywords'] = $info['category_keywords'];
                $webConfig['ndesc'] = $info['category_desc'];
            }
        }
        return $webConfig;
    }

}

?>
