<?php

class Application_Model_DbTable_History extends Zend_Db_Table_Abstract
{

    protected $_name = 'history';

    protected $_referenceMap    = array(
        'In' => array(
            'columns'           => 'id_currency_in',
            'refTableClass'     => 'Application_Model_DbTable_Currencies',
            'refColumns'        => 'id'
        ),
        'Out' => array(
            'columns'           => 'id_currency_out',
            'refTableClass'     => 'Application_Model_DbTable_Currencies',
            'refColumns'        => 'id'
        ),
    );

    public function getOne($id)
    {
        $row = $this->fetchRow('id = ' . (int)$id);
        if(!$row) {
            throw new Exception("Нет записи с id - $id");
        }

        return $row->toArray();
    }

    public function add($id_currency_in, $id_currency_out, $result)
    {

        return $this->insert([
            'id_currency_in' => $id_currency_in,
            'id_currency_out' => $id_currency_out,
            'result' => $result
        ]);


    }

    public function getLast()
    {
        $db = new Zend_Db_Adapter_Pdo_Mysql(array(
            'host'     => '127.0.0.1',
            'username' => 'root',
            'password' => '',
            'dbname'   => 'curs'
        ));

        $stmt = $db->query(
            'SELECT h.*, T1.cc as currency_in, T2.cc as currency_out FROM history as h,
            (SELECT id, cc FROM currencies) T1,
            (SELECT id, cc FROM currencies) T2
            WHERE T1.id = h.id_currency_in AND T2.id = h.id_currency_out
            ORDER BY created_at DESC limit 5'
        );

        return $stmt->fetchAll();
    }

}

