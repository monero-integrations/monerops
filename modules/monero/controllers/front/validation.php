<?php
class moneroValidationModuleFrontController extends ModuleFrontController
{
        /**
         * @see FrontController::postProcess()
         */
	public function postProcess()
        {	
        	// Here will be the validation 
        	// Simple, same algoritm
               $this->setTemplate('confirmation.tpl');
        }
}
