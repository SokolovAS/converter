<?php


class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $model = new Application_Model_DbTable_Currencies();
        $history = new Application_Model_DbTable_History();

        $this->view->currencies = $model->fetchAll();
        $this->view->history = $history->getLast();
    }

    public function calculateAction()
    {
        if ($this->getRequest()->isPost()) {

            $data = $this->getRequest()->getPost();
            $model = new Application_Model_DbTable_Currencies();

            if(! $model->cache()->test('is_actual')){

                $model->updateAll();
            }

            $from = $model->getOne($data['from']);
            $from_count = $data['from_count'];
            $to = $model->getOne($data['to']);

            $numerator = $from_count ? $from_count * $from['rate']: $from['rate'];

            $res = $numerator / $to['rate'];
            $res = number_format($res, 2);

            $history = new Application_Model_DbTable_History();

            $last_deals = $history->getLast();

            $history->add($from['id'], $to['id'], $res);

            $this->_helper->json(['res' => $res, 'success' => true, 'history' => $last_deals]);
        }
        $this->_helper->json(['success' => false, 'msg' => 'error']);
    }

}



