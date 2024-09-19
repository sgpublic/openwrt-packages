#!/bin/bash

set -v
set -e

for arg in "$@"; do
    eval "$arg"
done

rm -f ./files/zzz-default-settings.out
cp ./files/zzz-default-settings.in ./files/zzz-default-settings.out

rm -f ./files/zzz-restore-backup.out
cp ./files/zzz-restore-backup.in ./files/zzz-restore-backup.out

rm -f ./root/etc/nginx/conf.d/www.conf.out
cp ./root/etc/nginx/conf.d/www.conf.in ./root/etc/nginx/conf.d/www.conf.out

sed -i "s/%ip_address%/$CONFIG_TARGET_PREINIT_IP/g" ./files/zzz-default-settings.out

if [[ "$CONFIG_DEFAULT_SETTINGS_USE_IP" == "y" ]]; then
  echo -e "server {\n	listen 80;\n	listen [::]:80;\n	server_name $CONFIG_TARGET_PREINIT_IP;\n\n	include conf.d/luci.locations;\n}\n" >> ./root/etc/nginx/conf.d/www.conf.out
fi


if [[ "$CONFIG_DEFAULT_SETTINGS_USE_DOMAIN" == "y" ]]; then
  sed -i 's/%use_host%//g' ./files/zzz-default-settings.out
  sed -i "s/%host_name%/$CONFIG_DEFAULT_SETTINGS_DOMAIN/g" ./files/zzz-default-settings.out
  echo -e "server {\n	listen 80;\n	listen [::]:80;\n	server_name $CONFIG_DEFAULT_SETTINGS_DOMAIN;\n\n	%plaintext_action%\n}\n" >> ./root/etc/nginx/conf.d/www.conf.out
  if [[ "$CONFIG_DEFAULT_SETTINGS_DOMAIN_USE_SSL" == "y" ]]; then
    echo -e "server {\n	listen 443;\n	listen [::]:443;\n	server_name $CONFIG_DEFAULT_SETTINGS_DOMAIN;\n\n	ssl_certificate /etc/nginx/conf.d/_lan.crt;\n	ssl_certificate_key /etc/nginx/conf.d/_lan.key;\n\n	include conf.d/luci.locations;\n}\n" >> ./root/etc/nginx/conf.d/www.conf.out
    if [[ "$CONFIG_DEFAULT_SETTINGS_DOMAIN_FORCE_SSL" == "y" ]]; then
      sed -i 's/%plaintext_action%/return https:\/\/$host$request_uri;/g' ./root/etc/nginx/conf.d/www.conf.out
    else
      sed -i 's/%plaintext_action%/include conf.d\/luci.locations;/g' ./root/etc/nginx/conf.d/www.conf.out
    fi
  else
    sed -i 's/%plaintext_action%/include conf.d\/luci.locations;/g' ./root/etc/nginx/conf.d/www.conf.out
  fi
else
  sed -i 's/%use_host%/\# /g' ./files/zzz-default-settings.out
fi

GIT_CLONE_CONFIG=
if [[ "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP" == "y" ]]; then
  if [[ -z "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL" ]]; then
    echo -e "You had configure DEFAULT_SETTINGS_USE_BACKUP, but CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL didn't configred!"
    exit -1
  fi
  GIT_CLONE_CONFIG=$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL
  if [[ ! -z "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH" ]]; then
    GIT_CLONE_CONFIG=$GIT_CLONE_CONFIG -b=$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH
  fi
fi
sed -i "s/%git_clone_config%/$GIT_CLONE_CONFIG/g" ./files/zzz-restore-backup.out
