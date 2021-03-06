#!/bin/bash

source /opt/qnib/consul/etc/bash_functions.sh
wait_for_srv consul-http

consul-template -once -template "/etc/consul-templates/burrow/burrow.cfg.ctmpl:/etc/burrow/burrow.cfg"
consul-template -once -template "/etc/consul-templates/burrow/logging.cfg.ctmpl:/etc/burrow/logging.cfg"

/go/bin/burrow --config /etc/burrow/burrow.cfg
