<div class="payment_carrier">
   {capture name=path}
        <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='bitcoin'}">
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
    <h3>{l s='Monero Payment' mod='monero'}</h3>
    <form action="{$link->getModuleLink('monero', 'validation', [], true)|escape:'html'}" method="post">
        <input type="hidden" name="confirm" value="1" />
        <div class="row">
            <div class="col-lg-8">
            <div style="border: 1px solid white;">
            	<h3>Your bill will be {$amount} <b>XMR</b></h3>
            	<p>If you do not know about Monero, visit <a href="https://getmonero.org">getmonero.org</a></p>
            </div>
            	
            	
                <div>

                <p class='cart_navigation clearfix'>
				<b>{l s = ' Confirm your order by clicking \'Confirm my order\'.' mod='monero'}</b><br></br>
                    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='monero'}</a>
<input value="{$payment_id}" hidden name="payment_id">

                  <input type="submit" value="{l s='Confirm my order' mod='monero'}"  class="button_large" >
                       
                </p>

            </div>
                
            
                
        </div>
    </form>
    </div> 
</div>
