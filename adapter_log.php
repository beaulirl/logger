<?php

interface LoggerInterface
{
    public function log($message, $level);
    
}

class Logger implements LoggerInterface
{

    protected $adapter;
     
    public function __construct(LoggerAdapter $adapter)
    {
        $this->setAdapter($adapter);
    }
    public function log($message, $level)
    {
        $this->adapter->log($message, $level);
    }
    public function getAdapter()
    {
         return $this->adapter;
    }
    public function setAdapter(LoggerAdapter $adapter)
    {
        $this->adapter = $adapter;
    }

}

abstract class LoggerAdapter implements LoggerInterface
{
    const ERROR = 0;
    const DEBUG = 1;
    const MESSAGE = 2;

     public function log($message, $level)
    {
        $this->adapter->log($message, $level);
    }

}

class FileLogerAdapter extends LoggerAdapter
{
    public function log($message, $level)
    {
        
        $filename = ConfigurationManager::get('filename');
        if( ($time = $_SERVER['REQUEST_TIME']) == '') {
            $time = time();
        }
        if( ($remote_addr = $_SERVER['REMOTE_ADDR']) == '') {
            $remote_addr = "REMOTE_ADDR_UNKNOWN";
        }
        if( ($request_uri = $_SERVER['REQUEST_URI']) == '') {
            $request_uri = "REQUEST_URI_UNKNOWN";
        }
        $date = date("Y-m-d H:i:s", $time);
        if($fd = @fopen($filename, "a")) {
            $result = fputcsv($fd, array($date, $remote_addr, $request_uri, $message, $level));
            fclose($fd);       
         }
    }
}
class MySQLLoggerAdapter extends LoggerAdapter
{
    public function log($message, $level)
     {
        $host = ConfigurationManager::get('db_host');
        $user = ConfigurationManager::get('db_user');
        $password = ConfigurationManager::get('db_passw');
        $dbname = ConfigurationManager::get('db_name');   
        $db = mysqli_connect($host, $user, $password, $dbname);
        $table_name = ConfigurationManager::get('db_tbname'); 
        if( ($remote_addr = $_SERVER['REMOTE_ADDR']) == '') {
            $remote_addr = "REMOTE_ADDR_UNKNOWN";
        }
        if( ($request_uri = $_SERVER['REQUEST_URI']) == '') {
            $request_uri = "REQUEST_URI_UNKNOWN";
        }
        $message     = $db->escape_string($message);
        $remote_addr = $db->escape_string($remote_addr);
        $request_uri = $db->escape_string($request_uri);
        $sql = "INSERT INTO ".$table_name." (remote_addr, request_uri, message) VALUES('$remote_addr', '$request_uri','$message - ".$level."')";
        $result = $db->query($sql);
    }
}
class  StdOutLoggerAdapter  extends LoggerAdapter
{

    public function log($message, $level)
     {
         $fp = fopen("php://stdout", 'w');
         fputs($fp, $message.$level);
         rewind($fp);
         echo stream_get_contents($fp);
    }
    
}
class ConfigurationManager
{
    const SETTINGS_FILE='config.php';

    public static function get($key)
    {
        $config = require(static::SETTINGS_FILE);
        return $config[$key];
    }

}

$b = new FileLogerAdapter();
$a = new Logger($b);
$a->log('Something happened', LoggerAdapter::ERROR);
$c = new  MySQLLoggerAdapter();
$d = new Logger($c);
$d->log('Something happened', LoggerAdapter::ERROR);
$e = new StdOutLoggerAdapter();
$f = new Logger($e);
$f->log('Something happened', LoggerAdapter::ERROR);
