<?php
namespace Zs\Admin\Models;
use Phalcon\Mvc\Model;
use Zs\Library\Core\Db;

class Users extends Db
{
    private $_DBName ='tai_khoan';
    public function initialize(){
        parent::__construct();
    }
    public function testDb(){
//      return  $this->insertOne('users',['','hhhh','123456']);
//      return  $this->updateOne('users',['username'=>"haohao",'password'=>"hao100"],['id'=>2]);
//      return  $this->delete('users',['id'=>2]);
// return $this->select('users',["username"=>"huyhao"]);
    }
    public function checkUser($username,$password){
        return $this->select($this->_DBName,["username"=>$username,'MatKhau'=>$password]);
    }
    public function getDataById($id){
        return $this->select($this->_DBName,['MaTK'=>$id]);
    }
}