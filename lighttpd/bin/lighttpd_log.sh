#!/bin/bash
cd /home/work/opbin/crontab/logrotate_all/bin && \
./backuplog.sh -D 03 -S 10 -A 1 -P /home/work/webapp3/lighttpd/log/ -F lighttpd.log,lighttpd.log.wf,lighttpd_se.log,lighttpd_tc.log,lighttpd_pb.log  -T h -B ./log_bak/ -X 1
