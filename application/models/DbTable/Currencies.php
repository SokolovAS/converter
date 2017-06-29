<?php

class Application_Model_DbTable_Currencies extends Zend_Db_Table_Abstract
{

    protected $_name = 'currencies';


    public function addCurrency($r030, $txt, $rate, $cc, $exchange_date)
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
}

