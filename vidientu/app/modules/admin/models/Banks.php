<?php
/**
 * Created by PhpStorm.
 * User: kakak
 * Date: 11/28/2018
 * Time: 3:46 PM
 */

namespace Zs\Admin\Models;


use Zs\Library\Core\Db;

class Banks extends Db
{
    private $_DBName ='ngan_hang';
    public function initialize(){
        parent::__construct();
    }
    public function getListBank(){
//       $this->createID('tai_khoan','MaTK');

        return $this->select($this->_DBName,[]);
    }

}