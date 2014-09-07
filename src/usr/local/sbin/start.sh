#! /usr/bin/env bash

function join { local IFS="$1"; shift; echo "$*"; }

function quotes { printf '"%s" ' "$@"; }

if [[ -z "$PUBLIC_IP" ]]
then
    PUBLIC_IP=""
else
    PUBLIC_IP="-hostname $PUBLIC_IP"
fi

if [ "$#" -gt 0 ]
then
    INFLUXDB_HOSTS=$(join , $(quotes "$@"))

    echo "Influxdb Hosts: $INFLUXDB_HOSTS"

    sed -ie "s/^[# ]*seed-servers =.*$/seed-servers = \[${INFLUXDB_HOSTS}\]/g" /etc/influxdb/config.toml
fi

su influxdb -s /bin/bash -c "influxdb $PUBLIC_IP -config=/etc/influxdb/config.toml -pidfile=/var/run/influxdb/influxdb.pid"
