<?php

use application\models\ParseData;

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $model = new Application_Model_DbTable_Currencies();

//        $xmlData = file_get_contents('https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange');
//        $xml = simplexml_load_string($xmlData);

//        $i = 0;
//        foreach($xml->currency as $val){
//
//            if($i > 20){
//                break;
//            }
//            $model->addCurrency($val->r030, $val->txt, $val->rate, $val->cc, date('Y-m-d', strtotime($val->exchangedate)));
//            $i++;
//        }

        $this->view->currencies = $model->fetchAll();
    }

    public function calculateAction()
    {
        if ($this->getRequest()->isPost()) {

            $data = $this->getRequest()->getPost();

            $model = new Application_Model_DbTable_Currencies();

            $from = $model->getOne($data['from']);
            $from_count = $data['from_count'];
            $to = $model->getOne($data['to']);

            $numerator = $from_count ? $from_count * $from['rate']: $from['rate'];

            $res = $numerator / $to['rate'];

            $this->_helper->json(['res' => round($res, 2), 'success' => true]);
        }
        $this->_helper->json(['success' => false, 'msg' => 'error']);
    }

    public function addAction()
    {
        // action body
    }


}



