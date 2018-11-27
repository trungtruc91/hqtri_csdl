<?php
namespace Zs\Admin\Controllers;

use Phalcon\Mvc\Controller;
use Zs\Admin\Models\Users;
class IndexController extends Controller
{
    public function initialize(){


    }
    public function indexAction()
    {

    }
    public function loginAction(){
        if ($this->request->isPost()) {
            $arrParam = $this->request->get();
            $username = $arrParam['username'];
            $pass = $arrParam['password'];
            $modelUser = new Users();
            $result = $modelUser->checkUser($username, $pass);
            if (!empty($result)) {
                $this->session->set('user_id',$result[0]['MaTK']);
                $this->session->set('username',$username);
                $this->response->redirect('admin/index/index');
            }
        }
        $this->view->setMainView('index/login');
    }
    public function logoutAction(){
        if($this->session->has('username')){
            $this->session->remove('username');
            $this->response->redirect('admin/index/login');
        }
    }
}