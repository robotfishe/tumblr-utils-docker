#!/bin/bash
set -e

export PATH=/root/.local/bin:$PATH
tumblr-backup --set-api-key ${API_KEY}
tumblr-backup ${BACKUP_ARGS} -O /data/${BLOG_NAME} ${BLOG_NAME}
exit
