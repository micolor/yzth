<?php

namespace Admin\Controller;
use Appframe\AdminbaseController;
use Com\Util\Dir;
class IndexController extends AdminbaseController {

    public function index() {
		
		$menuGroupList = D('Fxmenu')->roles_menu($_SESSION['roleid']);
        $this->assign("menuGroupList", $menuGroupList);
        $panelarr = M("fxadminPanel")->where(array("userid" => $this->Cache['uid']))->select();
        $this->assign("panelarr",$panelarr);
        $this->display();
    }

    /**
     * 清空缓存 
     */
    public function public_deletecache() {

        //import('@.ORG.Util.Dir');
		
        //缓存文件夹地址
        $Cachepath = RUNTIME_PATH;
        $Dir = new Dir();
        $Dir->listFile($Cachepath . "Cache/", "*");
		
		
        $DrarrayCache = $Dir->toArray();
		
        foreach ($DrarrayCache as $v) {
            $Dir->delDir($v['pathname']);
        }
        $Dir->del($Cachepath);
		
        $Dir->del($Cachepath."Logs/");
        if(is_file($Cachepath."Data/")){
            $Dir->del($Cachepath."Data/");
        }
		D('Fxmenu')->Menulistarray();		
		
		$this->assign("jumpUrl", U("Main/public_index"));
        $this->success("缓存更新成功！");
    }

    /**
     * 维持 session 登陆状态
     */
    public function public_session_life() {
        $userid = session(C("USER_AUTH_KEY"));
        return true;
    }
	
	public function public_checking_ukey(){
		
		$SerialNumber = trim($_GET['SerialNumber']);
		if($_SESSION['UserID'] != 1){
			if(!$SerialNumber){
				$msg['success'] = 2;  //未插入Ukey
				service("Passport")->logoutLocal();
			}else{
				$pass = M('admin_ukey')->where(" SerialNumber = '$SerialNumber' and uid = '$_SESSION[UserID]' and type = 1 ")->find();
				if($pass){
					$msg['success'] = 1;  //验证通过
				}else{
					$msg['success'] = 3;  //失败
					service("Passport")->logoutLocal();
				}
			}
		}else{ //Admin用户不需要验证ukey
			$msg['success'] = 1;  //验证通过
		}
		echo json_encode($msg);
	}

    /**
     * 添加快捷入口 
     */
    public function public_ajax_add_panel() {
        //菜单ID
        $menuid = isset($_POST['menuid']) ? $_POST['menuid'] : exit('0');
        $menuarr = M("Menu")->where(array("id" => $menuid))->find();
        $url = '?g=' . $menuarr['app'] . '&m=' . $menuarr['model'] . '&a=' . $menuarr['action'] . '&' . $menuarr['data'];
        $data = array('menuid' => $menuid, 'userid' => $this->Cache['uid'], 'name' => $menuarr['name'], 'url' => $url, 'datetime' => time());
        //添加快捷菜单到数据库
        M("Admin_panel")->add($data, array(), true);
        //读取
        $panelarr = M("Admin_panel")->where(array("userid" => $this->Cache['uid']))->select();
        foreach ($panelarr as $v) {
            echo "<span><a onclick='paneladdclass(this);' target='right' href='" . $v['url'] . '&menuid=' . $v['menuid'] . "'>" . $v['name']. "</a>  <a class='panel-delete' href='javascript:delete_panel(" . $v['menuid'] . ");'></a></span>";
        }
        exit;
    }

    /**
     * 删除快捷入口 
     */
    public function public_ajax_delete_panel() {
        //菜单ID
        $menuid = isset($_POST['menuid']) ? $_POST['menuid'] : exit('0');
        M("Admin_panel")->where(array("menuid" => $menuid, 'userid' => $this->Cache['uid']))->delete();
        //读取
        $panelarr = M("Admin_panel")->where(array("userid" => $this->Cache['uid']))->select();
        foreach ($panelarr as $v) {
            echo "<span><a onclick='paneladdclass(this);' target='right' href='" . $v['url'] . '&menuid=' . $v['menuid'] . "'>" . $v['name'] . "</a>  <a class='panel-delete' href='javascript:delete_panel(" . $v['menuid'] . ");'></a></span>";
        }
        exit;
    }	
	

}

?>
