FROM ubuntu:noble
ADD --chmod=766 entrypoint.sh /
ENV BLOG_NAME=staff
ENV BACKUP_ARGS=
ENV API_KEY=
VOLUME /data
RUN <<EOF
apt-get update
apt-get install -y python3 pip pipx libexiv2-dev libboost-python-dev
pipx install tumblr-backup[all]
export PATH=/root/.local/bin:$PATH
EOF
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
