"Usage:-- f[\"insertIsinHereWithoutCheckSum\"]"

fadvanced:{l:count[li:("I"$/:(raze($:).Q.nA?/:x))];($[0=l mod 2;sum"I"$/:(raze($:)(l#1 2)*li);sum"I"$/:(raze($:)(l# 2 1)*li)]*9)mod 10}


f:{length:count[prelist:("I"$/:(raze string .Q.nA?/:x))];($[0=length mod 2;sum "I"$/:(raze string(length#1 2)*prelist);sum "I"$/:(raze string(length# 2 1)*prelist)]*9) mod 10}
