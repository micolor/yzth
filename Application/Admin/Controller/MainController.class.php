<?php

namespace Admin\Controller;
use Appframe\AdminbaseController;
class MainController extends AdminbaseController {

    private $dbTeams,$dbItem,$dbContactus,$dbFxuser;

    function _initialize() {
        parent::_initialize();
        $this->dbTeams=M('teams');
        $this->dbItem=M('item');
        $this->dbContactus=M('contactus');
        $this->dbFxuser=M('fxuser');
    }

    public function public_index() {

        //服务器信息
        $info = array(
            '操作系统' => PHP_OS,
            '运行环境' => $_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式' => php_sapi_name(),
            'MYSQL版本' => mysql_get_server_info(),
        );

        $this->assign('server_info', $info);
        //会员信息
        $userinfos = $this->Cache['User'];

        $userinfo = array(
            '会员名' => $userinfos['username']."&nbsp;&nbsp;&nbsp;<a href='".U("Admin/Adminmanage/myinfo")."'> 修改资料</a>",
            '所属会员组' => $userinfos['role_name'],
            '最后登陆时间' => date("Y-m-d H:i:s", $userinfos['last_login_time']),
            '上次登陆IP' => $userinfos['last_login_ip'],
            '本次登陆IP' => get_client_ip()
        );
        $this->assign('userinfo', $userinfo);
        $Model = F('Model');
        foreach ($Model as $rw) {
            $molule = M(ucwords($rw['tablename']));
            $rw['counts'] = $molule->count();
            $moduledata[] = $rw;
        }
        $login=M("fxloginlog")->order("loginid desc")->limit("0,5")->select();
        $this->assign("login",$login);
        $this->assign("moduledata",$moduledata);
        $this->display('index');
    }

    public function index(){
        $uid = $this->User["id"];
        $contactus = $this->dbContactus->find();  // 联系方式
        $teams = $this->dbTeams->select(); // 团队
        $item = $this->dbItem->find();  // 公司信息
        $fxuser = $this->dbFxuser->where("id = ".$uid)->find();

        $this->assign("contactus",$contactus);
        $this->assign("teams",$teams);
        $this->assign("item",$item);
        $this->assign("fxuser",$fxuser);
    	$this->display();
    }
    

    /**
     *  显示后台左侧导航
     */
    public function public_leftmain() {
        $parentid = (int) $this->_get("parentid");
		$menuGroupList = D('Menu')->roles_menu($_SESSION['roleid']);
        if ($parentid == 0) {
            $arid = current($menuGroupList);
            $Mune = $menuGroupList[$arid['id']]['lower'];
        } else {
            $Mune = $menuGroupList[$parentid]['lower'];
        }
        $this->assign("leftmain", $Mune);
        $this->display('leftmain');
    }

}

?>
