"Usage:-- fxConv[`gbp;`eur;40]"
"Else use add[`fromCcy;`toCcy;rate] to add a currency pair]"

 
currencyconv:([] exch:`gbpusd`gbpeur`eurusd`usdgbp`eurgbp`usdeur;rate:1.32 1.11 1.18 0.76 0.9 0.84)

show currencyconv

add:{[fromCcy;toCcy;rate]exchsToAdd:(added:`$(string[fromCcy],string[toCcy]);`$(string[toCcy],string[fromCcy]));ratesToAdd:("f"$rate;"f"$1%rate);`currencyconv insert (exchsToAdd;ratesToAdd);string[added],", and it's reverse pair, have been added." }

fxConv:{[fromCcy;toCcy;data]exch:(`$string [fromCcy],string toCcy);$[exch in exec exch from currencyconv;convert[exch;data];"Please use the add function to add the currency pair. You will need to provide the exchange rate in that direction. The reverse rate will automatically be calculated. e.g. add[`gbp;`usd;1.3]"]}  



convert:{[currpair;data]data * (exec rate from currencyconv where exch=currpair)[0]}



