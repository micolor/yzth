<?php
namespace Appframe;
use Appframe\AppframeController;
use Com\Util\Page;
class WapController extends BaseController {

    function _initialize() {
        parent::_initialize();
		$this->assign("waitSecond", 2);
		
		if(strpos($_SERVER['HTTP_USER_AGENT'],"MicroMessenger")) {
			$this->weixin_browser = 1;
		}else{
			$this->weixin_browser = 0;
			//echo '只能在微信端打开';
			//die();
		}
		$this->weixin_config = array('appid'=>'wx28eaf860364cda82','appsecret'=>'de57e07e24485c32db1928b0129e81f0');
    }

	//获取当前的地址
	public function get_url(){
		$sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
		$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
		$path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
		$relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
		return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
	}

	//微信分享
	function wx_get_jsapi_ticket(){  
	    $appid     = $this->weixin_config['appid'];
		$appsecret = $this->weixin_config['appsecret'];
		$ticket = "";   
		do{     
		    $ticket = S('wx_ticket_'.$appid);    
		if (!empty($ticket)) {       
			break;    
		}     
		import("Com.Util.AccessToken");
	    $AccessTokenDB = new \AccessToken();
	 	$AccessToken =$AccessTokenDB->GetAccessToken($appid,$appsecret);
	 	$url2 = sprintf("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi",$AccessToken);   
		$res = file_get_contents($url2);    
		$res = json_decode($res, true);    
		$ticket = $res['ticket'];   
		S('wx_ticket_'.$appid, $ticket, 3600);  
		}
		while(0);  
		return $ticket;
	}

	/**
	 *
	 * 通过跳转获取用户的openid，跳转流程如下：
	 * 1、设置自己需要调回的url及其其他参数，跳转到微信服务器https://open.weixin.qq.com/connect/oauth2/authorize
	 * 2、微信服务处理完成之后会跳转回用户redirect_uri地址，此时会带上一些参数，如：code
	 *
	 * @return 用户的openid
	 */
	public function GetOpenid()
	{ 
		$backurl='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']; 
		//通过code获得openid
		if (!isset($_GET['code'])){
			//触发微信返回code码
			cookie("gobak",$backurl);
			$baseUrl = urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].$_SERVER['QUERY_STRING']);
			$url = $this->__CreateOauthUrlForCode($baseUrl);
			Header("Location: $url");
			exit();
		} else {

			//获取code码，以获取openid
			$code = $_GET['code'];
			$openid = $this->getOpenidFromMp($code);
			cookie('weixin_openid',$openid);
			Header("Location: ".	cookie("gobak"));
			exit();
        }
	}

	/*写入用户信息*/
	public function WriteUinfo($openid)
	{
	  $appid = $this->weixin_config['appid'];
	  $appsecret = $this->weixin_config['appsecret'];
	  import("Com.Util.AccessToken");
	  $AccessTokenDB = new \AccessToken();
	  $AccessToken = $AccessTokenDB->GetAccessToken($appid, $appsecret);
	  $url = $this->__CreateOauthUrlForUser($AccessToken,$openid);
	  $userinfo = json_decode($this->curlGet($url));
	  if ($userinfo->errcode == '40001') {
		  $AccessToken = $AccessTokenDB->GetAccessTokenNew($appid, $appsecret); //获取新的AccessToken
		  $url = $this->__CreateOauthUrlForUser($AccessToken,$openid);
	  $userinfo = json_decode($this->curlGet($url));
	  }
	  if ($userinfo->openid) {
		  $nickname = $userinfo->nickname ? trim($userinfo->nickname) : '';
		  $wxopenid = $userinfo->openid;
		  $headimgurl = $userinfo->headimgurl;
		  cookie('nickname',$nickname);
		  cookie('headimgurl',$headimgurl);
		  $data = array();
		  $data['nickname'] = $nickname;
		  $data['out_id'] = $userinfo->unionid;
		  $data['out_info'] = serialize($userinfo);
		  $data['type'] = '1';
		  $data['headimgurl'] = $headimgurl;
		  $data['wxopenid'] = $wxopenid;
		  $data['addtime'] =time();
		  $pass = M("wx_member_bind")->where("wxopenid='{$data['wxopenid']}'")->find();
		  if (!$pass) {
			  M("wx_member_bind")->add($data);
		  }
	  }
	}

  /**
 *
 * 构造获取用户url连接
 *
 * @return 返回构造好的url
 */
	private function __CreateOauthUrlForUser($access_token,$openid)
	{
		$urlObj["access_token"] =$access_token;
		$urlObj["openid"] = $openid;
		$urlObj["lang"] = 'zh_CN';
		$bizString = $this->ToUrlParams($urlObj);
		return 'https://api.weixin.qq.com/cgi-bin/user/info?'.$bizString;
	}
	/**
	 *
	 * 构造获取code的url连接
	 * @param string $redirectUrl 微信服务器回跳的url，需要url编码
	 *
	 * @return 返回构造好的url
	 */
	private function __CreateOauthUrlForCode($redirectUrl)
	{
		$urlObj["appid"] =$this->weixin_config['appid'];
		$urlObj["redirect_uri"] = "$redirectUrl";
		$urlObj["response_type"] = "code";
		$urlObj["scope"] = "snsapi_base";
		$urlObj["state"] = "STATE"."#wechat_redirect";
		$bizString = $this->ToUrlParams($urlObj);
		return "https://open.weixin.qq.com/connect/oauth2/authorize?".$bizString;
	}
	/**
	 *
	 * 通过code从工作平台获取openid机器access_token
	 * @param string $code 微信跳转回来带上的code
	 *
	 * @return openid
	 */
	public function GetOpenidFromMp($code)
	{
		$url = $this->__CreateOauthUrlForOpenid($code);
		//运行curl，结果以jason形式返回
		$res=$this->curlGet($url);
		//取出openid
		$data = json_decode($res,true);
		S("wx_data_". $data['openid'],$data,'3600');
		$openid = $data['openid'];
		return $openid;
	}

	function curlGet($url){
		$ch = curl_init();
		$header = "Accept-Charset: utf-8";
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
		curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$temp = curl_exec($ch);
		curl_close($ch);
		return $temp;
	}

	/**
	 *
	 * 构造获取open和access_toke的url地址
	 * @param string $code，微信跳转带回的code
	 *
	 * @return 请求的url
	 */
	private function __CreateOauthUrlForOpenid($code)
	{
		$urlObj["appid"] = $this->weixin_config['appid'];
		$urlObj["secret"] = $this->weixin_config['appsecret'];
		$urlObj["code"] = $code;
		$urlObj["grant_type"] = "authorization_code";
		$bizString = $this->ToUrlParams($urlObj);
		return "https://api.weixin.qq.com/sns/oauth2/access_token?".$bizString;
	}

	/**
	 *
	 * 拼接签名字符串
	 * @param array $urlObj
	 *
	 * @return 返回已经拼接好的字符串
	 */
	private function ToUrlParams($urlObj)
	{
		$buff = "";
		foreach ($urlObj as $k => $v)
		{
			if($k != "sign"){
				$buff .= $k . "=" . $v . "&";
			}
		}
		$buff = trim($buff, "&");
		return $buff;
	}


}
?>