<?php
$application = new Phalcon\Mvc\Application($di);
$application->registerModules([
    'admin'=>[
        'className' =>'Zs\Admin\Module',
        'path'=> MODULE_PATH.'/admin/Module.php'
    ]
]);

// Handle the request
$response = $application->handle();
$response->send();