dates:2016.01.01 + 10000000?152
exchTimes:10000000?24:00:00.000000000
times: exchTimes+10000000?1000000
refPrices:([sym:`VOD`BP`BT`HSBA`BARC`RBS`BATS];price:236.0 428.0 17.0 540.0 183.0 286.0 5010.0)
symbols:10000000?(exec sym from refPrices)
sizes:50+10000000?1000
conds:`A
initTrades:([]date:dates;time:times;exchTime:exchTimes;sym:symbols;size:sizes;cond:conds)
tradesWithPrices: initTrades lj refPrices
update price:price*(1+10000000?0.01) from `tradesWithPrices
tradesInTradingTime: select from tradesWithPrices where exchTime<16:30:00.000, exchTime>08:00:00.000
`date`time xasc `tradesInTradingTime
update `#date from `tradesInTradingTime
trades:`date`time`exchTime`sym`price`size`cond xcols tradesInTradingTime
show trades
