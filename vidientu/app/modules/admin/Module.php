<?php

namespace Zs\Admin;

use Phalcon\Loader;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phalcon\Mvc\View;

class Module implements ModuleDefinitionInterface
{

    public function registerAutoloaders(\Phalcon\DiInterface $dependencyInjector = null)
    {
        // TODO: Implement registerAutoloaders() method.
        $loader = new Loader();

        $namespacesArr = [
            'Zs\Admin\Controllers' => MODULE_PATH . '/admin/controllers/',
            'Zs\Admin\Models' => MODULE_PATH . '/admin/models/'
        ];


        $loader->registerNamespaces($namespacesArr);
        $loader->register();
    }

    public function registerServices(\Phalcon\DiInterface $dependencyInjector)
    {
        // TODO: Implement registerServices() method.
        $dependencyInjector->set('dispatcher',function (){
           $dispatcher=new Dispatcher();
           $dispatcher->setDefaultNamespace("Zs\Admin\Controllers");
           return $dispatcher;
        });

        $dependencyInjector->set('view', function () {
            $view = new View();
            $view->setViewsDir(MODULE_PATH."/admin/views/");
            return $view;
        });
    }
}