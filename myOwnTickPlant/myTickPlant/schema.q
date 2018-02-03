workingDir:"/Users/jai/Kdb+/myOwnTickPlant/myTickPlant"

trade:([]time:`timespan$(); sym:`symbol$(); recvTime:`timespan$(); price:`float$(); size:`int$(); side:"")

//This will be the top of the book

quote:([]time:`timespan$(); sym:`symbol$(); recvTime:`timespan$(); ask:`float$(); bid:`float$(); askSize:`int$(); bidSize:`int$())

openConnection:{[program;username;password]toOpen:`$"::",string[get hsym`$program,".port"],":",username,":",password;hopen toOpen}

/UPD stands for update. can't use that as it's taken, but when using set, what we're doing is updating.Not necessarily always saving a new one
UPD:set

/Function sends data to connected clients. Variables taken in and used for ease of understanding
sendData:{[UPD;clientHandles;tableName;table]clientHandles@\:(UPD;tableName;table);}


programOpened:.-2_z.X[1]
programPid:hsym `$workingDir,"/pid",programOpened,".pid"
programPid set .z.i

show "Schema has been loaded"



