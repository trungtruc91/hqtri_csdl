<?php
/**
 * Created by PhpStorm.
 * User: kakak
 * Date: 11/26/2018
 * Time: 1:58 PM
 */

namespace Zs\Admin\Controllers;


use Phalcon\Mvc\Controller;
use Zs\Admin\Models\Users;

class UserController extends Controller
{
    public function initialize(){
        if(!$this->session->has('username')){
            $this->response->redirect('admin/index/login');
        }
    }
    public function profileAction(){
        $id=$this->session->get('user_id');
        $modelUser=new Users();
        if ($this->request->isPost()){
            $arrParams=$this->request->get();
            $arrParams['info']['id']=$id;
            $modelUser->updateInfo($arrParams);
        }
        $result=$modelUser->getDataById($id);
        $this->view->info=$result[0];
    }
}