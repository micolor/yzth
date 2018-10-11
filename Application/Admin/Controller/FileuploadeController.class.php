<?php
/**
 * Created by PhpStorm.
 * User: Ann
 * Date: 2015/10/2
 * Time: 15:06
 */
namespace Admin\Controller;
use Appframe\AdminbaseController;

class FileuploadeController extends AdminbaseController {
    public $thumburl = "/imageuploads/thumb/";    //图片网络路径
    public $thumbpath;    //图片存放位置
    function _initialize(){
        parent::_initialize();
        $this->thumbpath = SITE_PATH . $this->thumburl;
    }
    
    public function ajax_upload()
    {
        $thumburl = $this->thumburl;    //图片网络路径
        $path = $this->thumbpath;    //图片存放位置
         
        if (!empty($_FILES)) {
            //得到上传的临时文件流
            $tempFile = $_FILES['file']['tmp_name'];
            //允许的文件后缀
            $fileTypes = array('jpg', 'jpeg', 'gif', 'png');
            //得到文件原名
            $fileParts = pathinfo($_FILES['file']['name']);
            $fileName = microtime(true) . "." . $fileParts['extension'];    //以微秒时间命名
            //最后保存服务器地址
            if (!is_dir($path)) mkdir($path);
            $msg = array();
            if (move_uploaded_file($tempFile, $path . $fileName)) {
                $thumb = $thumburl . $fileName;
                $msg['msg'] = "success";
                $msg['src'] = $thumb;//生成地址
            } else {
                $msg['msg'] = "error";
                $msg['src'] = null;
            }
            echo json_encode($msg);
        }
    }

    
}