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

    <h3>{l s='Monero Payment' mod='monero'}</h3>
    <form action="{$link->getModuleLink('monero', 'validation', [], true)|escape:'html'}" method="post">
        <input type="hidden" name="confirm" value="1" />
        <div class="row">
            <div class="col-lg-8">
                <div>
<img src="https://chart.googleapis.com/chart?cht=qr&chs=150x150&chl={$uri}">
                    <p class="total_price_container">
                        <b>

                            {l s='The total amount of your order is' mod='monero'}
                        </b>                        
                        <span id="amount_{$currencies.0.id_currency}" class="price">
                           {$amount}  XMR
                        </span>
                    </p>

                    

                    <p>Send exactly:</p>

                    <p>
                        <input onclick="this.select();" readonly="" value="{$amount}">
                    </p>

                    <p>
                        <a href="{$uri}">Pay with desktop app</a>
                        Use this <b> {$payment_id} </b> payment_id in order to identify your payment into our system
                    </p>
                    
                </div>

                <div>
                    <div>
                        Trouble launching desktop app? Please use the address below.<br>
                    </div>
                    <p>
                        <input onclick="this.select();" readonly="" value="{$address}">
                    </p>
                </div>
<p>
                        <span>1 XMR = <span>{$actual} USD Dollars</span></span> |
                        <span>Mid-market rates: <span>{$smarty.now|date_format:"%Y-%m-%d %H:%M"}</span> </span>
                    </p>
                <p class="cart_navigation clearfix">
                    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='monero'}</a>
<input value="{$payment_id}" hidden name="payment_id">

                    <input type="submit" value="{l s='Check my order' mod='monero'}" class="exclusive_large"/>
                    <b>{l s='Please check your order by clicking \'Check my order\'.' mod='monero'}</b>
                </p>

            </div>
                
            
                
        </div>
    </form>
</div>
