{extends "$layout"}
{block name="content"}
 <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>

								
								<div class='row'>
				
									<div class='col-sm-12 col-md-12 col-lg-12'>
				                        <div class='panel panel-default' id='PaymentBox_de3a227fb470475'>
        			                         <div class='panel-body'>
				                                <div class='row'>
					                               <div class='col-sm-12 col-md-12 col-lg-12'>
						                                  <h3> Monero Payment Box</h3>
					                               </div>
					                           <div class='col-sm-3 col-md-3 col-lg-3'>
						                          <img src='https://chart.googleapis.com/chart?cht=qr&chs=250x250&chl={$uri|escape:'html':'UTF-8'}' class='img-responsive'>
					                           </div>
					                           <div class='col-sm-9 col-md-9 col-lg-9' style='padding:10px;'>
						                          Send <b> {$amount|escape:'html':'UTF-8'} XMR</b> to<br/><input type='text'  class='form-control' value='{$integrated_address|escape:'html':'UTF-8'}'>
                                                or scan QR Code with your mobile device<br/><br/>
                                                <small>If you need help with how to pay with Monero or want to learn more about it, please go to the Monero <a href='#'>site</a>. </small><br>
                                                <h5>{$status}</h5>
					                           </div>
					                           
				                        </div>
			                         </div>
                                   
		              </div>
                    </div>
                </div>
        
      <script type='text/javascript'>
  setTimeout(function () { location.reload(true); }, 30000);
</script>

{/block}
