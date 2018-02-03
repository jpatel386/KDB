\c 30 300
"=================First max price by sym=================" 
"show select max price, time:time[0] by sym from trades"
show select max price, time:time[0] by sym from trades
"=================Proof of first max price================="
"show `price xdesc select from trades where sym=`BARC, time<0D08:00:16.763666809"
show `price xdesc select from trades where sym=`BARC, time<0D08:00:16.763666809
"=================Total value traded per minute for a timeframe================="
"show select totalValue:sum size*price by time.minute from trades where date=first date,time.minute<09:16,time.minute>09:00"
show select totalValue:sum size*price by time.minute from trades where date=first date,time.minute<09:16,time.minute>09:00
"=================Daily VWAP for each sym================="
"show select size wavg price by sym from trades"
show select size wavg price by sym from trades
"=================5 min VWAPS for each sym================="
"show select size wavg price by 5 xbar time.minute,sym from trades"
show select size wavg price by 5 xbar time.minute,sym from trades
"=================Table meta data - no current attributes================="
"show meta trades"
show meta trades
"=================Time taken to count entries with BP pre optimisation================="
"\ts do[50;select count i from trades where sym=`BP]"
\ts do[50;select count i from trades where sym=`BP]
"=================Time taken to volume traded for each sym on a specific date pre optimisation================="
"\ts do[160;select sum size by sym from trades where date=2016.01.31]"
\ts do[160;select sum size by sym from trades where date=2016.01.31] 
"=================Add sorted attribbute to sym================="
"`sym xasc `trades"
"show meta trades"
`sym xasc `trades
show meta trades
"=================Time taken to count entries with BP post optimisation================="
"\ts do[50;select count i from trades where sym=`BP]"
\ts do[50;select count i from trades where sym=`BP]
"=================Add parted attribbute to sym================="
"`date xasc `trades"
"update `p#date from `trades"
"show meta trades"
`date xasc `trades
update `p#date from `trades
show meta trades
"=================Time taken to volume traded for each sym on a specific date post optimisation================="
"\ts do[160;select sum size by sym from trades where date=2016.01.31]"
\ts do[160;select sum size by sym from trades where date=2016.01.31] 

