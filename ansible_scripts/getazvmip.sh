az group deployment show -g ansibleteam2 -n ansibleteam2deployment --query properties.outputs.hostname.value > hostname.txt
host_name=`cat hostname.txt | tr -d '"'`
ip_address=`getent hosts $host_name | awk '{ print $1 }'`
echo $ip_address > host_ip.txt

