networktable:([]time:`timestamp$();user:`$(); allowed:`boolean$();handle:"i"$();live:`boolean$();query:();msgtyp:());


subhandles:{[subscriber]subs:: exec distinct handle from networktable where user like subscriber,live=1b}

.z.pwOld:.z.pw:{[user;pass]$[permis[user;pass];0N!(.z.P;"Connection accepted(", string[.z.w],") from:", string[user]," using password:", pass);0N!(.z.P;"Connection refused(", string[.z.w],") from:", string[user]," using password:", pass)];access}

.z.psOld:.z.ps:{[query] value query}

.z.pgOld:.z.pg:{[query] value query}

.z.pcOld:.z.pc:{[oldHandle]0N!(`.z.pc;.z.P;"Connection closed for handle:", string oldhandle);-1""}


.z.pwSchema:.z.pw:{}



