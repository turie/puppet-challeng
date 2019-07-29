#!/bin/bash

printf -- "----------------- Checking for ansible-galaxy install\n"
which ansible-galaxy | grep -q ansible-galaxy >/dev/null
[ $? -eq 1 ] && echo "Set your path to include ansible-galaxy or install ansible-galaxy then run again" && exit 1

printf -- "----------------- Checking for required ansible roles\n"
count=`ansible-galaxy list 2>/dev/null  | awk '/geerlingguy.(jenkins|java),/ {print $2}' | wc -l`
if [[ $count -ne 2 ]] ; then 
  printf -- "----------------- Installing required ansible roles\n"
  ansible-galaxy install geerlingguy.jenkins
else
  printf -- "----------------- Roles are already installed\n"
fi
printf -- "----------------- Ansible roles installed, starting the VM with Jenkins\n"

vagrant up

printf -- "----------------- To connect to Jenkins point your browser to http://<host_ip>:8000\n"
printf -- "----------------- Login with admin/admin\n"



