\l /Users/jai/Kdb+/myOwnTickPlant/myTickPlant/schema.q

/open port for tickerplant
tickPlantHandle:openConnection:["tp";program;"pass"]

/open port for where data is being sent
sendLocation:openConnection:["slc";program;"pass"]

/push to tp
.z.ps:{[query] value query;tableSent::query 1;sendData[set;neg tickPlantHandle;tableSent;value tableSent];}


