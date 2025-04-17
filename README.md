# tumblr-utils-docker
This is a Docker implementation of [cebtenzzre's fork of the tumblr-utils backup app](https://github.com/cebtenzzre/tumblr-utils/tree/master). Available on dockerhub at [robotfishe/tumblr-utils](https://hub.docker.com/repository/docker/robotfishe/tumblr-utils/).

You will need to set three environment variables and mount a volume for backups to be stored in.

ENV variables:
- BLOG_NAME: The name of the blog to back up. If left blank, will default to "staff", backing up the tumblr staff blog. This is probably not what you want but might be useful for testing.
- BACKUP_ARGS: Arguments to be sent to the tumblr-backup script. The container will run if this is left blank. See the [tumblr-utils documentation](https://github.com/cebtenzzre/tumblr-utils/blob/master/README.md#2-usage) for details.
- API_KEY: Your tumblr oauth key. See the [tumblr-utils documentation](https://github.com/cebtenzzre/tumblr-utils/blob/master/README.md#1-installation) and [this github issue](https://github.com/cebtenzzre/tumblr-utils/issues/28) for help.

I recommend including a --threads flag in your backup arguments and keeping it low. This seems to reduce the number of HTTP 429 errors when saving notes, and it also solved a problem I was having with running this container on my Unraid server where the large number of files being written in quick succession would cause the server to crash as it tried to compute parity for all of them. I run mine with "--threads 2".

Volume:
Map a folder on your host machine to container folder /data. Backups will be stored in /data/BLOG_NAME.

The container will exit once it has finished backing up the requested blog. I suggest running it with a regular cron job (I have mine set for daily at 1:00am). You can run an incremental backup by using the -i option in BACKUP_ARGS.

If you want to back up more than one blog, you can just set a different BLOG_NAME variable for each one and keep everything else the same. Your backups will be stored together, with each one placed in a BLOG_NAME subfolder.
