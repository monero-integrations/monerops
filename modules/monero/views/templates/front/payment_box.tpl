<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
<div class='row'>
				
					<div class='col-sm-12 col-md-12 col-lg-12'>
				                        <div class='panel panel-default' >
        			                         <div class='panel-body'>
				                                <div class='row'>
					                               <div class='col-sm-12 col-md-12 col-lg-12'>
						                                  <h3> Monero Payment Box</h3>
					                               </div>
					                           <div class='col-sm-3 col-md-3 col-lg-3'>
						                          <img src='https://chart.googleapis.com/chart?cht=qr&chs=250x250&chl={$uri}' class='img-responsive'>
					                           </div>
					                           <div class='col-sm-9 col-md-9 col-lg-9' style='padding:10px;'>
						                          Send <b>{$amount} XMR</b> to<br/><input type='text'  class='form-control' value='{$address}'>
                                                or scan QR Code with your mobile device<br/><br/>
                                                <small>If you don't know how to pay with monero or you don't know what monero is, please go <a href='#'>here</a>. </small>
					                           </div>
					                           <div class='col-sm-12 col-md-12 col-lg-12'>
				
						                      
					                       </div>
				                        </div>
			                         </div>
                                   
		              </div>
                    </div>
                </div>
        
      <div class="alert alert-warning">
      We are waiting for confirmation from Monero Wallet RPC
      Integrated address {{integrated_address}}
      </div>
