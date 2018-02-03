myrefData:([currencyPairs:`AUDJPY`AUDUSD`EURAUD`EURCHF`EURGBP`EURJPY`EURUSD`GBPJPY`GBPUSD`GBPCHF`NZDUSD`USDCAD`USDCHF`USDJPY]; convRate:88.24 0.7890 1.31795 0.89259 0.7922 132.2 1.1821 148.58 1.2948 0.789 0.9746 1.1521 1.2468 111.84)
numRows:1000000
dates:2017.01.01+numRows?31
times:numRows?24:00:00.000000000
syms:numRows?(exec currencyPairs from myrefData)
bidQtys:1000+numRows?10000
askQtys2:1000+numRows?10000
quoteData:([]date:dates;time:times;currencyPairs:syms)

finalQuoteData: quoteData lj myrefData
update bid:convRate*1-numRows?0.05 from `finalQuoteData
update ask:bid+numRows?(0.005 0) from `finalQuoteData
update bidQty:bidQtys*(1+numRows?(0.03 0)) from `finalQuoteData
update askQty:askQtys2*(1+numRows?(0.03 0)) from `finalQuoteData
`currencyPairs`date`time xasc `finalQuoteData
delete convRate from `finalQuoteData

marketData:select  from finalQuoteData
update time:10000+time from `marketData
update price:bid from `marketData
update qty:?[bidQty>askQty;askQty;bidQty] from `marketData
update side:?[bidQty>askQty;`Sell;`Buy] from `marketData
delete bidQty,askQty from `marketData
trades: select from `marketData where price=ask
delete bid,ask from `trades


`currencyPairs`date`time xasc `trades

system"c 15 300"

show finalQuoteData
show trades

show select from trades where currencyPairs=`EURCHF
