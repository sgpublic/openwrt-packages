#!/bin/bash -e

CONFIG_TARGET_PREINIT_IP=$1
CONFIG_DEFAULT_SETTINGS_USE_IP=$2
CONFIG_DEFAULT_SETTINGS_USE_DOMAIN=$3
CONFIG_DEFAULT_SETTINGS_DOMAIN=$4
CONFIG_DEFAULT_SETTINGS_DOMAIN_USE_SSL=$5
CONFIG_DEFAULT_SETTINGS_DOMAIN_FORCE_SSL=$6
CONFIG_DEFAULT_SETTINGS_USE_BACKUP=$7
CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL=$8
CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH=$8
CONFIG_DEFAULT_SETTINGS_USE_BACKUP_LOCAL=$9

echo -e "CONFIG_TARGET_PREINIT_IP: $CONFIG_TARGET_PREINIT_IP"
echo -e "CONFIG_DEFAULT_SETTINGS_USE_IP: $CONFIG_DEFAULT_SETTINGS_USE_IP"
echo -e "CONFIG_DEFAULT_SETTINGS_USE_DOMAIN: $CONFIG_DEFAULT_SETTINGS_USE_DOMAIN"
echo -e "CONFIG_DEFAULT_SETTINGS_DOMAIN: $CONFIG_DEFAULT_SETTINGS_DOMAIN"
echo -e "CONFIG_DEFAULT_SETTINGS_DOMAIN_USE_SSL: $CONFIG_DEFAULT_SETTINGS_DOMAIN_USE_SSL"
echo -e "CONFIG_DEFAULT_SETTINGS_DOMAIN_FORCE_SSL: $CONFIG_DEFAULT_SETTINGS_DOMAIN_FORCE_SSL"
echo -e "CONFIG_DEFAULT_SETTINGS_USE_BACKUP: $CONFIG_DEFAULT_SETTINGS_USE_BACKUP"
echo -e "CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL: $CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL"
echo -e "CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH: $CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH"
echo -e "CONFIG_DEFAULT_SETTINGS_USE_BACKUP_LOCAL: $CONFIG_DEFAULT_SETTINGS_USE_BACKUP_LOCAL"

rm -f ./root/etc/nginx/conf.d/www.conf.out
rm -f ./files/zzz-default-settings.out

cp ./files/zzz-default-settings.in ./files/zzz-default-settings.out
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

rm -rf ./root/approot
if [[ "$DEFAULT_SETTINGS_USE_BACKUP" == "y" ]]; then
  if [[ ! -z "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL" ]]; then
    git clone "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL" -b "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH" --depth=1 ./root/approot
  elif [[  ! -z "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_LOCAL"  ]]; then
    cp -a "$CONFIG_DEFAULT_SETTINGS_USE_BACKUP_LOCAL" ./root/approot
  else
    echo -e "You had configure DEFAULT_SETTINGS_USE_BACKUP, but neither CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL nor CONFIG_DEFAULT_SETTINGS_USE_BACKUP_LOCAL are configred!"
    exit -1
  fi
fi
