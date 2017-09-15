<div class="payment_carrier">
   {capture name=path}
        <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='monero'}">
            {l s='Checkout' mod='monero'}
        </a>
        <span class="navigation-pipe">{$navigationPipe}</span>
        {l s='Check payment' mod='monero'}
    {/capture}
    
    {if $smarty.const._PS_VERSION_ < 1.6}
        {include file="$tpl_dir./breadcrumb.tpl"}
    {/if}
    
    <h1 class="page-heading">{l s='Order summary' mod='monero'}</h1>

    {assign var='current_step' value='payment'}
    {include file="$tpl_dir./order-steps.tpl"}
<div class="monero">
    <form action="{$link->getModuleLink('monero', 'validation', [], true)|escape:'html'}" method="post">
        <input type="hidden" name="confirm" value="1" />
        
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
	<div class='row'>
				
									<div class='col-sm-12 col-md-12 col-lg-12'>
				                        <div class='panel panel-default' id='PaymentBox_de3a227fb470475'>
        			                         <div class='panel-body'>
				                                <div class='row'>
					                               <div class='col-sm-12 col-md-12 col-lg-12'>
						                                  <h3>Payment Status: {$status}</h3>
					                               </div>
					                           <div class='col-sm-3 col-md-3 col-lg-3'>
						                          <img src='https://chart.googleapis.com/chart?cht=qr&chs=250x250&chl= {$uri}' class='img-responsive'>
					                           </div>
					                           <div class='col-sm-9 col-md-9 col-lg-9' style='padding:10px;'>
												   <p>Send {$amount} <b>XMR</b> to the following address:</p>
						                           <b></b><input type='text'  class='form-control' value='{$integrated_address}'>
                                                <br></br>
                                                <small>If you don't know how to use Monero, <a href='#'>learn more here</a>. </small>
					                           </div>
											<div class='col-sm-12 col-md-12 col-lg-12'>
												
										    </div>
					</div>
				</div>
                                   
			</div>
		</div>
	</div>

            	
            	
                <div>


            </div>
                
            
                
        </div>
    </form>
    </div> 
</div>
