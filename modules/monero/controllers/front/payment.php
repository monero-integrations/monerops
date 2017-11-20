<?php
include(dirname(__FILE__). '/../../library.php');
class moneropaymentModuleFrontController extends ModuleFrontController
{
  public $ssl = false;
  public $display_column_left = false;
  /**
   * @see FrontController::initContent()
   */
  private $monero_daemon;
           
 public function initContent() {
        parent::initContent();
	
		global $currency;
        $cart = $this->context->cart;
      	$c = $currency->iso_code;
		$total = $cart->getOrderTotal();
		$amount = $this->changeto($total, $c);
		$actual = $this->retriveprice($c);
		$payment_id  = $this->set_paymentid_cookie();
		$uri = "monero:$address?tx_amount=$amount?tx_payment_id=$payment_id";
		$status = "Awaiting Confirmation...";
		
		$address = Configuration::get('MONERO_ADDRESS');
		$daemon_address = Configuration::get('MONERO_WALLET');
		
		$this->monero_daemon = new Monero_Library('http://'. $daemon_address .'/json_rpc'); // example $daemon address 127.0.0.1:18081
		
		$integrated_address_method = $this->monero_daemon->make_integrated_address($payment_id);
		$integrated_address = $integrated_address_method["integrated_address"];
		
		if($this->verify_payment($payment_id, $amount))
		{
			$status = "Your Payment has been confirmed!";
			header("Location: index.php?fc=module&module=monero&controller=validation");
			
		}
		
		$this->context->smarty->assign(array(
            'this_path_ssl'   => Tools::getShopDomainSsl(true, true) . __PS_BASE_URI__ . 'modules/' . $this->module->name . '/',
				'address' => $address,
				'amount' => $amount,
				'uri' => $uri,
				'status' => $status,
				'integrated_address' => $integrated_address ));
		$this->setTemplate('payment_execution.tpl');
		
		echo "<script type='text/javascript'>
				setTimeout(function () { location.reload(true); }, 30000);
			  </script>";
    }

 
	private function set_paymentid_cookie()
				{
					if(!isset($_COOKIE['payment_id']))
					{ 
						$payment_id  = bin2hex(openssl_random_pseudo_bytes(8));
						setcookie('payment_id', $payment_id, time()+2700);
					}
					else
						$payment_id = $_COOKIE['payment_id'];
					return $payment_id;
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
	
	public function verify_payment($payment_id, $amount)
	{
      /* 
       * function for verifying payments
       * Check if a payment has been made with this payment id then notify the merchant
       */
      
      $amount_atomic_units = $amount * 1000000000000;
      $get_payments_method = $this->monero_daemon->get_payments($payment_id);
      if(isset($get_payments_method["payments"][0]["amount"]))
      { 
		if($get_payments_method["payments"][0]["amount"] >= $amount_atomic_units)
		{
			$confirmed = true;
		}  
	  }
	  else
	  {
		  $confirmed = false;
	  }
	  return $confirmed;
  }
	
}
