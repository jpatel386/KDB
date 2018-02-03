myrefData:([]currencyPairs:`AUDJPY`AUDUSD`EURAUD`EURCHF`EURGBP`EURJPY`EURUSD`GBPJPY`GBPUSD`GBPCHF`NZDUSD`USDCAD`USDCHF`USDJPY; convRate:88.24 0.7890 1.31795 0.89259 0.7922 132.2 1.1821 148.58 1.2948 0.789 0.9746 1.1521 1.2468 111.84)
keyedref:select by currencyPairs from myrefData

dates:2017.01.01+1000000?31
times:1000000?24:00:00.000000000
syms:1000000?(exec currencyPairs from myrefData)
OrderQtys:1000+1000000?10000
quoteData:([]date:dates;time:times;currencyPairs:syms)

finalQuoteData: quoteData lj keyedref
update bid:convRate*1-1000000?0.05 from `finalQuoteData
update ask:bid+1000000?(0.005 0) from `finalQuoteData
`date`time`currencyPairs`bid`ask xasc `finalQuoteData
delete convRate from `finalQuoteData

timesnew:100+times
BA:1000000?`Bid`Ask
fillTable:([]date:dates;time:timesnew;currencyPairs:syms;orderQty:OrderQtys;bidAsk:BA)
finalFill: fillTable lj keyedref
`date`time`currencyPairs xasc `finalFill
update bid:(exec bid from finalQuoteData) from `finalFill
update ask:(exec ask from finalQuoteData) from `finalFill
delete convRate  from `finalFill
filled: select from `finalFill where bid=ask

marketData:select from filled
update price:bid from `marketData
delete rate,bidAsk,bid,ask from `marketData
`date`time xasc `marketData

system"c 10 300"

show finalQuoteData
show filled
show marketData
