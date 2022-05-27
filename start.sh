#!/bin/bash
# set -euxo pipefail
osArr=(fedora centos:7 ubuntu)

for t in ${osArr[@]}; do
  docker pull pycontribs/$t
  docker run -d --name $(echo $t | awk -F":" '{print $1}') pycontribs/$t sleep 99999999999
done

ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

for t in ${osArr[@]}; do
  docker stop $(echo $t | awk -F":" '{print $1}')
  docker container rm $(echo $t | awk -F":" '{print $1}')
done


