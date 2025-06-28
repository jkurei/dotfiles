p_local_ip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
p_external_ip=`curl 'https://api.ipify.org?format=json'`

write () { 
  echo "gonna write";
  echo "$p_local_ip // $p_external_ip" > ~/Dropbox/portege_ip.txt;
}

write;

refresh () {
  local_ip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`;
  external_ip=`curl 'https://api.ipify.org?format=json'`;
  
  if [ "$p_local_ip" != "$local_ip" ] || [ "$p_external_ip" != "$external_ip" ];
  then
    echo "gotta write";
    write;
  fi
}

while true; do refresh; sleep 20; done
