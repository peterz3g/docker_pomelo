#!/bin/bash
today=`date +"%Y%m%d"`

printenv | sed 's/^\(.*\)$/export \1/g' | grep 'MYSQL' > /code/project_env.sh
cat /code/project_env.sh >> /etc/profile
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#mount host:/data10g/app to container: /code/vol

service cron restart

npm install -g cnpm --registry=https://registry.npm.taobao.org
apt-get update -y
apt-get upgrade -y
apt-get install -y --force-yes nodejs
apt-get install -y --force-yes npm

#installed here: /usr/lib/node_modules or /user/local/lib/
cnpm install pomelo -g


python /code/demo/manage.py runserver 0.0.0.0:8000
