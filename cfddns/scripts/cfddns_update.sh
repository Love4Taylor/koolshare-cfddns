#!/bin/sh

source /koolshare/scripts/base.sh
eval `dbus export cfddns_`

if [ "$cfddns_enable" != "1" ]; then
    echo "not enable"
    exit
fi

now=`date '+%Y-%m-%d %H:%M:%S'`
ip=`$cfddns_curl 2>&1` || die "$ip"

[ "$cfddns_type" = "" ] && cfddns_type="A"
[ "$cfddns_curl" = "" ] && cfddns_curl="curl -s ipv4.ip.sb"
[ "$cfddns_ttl" = "" ] && cfddns_ttl="1"

die () {
    echo $1
    dbus ram cfddns_last_act="$now: failed($1)"
}

update_record() {
    curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$cfddns_zoneID/dns_records/$cfddns_domainID" \
     -H "X-Auth-Email: $cfddns_email" \
     -H "X-Auth-Key: $cfddns_key" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"$cfddns_type\",\"name\":\"$cfddns_domain\",\"content\":\"$ip\",\"ttl\":$cfddns_ttl,\"proxied\":false}"
}

if [ "$?" -eq "0" ]; then
   cfddns_zoneID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$cfddns_zone" -H "X-Auth-Email: $cfddns_email" -H "X-Auth-Key: $cfddns_key" -H "Content-Type: application/json" | awk -F"","" '{print $1}'| sed 's/^.*:"//g' | sed 's/"$//g' )
   record_response=`curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$cfddns_zoneID/dns_records?type=$cfddns_type&name=$cfddns_domain" -H "X-Auth-Email: $cfddns_email" -H "X-Auth-Key: $cfddns_key" -H "Content-Type: application/json" `
   if [ "$cfddns_type" = "A" ]; then
       current_ip=`echo "$record_response" | awk -F"","" '{print $4}' | grep -oE '([0-9]{1,3}\.?){4}'`
   elif [ "$cfddns_type" = "AAAA" ]; then
       current_ip=`echo "$record_response" | awk -F"","" '{print $4}' | sed 's/^.*:"//g' | sed 's/"$//g' | grep -oE '^([0-9a-fA-F]{0,4}:){1,7}([0-9a-fA-F]){0,4}$'`
   else
       echo "$now: Failure"
       dbus set cfddns_last_act="$now: 记录类型错误! 请检查设置"
       exit 1
   fi
   cfddns_domainID=`echo "$record_response" | awk -F"","" '{print $1}' | sed 's/^.*:"//g' | sed 's/"$//g'`

    if [ "$ip" = "$current_ip" ]; then
        echo "$now: Skipping, Web IP:($ip), CF IP:($current_ip)"
        dbus set cfddns_last_act="$now: 跳过更新, 本地公网 IP:($ip), CF 中 $cfddns_type 记录 IP:($current_ip)"
        exit 0
    else
        echo "$now: changing"
        update_record
        echo "$now: change finish"
        if [ "$cfddns_type" = "A" ]; then
            new_ip=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$cfddns_zoneID/dns_records?type=$cfddns_type&name=$cfddns_domain" -H "X-Auth-Email: $cfddns_email" -H "X-Auth-Key: $cfddns_key" -H "Content-Type: application/json" | awk -F"","" '{print $4}' | grep -oE '([0-9]{1,3}\.?){4}' )
        elif [ "$cfddns_type" = "AAAA" ]; then
            new_ip=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$cfddns_zoneID/dns_records?type=$cfddns_type&name=$cfddns_domain" -H "X-Auth-Email: $cfddns_email" -H "X-Auth-Key: $cfddns_key" -H "Content-Type: application/json" | awk -F"","" '{print $4}' | sed 's/^.*:"//g' | sed 's/"$//g' | grep -oE '^([0-9a-fA-F]{0,4}:){1,7}([0-9a-fA-F]){0,4}$' )
        else
            echo "$now: Failure"
            dbus set cfddns_last_act="$now: 记录类型错误! 请检查设置"
            exit 1
        fi
        if [ "$new_ip" = "$ip" ]; then
            echo "$now: Update success, Web IP:($ip), CF IP:($new_ip)"
            dbus set cfddns_last_act="$now: 更新成功, 上次 CF 中 $cfddns_type 记录 IP:($current_ip), 本地公网 IP:($ip), 本次修改 CF 中 $cfddns_type 记录 IP:($new_ip)"
        else
            echo "$now: Failure"
            dbus set cfddns_last_act="$now: 更新失败! 请检查设置"
        fi
    fi 
fi
