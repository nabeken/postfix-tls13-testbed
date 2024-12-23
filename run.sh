#!/bin/sh -ex
rsyslogd
service postfix start
tail -F /var/log/mail.log
