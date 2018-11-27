<?php
/**
 * Created by PhpStorm.
 * User: kakak
 * Date: 11/23/2018
 * Time: 10:56 AM
 */

namespace Zs\Admin\Controllers;
use Phalcon\Mvc\Controller;


class PaymentController extends Controller
{
    public function initialize(){
        if(!$this->session->has('username')){
            $this->response->redirect('admin/index/login');
        }
    }
    public function indexAction()
    {

    }
}