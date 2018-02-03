quote:([]time:"p"$();sym:`$();bid:();ask:())
symlist:`DDD`MMM`WBAI`WUBA`AHC`AAN`ASIX`BNS
randsym:{1?symlist}
stockprice:([]sym:`DDD`MMM`WBAI`WUBA`AHC`AAN`ASIX`BNS;price:(11.47;219.24;11.26;67.48;4.52;42.48;44.09;64.82))
insertintotable:{chosensym:randsym[];(.z.p;chosensym 0;(1-1?(0.03 0))*exec price from stockprice where sym=chosensym 0;(1+1?(0.03 0))*exec price from stockprice where sym=chosensym 0)}

system"p 0W"
portnum: enlist string system"p"
`:portnum.txt 0: portnum



\t 1000
.z.ts:{[]clientHandle: first key .z.W;data:insertintotable[];`quote insert data; clientHandle(`.q.set;`data;data)}
