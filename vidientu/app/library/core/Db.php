<?php
namespace Zs\Library\Core;
use Phalcon\Db\Adapter\Pdo\Mysql;
use function PHPSTORM_META\elementType;

class Db
{
    public $_con='';


    public function __construct()    {

        $config = new Config();
        $dbConfig = get_object_vars($config->getDb());
        $this->_con=new Mysql($dbConfig);
        $this->_con->connect();
    }

    public function select( $table, array $add){

        $query="SELECT * FROM $table ";
        $count=count($add);
        $stt=1;
        if($count>0){
            $where='';
            foreach ($add as $key => $item) {
              $where.=" $key = :$key ";

                if($count!=$stt){
                    $where.="AND";
                }
                $stt++;
            }
            $query.="WHERE $where";
        }

        $result=$this->_con->fetchAll($query,\Phalcon\Db::FETCH_ASSOC,$add);
        return $result;
    }
    public function insertOne($table,array $value){

        foreach ( $value as $item) {
            $var[]='?';
        }
        $query="INSERT INTO $table VALUES (".implode(',',$var).")";

        $success = $this->_con->execute(
            $query,
            $value
        );
        $notice=$this->_con->affectedRows().", were inserted";
        return $notice;
    }
    public function updateOne($table,array $set,array $add){
        $set=$this->arrayToStrQuery(',',$set);

        $count=count($add);
        if($count>0){
            $where= $this->arrayToStrQuery('AND',$add);

        }
        $query="UPDATE $table SET $set WHERE $where";

        $this->_con->execute($query);
        $notice=$this->_con->affectedRows().", were updated";
        return $notice;
    }
    public function delete($table,$add){
        $where = $this->arrayToStrQuery('AND',$add);
        $query="DELETE FROM $table WHERE $where";

        $this->_con->execute($query);
        $notice=$this->_con->affectedRows().", were deleted";
        return $notice;
    }
    public function arrayToStrQuery(string $glue,$arr){

        $count=count($arr);
        $stt=1;
        $where='';
        foreach ($arr as $key => $item) {

            if(gettype($item)=='string'){
                $item ="'".$item."'";
            }
            $where.="$key = $item";
            if($count!=$stt){
                $where.=$glue;
            }
            $stt++;
        }

        return $where;
    }


}