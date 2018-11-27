<?php
$router =new \Phalcon\Mvc\Router();
//$router->setDefaultModule('admin');
//$router->add('/:controller/:action(/)*',[
//   'module'=>'admin',
//   'controller'=>1,
//   'action'=>2
//]);
$router->add('/:module/:controller/:action(/)*',[
   'module'=>1,
   'controller'=>2,
   'action'=>3
]);

$router->add('/',[
   'module'=>'admin',
   'controller'=>'index',
   'action'=>'index'
]);
//$router->add('/profile(.html)*',[
//   'module'=>'admin',
//   'controller'=>'index',
//   'action'=>'profile'
//]);
//$router->add('/:controller/select-page(.html)*',[
//   'module'=>'admin',
//   'controller'=>1,
//   'action'=>'selectpage'
//]);
//$router->add('/:controller/:action(/:params)*',[
//   'module'=>'admin',
//   'controller'=>1,
//   'action'=>2,
//    'params'=>3,
//
//]);
//
//$router->add('/profile(.html)*',[
//   'module'=>'admin',
//   'controller'=>'index',
//   'action'=>'profile'
//]);
//$router->add('/login(.html)*',[
//   'module'=>'admin',
//   'controller'=>'login',
//   'action'=>'index'
//]);

return $router;

