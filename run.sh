#!/bin/sh

envsubst < /etc/chronos.cfg.tpl > /etc/chronos.cfg

exec supervisord -c /etc/supervisord.conf
