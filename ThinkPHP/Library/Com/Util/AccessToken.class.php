<?php
include("caches.class.php");
class AccessToken{
    /*
	 * 构造函数
	 */
	function __construct()
	{
	
	}
	//获取GetAccessToken
	public function GetAccessToken($appid,$appsecret){
		caches::setCachePrefix('AccessToken'.$appid); //设置缓存文件前缀
		caches::setCacheDir(getcwd().'/Application/Runtime/Data'); //设置存放缓存文件夹路径
		caches::setCacheMode(2); 
		if(!$return_arr = caches::get('AccessToken'))
		{
			  $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret;
			  $return_db = json_decode($this->curlGet2($url));
			  if($return_db->access_token){
				  $return_arr = caches::set('AccessToken',$return_db->access_token);
			  }
		}		

		return $return_arr;
	}
	//当时间没到AccessToken错误时执行
	public function GetAccessTokenNew($appid,$appsecret){
	    caches::setCachePrefix('AccessToken'.$appid); //设置缓存文件前缀
		caches::setCacheDir(getcwd().'/Application/Runtime/Data'); //设置存放缓存文件夹路径
		caches::setCacheMode(2); 
	    $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret;
		$return_db = json_decode($this->curlGet2($url));
		if($return_db->access_token){
			$return_arr = caches::set('AccessToken',$return_db->access_token);
		}
		return $return_arr;
	}
	//get提交
	public function curlGet2($url){
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
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			$temp = curl_exec($ch);
			return $temp;
     }
}
?>