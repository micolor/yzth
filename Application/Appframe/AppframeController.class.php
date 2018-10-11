<?php
namespace Appframe;
use Think\Controller;
use Com\Util\Input;
class AppframeController extends Controller {

    //各种缓存 比如当前登陆用户信息等
    protected $Cache = array();


    function _initialize() {
        //初始化站点配置信息
        $this->initSite();      
        //载入Input处理类
        //数据处理
        $this->__input();
        //跳转时间
        $this->assign("waitSecond", 2000);
		$this->assign("TEMPpath","./Home/tpl/Admin/Common/");
    }

    /**
     * 对 get post 等进行处理
     */
    final private function __input() {
        $_POST   = $this->app__post($_POST);
        $_GET    = $this->app__post($_GET);
        $_COOKIE = $this->app__post($_COOKIE);
    }

    /**
     *  数据处理
     */
    final private function app__post($post) {
        if (!is_array($post)) {
            return $post;
        }
        foreach ($post as $k => $v) {
            if (is_array($v)) {
                $post[$k] = $this->app__post($v);
            } else {
                $post[$k] = Input::getVar($v);
            }
        }
        return $post;
    }




    /**
     * 初始化站点配置信息
     */
    final protected function initSite() {
        $Config = F("Config");
        if (!$Config) {
            $Config = M("Config")->getField("varname,value");
            F("Config", $Config);
        }
        $this->Cache['Config'] = $Config;
        foreach ($this->Cache['Config'] as $k => $v) {
            define('CONFIG_' . strtoupper($k), $v);
        }
        $this->assign("Config", $Config);
        //分配当前操作名到模板  使用$Think.ACTION_NAME有时会有意外情况
        $appinfo = array(
            "action" => ACTION_NAME,
            "group" => CONTROLLER_NAME,
            "module" => MODULE_NAME
        );
        $this->assign("appinfo", $appinfo);
    }


    /**
     * Cookie 设置、获取、删除 
     */
    final static public function cookie($name, $value = '', $option = null) {
        // 默认设置
        $config = array(
            'prefix' => C('COOKIE_PREFIX'), // cookie 名称前缀
            'expire' => C('COOKIE_EXPIRE'), // cookie 保存时间
            'path' => C('COOKIE_PATH'), // cookie 保存路径
            'domain' => C('COOKIE_DOMAIN'), // cookie 有效域名
        );
        // 参数设置(会覆盖黙认设置)
        if (!empty($option)) {
            if (is_numeric($option))
                $option = array('expire' => $option);
            elseif (is_string($option))
                parse_str($option, $option);
            $config = array_merge($config, array_change_key_case($option));
        }
        // 清除指定前缀的所有cookie
        if (is_null($name)) {
            if (empty($_COOKIE))
                return;
            // 要删除的cookie前缀，不指定则删除config设置的指定前缀
            $prefix = empty($value) ? $config['prefix'] : $value;
            if (!empty($prefix)) {// 如果前缀为空字符串将不作处理直接返回
                foreach ($_COOKIE as $key => $val) {
                    if (0 === stripos($key, $prefix)) {
                        setcookie($key, '', time() - 3600, $config['path'], $config['domain']);
                        unset($_COOKIE[$key]);
                    }
                }
            }
            return;
        }
        $name = $config['prefix'] . $name;
        if ('' === $value) {
            $value = isset($_COOKIE[$name]) ? $_COOKIE[$name] : null; // 获取指定Cookie
            return authcode($value, "DECODE", C("AUTHCODE"));
        } else {
            if (is_null($value)) {
                setcookie($name, '', time() - 3600, $config['path'], $config['domain']);
                unset($_COOKIE[$name]); // 删除指定cookie
            } else {
                //$value 加密
                $value = authcode($value, "", C("AUTHCODE"));
                // 设置cookie
                $expire = !empty($config['expire']) ? time() + intval($config['expire']) : 0;
                setcookie($name, $value, $expire, $config['path'], $config['domain']);
                $_COOKIE[$name] = $value;
            }
        }
    }

    /**
     * 写入操作日志
     * @param type $info 操作说明
     * @param type $status 状态,1为写入，2为更新，3为删除
     * @param type $data 数据
     * @param type $options 条件
     */
    final public function addLogs($info, $status = 1, $data = array(), $options = array()) {
        $uid = $this->Cache['uid'];
        $data = serialize($data);
        $options = serialize($options);
        $get = $_SERVER['HTTP_REFERER'];
        $post = "";
        M("fxoperationlog")->add(array(
            "uid" => $uid,
            "time" => date("Y-m-d H:i:s"),
            "ip" => get_client_ip(),
            "status" => $status,
            "info" => $info,
            "data" => $data,
            "options" => $options,
            "get" => $get,
            "post" => $post
        ));
    }

    /**
     * 验证码验证
     * @param type $verify 
     */
    static public function verify($verify) {

        if ($_SESSION['code'] == strtolower($verify)){
            unset($_SESSION['code']);
            return true;
        } else {
            return false;
        }
    }
	
/**
  *
  * 获取用户IP
  *
  */
    static public function getip(){
		
		  if(getenv('HTTP_CLIENT_IP')){
			  $onlineip=getenv('HTTP_CLIENT_IP');
		  }else if(getenv('HTTP_X_FORWARDED_FOR')){
			  $onlineip=getenv('HTTP_X_FORWARDED_FOR');
		  }else if(getenv('REMOTE_ADDR')){
			  $onlineip=getenv('REMOTE_ADDR');
		  }else{
			  $onlineip=$_SERVER['REMOTE_ADDR'];
		  }
		  return $onlineip;
	 }
/**
  *
  * 关闭dialog弹窗
  *
  */	 
   public function close_dialog($id='add'){
	   echo '<script style="text/javascript">
	  setTimeout("window.top.right.location.reload();window.top.art.dialog({id:\"'.$id.'\"}).close();",2000); 
	   </script>';		 
	 }

}
?>