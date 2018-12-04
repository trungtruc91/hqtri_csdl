<?php
namespace Zs\Admin\Controllers;

use Phalcon\Mvc\Controller;
use Zs\Admin\Models\Banks;
use Zs\Admin\Models\Users;
class IndexController extends Controller
{
    public function initialize(){
        session_start();

    }
    public function indexAction(){
        if(!$this->session->has('username')){
            $this->response->redirect('admin/index/login');
        }
    }
    public function registerAction()
    {
        $modelBanks=new Banks();
        $modelUser=new Users();
        $result=$modelBanks->getListBank();
        if($this->request->isPost()){
            $arrParams=$this->request->get();
            $check=0;
            foreach ($arrParams as $item) {
                if(empty($item['user'])){
                    $check++;
                }
            }
            if($check==0){
                if($arrParams['user']['password'] != $arrParams['user']['rePass']){
                    $this->flash->error('Retype password not match!');
                }else{
                    $modelUser->saveAccountRegister($arrParams);
                }
            }else{
                $this->flash->message('error','Fill out full form!');
            }

        }

        $this->view->listBank=$result;
        $this->view->setMainView('index/mainLayout');

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
        $this->view->setMainView('index/mainLayout');

    }
    public function logoutAction(){
        if($this->session->has('username')){
            $this->session->remove('username');
            $this->response->redirect('admin/index/login');
        }
    }
}