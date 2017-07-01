<?php

class Application_Model_DbTable_Currencies extends Zend_Db_Table_Abstract
{

    protected $_name = 'currencies';

    protected $_dependentTables = array('Application_Model_DbTable_History');


    public function add($r030, $txt, $rate, $cc, $exchange_date)
    {
        $this->insert([
            'r030' => $r030,
            'txt' => $txt,
            'rate' => $rate,
            'cc' => $cc,
            'exchange_date' => $exchange_date
        ]);
    }

    public function getOne($id)
    {
        $row = $this->fetchRow('id = ' . (int)$id);
        if(!$row) {
            throw new Exception("Нет записи с id - $id");
        }

        return $row->toArray();
    }

    public function get()
    {
        $xmlData = file_get_contents('https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange');
        $xml = simplexml_load_string($xmlData);
        return $xml->currency;

//        try{
//
//            $i = 0;
//            foreach($xml->currency as $val){
//
//                if($i > 20) break;
//
//                $this->add($val->r030, $val->txt, $val->rate, $val->cc, date('Y-m-d', strtotime($val->exchangedate)));
//
//                $i++;
//            }
//
//            return true;
//
//        }catch(\Exception $e){
//
//            return $e->getMessage();
//        }

    }

    public function cache()
    {
        $oBackend = new Zend_Cache_Backend_Memcached(
            array(
                'cache_dir' => './tmp/'
            ) );

        $oFrontend = new Zend_Cache_Core(
            array(
                'lifetime' => 3600,
                'automatic_serialization' => true
            ) );

        return $oCache = Zend_Cache::factory( $oFrontend, $oBackend );
    }

    public function updateAll()
    {

        try{

            $data = $this->get();
            foreach($data as $val){

                $this->updateOne($val->r030, $val->rate);
            }

            return $this->cache()->save( true, 'is_actual');

        }catch(\Exception $e){

            return $e->getMessage();
        }

    }

    public function updateOne($r030, $rate)
    {
        $this->update(['rate' => $rate], 'r030 = ' . (int)$r030);
    }

}

