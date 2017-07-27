<?php

use PrestaShop\PrestaShop\Core\Payment\PaymentOption;

class Monero extends PaymentModule{

        function __construct(){
        
                $this->name = "Monero";
        }
}
