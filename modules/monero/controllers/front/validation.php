<?php
include(dirname(__FILE__). '/../../library.php'); 
class moneroValidationModuleFrontController extends ModuleFrontController
{
        /**
         * @see FrontController::postProcess()
         */
	public function postProcess()
        {	
        	global $currency;
        $cart = $this->context->cart;
      	$c = $currency->iso_code;
	$total        = $cart->getOrderTotal();
	$amount = $this->changeto($total, $c);
	$actual = $this->retriveprice($c);
	$address = Configuration::get('MONERO_ADDRESS');
	$payment_id  = bin2hex(openssl_random_pseudo_bytes(8));
	$uri = 'monero:'.$address.'?amount='.$amount.'?payment_id'.$payment_id;
	$url = Configuration::get('MONERO_WALLET');
 	$this->monero_wallet = new Monero_library($url,'','','');
 	$array_integrated_address = $this->monero_wallet->make_integrated_address($payment_id);
        $this->context->smarty->assign(array(
            'this_path_ssl'   => Tools::getShopDomainSsl(true, true) . __PS_BASE_URI__ . 'modules/' . $this->module->name . '/',
'amount' => $amount,
'uri'    => $uri,
'currency' => $c,
'actual' => $actual,
'address' => $address,
'payment_id' => $payment_id,
'integrated_address' => $array_integrated_address["integrated_address"]
        ));
        
               $this->setTemplate('payment_box.tpl');
        }
        
        

public function retriveprice($c)
				{
								$xmr_price = Tools::file_get_contents('https://min-api.cryptocompare.com/data/price?fsym=XMR&tsyms=BTC,USD,EUR,CAD,INR,GBP&extraParams=monero_woocommerce');
								$price         = json_decode($xmr_price, TRUE);
							
								if ($c== 'USD') {
												return $price['USD'];
								}
								if ($c== 'EUR') {
												return $price['EUR'];
								}
								if ($c== 'CAD'){
												return $price['CAD'];
								}
								if ($c== 'GBP'){
												return $price['GBP'];
								}
								if ($c== 'INR'){
												return $price['INR'];
								}
								else{
												//return $price['USD'];
								}
				}
				
				public function changeto($amount, $currency)
				{
								$xmr_live_price = $this->retriveprice($currency);
								$new_amount     = $amount / $xmr_live_price;
								$rounded_amount = round($new_amount, 12); //the moneo wallet can't handle decimals smaller than 0.000000000001
								return $rounded_amount;
				}
}
