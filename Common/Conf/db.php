<?php
/**
 * 配置文件
 */
return array(
    'DB_TYPE' => 'mysql',     // 数据库类型
    'DB_HOST' => 'localhost', // 服务器地址
    'DB_NAME' => 'yzth',          // 数据库名
    'DB_USER' => 'root',      // 用户名
    'DB_PWD' => '1qaz@wsx',          // 密码
    'DB_PORT' => '3306',// 端口
    'DB_PREFIX' => 'mc_',// 数据库表前缀
    //密钥
    "AUTHCODE" => 'TOACUz462LIMvq79jB',
    // 业务系统
    'DB_BS' => array(
        'DB_TYPE' => 'mysql',
        'DB_HOST' => '121.43.108.228',
        'DB_PORT' => '3306',
        'DB_NAME' => 'jxgcdbtst',
        'DB_USER' => 'jxgc',
        'DB_PWD' => 'jxgc',
    )
);
?>
