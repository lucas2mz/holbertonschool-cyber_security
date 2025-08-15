#!/bin/bash
sudo whois "$1" | awk '
BEGIN {
    print "Registrant Organization,Registrant State/Province,Registrant Country,Registrant Email,Admin Organization,Admin State/Province,Admin Country,Admin Email,Tech Organization,Tech State/Province,Tech Country,Tech Email"
}
/Registrant Organization:/ {rorg=$2; for(i=3;i<=NF;i++){rorg=rorg" "$i}}
/Registrant State\/Province:/ {rstate=$2; for(i=3;i<=NF;i++){rstate=rstate" "$i}}
/Registrant Country:/ {rcountry=$2}
/Registrant Email:/ {remail=$0; sub(/Registrant Email:/,"",remail)}
/Admin Organization:/ {aorg=$2; for(i=3;i<=NF;i++){aorg=aorg" "$i}}
/Admin State\/Province:/ {astate=$2; for(i=3;i<=NF;i++){astate=astate" "$i}}
/Admin Country:/ {acountry=$2}
/Admin Email:/ {aemail=$0; sub(/Admin Email:/,"",aemail)}
/Tech Organization:/ {torg=$2; for(i=3;i<=NF;i++){torg=torg" "$i}}
/Tech State\/Province:/ {tstate=$2; for(i=3;i<=NF;i++){tstate=tstate" "$i}}
/Tech Country:/ {tcountry=$2}
/Tech Email:/ {temail=$0; sub(/Tech Email:/,"",temail)}
END {
    print rorg","rstate","rcountry","remail","aorg","astate","acountry","aemail","torg","tstate","tcountry","temail
}
' > $1.csv