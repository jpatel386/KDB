\p 0W
quote:([]time:"p"$();sym:`$();bid:();ask:())
portnum:read0 `:portnum.txt
h:hopen `$raze"::",portnum
.z.ts:{[]`quote insert data;show quote}
\t 1000


