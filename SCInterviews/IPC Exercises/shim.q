\p 0W
\p

loginDict:(username:("admin";"user2";"user3")!password:("adminpassword";"user2password";"user3password"))

checkfunc:{[user;pass]$[string[user]~"";0b;pass~"";0b;$[loginDict[string[user]]~pass;1b;0b]]}
auth:([]time:`timestamp$();user:`$();pass:();allowed:`boolean$();handle:`int$();query:();commandComment:())

`:authlog.txt set auth

.z.pw:{[user;pass]0N!(.z.P;"Connection request(",string[.z.w],") from:",string[user]," using password:",pass);checkfunc[user;pass]}
.z.po:{[handle]0N!(.z.P;".z.po Connection:",string[.z.w]," opened by ",string .z.u)}
.z.ps:{[query]0N!(`.z.ps;.z.P;`handle`typ`query!(.z.w;`async;query));value query}
.z.pg:{[query]0N!(`.z.pg;.z.P;"Handle:",string[.z.w]," Synchronous query:",-3!query);value query}
.z.pc:{[oldhandle]0N!(`.z.pc;.z.P;"Connection closed for handle:",string oldhandle);-1""}

.z.pw:{[oldzpw;user;pass]accepted:oldzpw[user;pass];`auth insert list1:(.z.p;user; pass;accepted;.z.w;"";"Connection Reuqested");`:authlog.txt upsert list1;accepted}.z.pw
.z.po:{[oldzpo;handle]runfunc:oldzpo[handle];`auth insert list2:(.z.p;.z.u;"";1b;handle;"";"Connection Opened");`:authlog.txt upsert list2;runfunc}.z.po
.z.ps:{[oldzps;query]runfunc:oldzps[query];`auth insert list3:(.z.p;.z.u;"";1b;.z.w;-3!query;"Asyncronous Query");`:authlog.txt upsert list3;runfunc}.z.ps
.z.pg:{[oldzpg;query]runfunc:oldzpg[query];`auth insert list4:(.z.p;.z.u;"";1b;.z.w;-3!query;"Syncronous Query");`:authlog.txt upsert list4;runfunc}.z.pg
.z.pc:{[oldzpc;oldhandle]runfunc:oldzpc[oldhandle];`auth insert list5:(.z.p;.z.u;"";1b;oldhandle;"";"Connection Closed");`:authlog.txt upsert list5;runfunc}.z.pc


addUser:{[username;pwd]loginDict[string username]:string pwd}

.z.ts:{show auth}
\t 1000

/reset with \t 0


/Maybe create a table of usernames and passwords and do a check before opening a connection




