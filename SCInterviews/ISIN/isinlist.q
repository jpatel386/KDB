isinTable:("s*";enlist csv) 0:`data.csv

update expectedChecksum:"I"$/:last each (exec ISIN from isinTable) from `isinTable

isinlist: exec ISIN from isinTable

isinchecksumlist:last each isinlist

isinstocheck:-1_/:isinlist

\l isincheckfunc.q

update calculatedChecksum: f each isinstocheck from `isinTable

update successful:?[expectedChecksum=calculatedChecksum;`Yes;`No] from `isinTable

\c 40 300

show isinTable

show select count i from isinTable where successful=`No



