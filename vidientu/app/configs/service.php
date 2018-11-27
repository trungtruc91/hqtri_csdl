<?php

use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\Session\Adapter\Files as Session;

$di = new Phalcon\Di\FactoryDefault();

//set module default
$di->set('router',function (){
   return include_once CONFIG_PATH."/router.php";
});
// Setup the database service
//$di->set(
//    'db',
//
//    function () {
//        return new DbAdapter(
//            [
//                'host'     => '210.211.111.86',
//                'username' => 'cvdflutxhosting',
//                'password' => 'iN3TfOUCfFqp',
//                'dbname'   => 'cvdflutxhosting_news_manager',
//            ]
//        );
//    }
//
//);
$di->setShared(
    'session',
    function () {
        $session = new Session();

        $session->start();

        return $session;
    }
);
$di->setShared('zs_configs', function () use ($di) {
    $configPath = CONFIG_PATH . '/configs.php';
    $configs = new Phalcon\Config\Adapter\Php($configPath);
    return $configs;
});



// Setup a base URI so that all generated URIs include the "tutorial" folder
$di->set(
    'url',
    function () {
        $url = new UrlProvider();
        $url->setBaseUri('/');
        return $url;
    }
);