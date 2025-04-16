# tumblr-utils-docker
This is a Docker implementation of [cebtenzzre's fork of the tumblr-utils backup app](https://github.com/cebtenzzre/tumblr-utils/tree/master).

You will need to set three environment variables and mount a volume for backups to be stored in.

ENV variables:
- BLOG_NAME: The name of the blog to back up. If left blank, will default to "staff", backing up the tumblr staff blog. This is probably not what you want but might be useful for testing.
- BACKUP_ARGS: Arguments to be sent to the tumblr-backup script. The container will run if this is left blank. See the [tumblr-utils documentation](https://github.com/cebtenzzre/tumblr-utils/blob/master/README.md#2-usage) for details.
- API_KEY: Your tumblr oauth key. See the [tumblr-utils documentation](https://github.com/cebtenzzre/tumblr-utils/blob/master/README.md#1-installation) and [this github issue](https://github.com/cebtenzzre/tumblr-utils/issues/28) for help.

Volume:
Map a folder on your host machine to container folder /data. Backups will be stored in /data/BLOG_NAME.

The container will exit once it has finished backing up the requested blog. I suggest running it with a regular cron job (I have mine set for daily at 1:00am). It should only download new posts on each run.

If you want to back up more than one blog, you can just set a different BLOG_NAME variable for each one and keep everything else the same. Your backups will be stored together, with each one placed in a BLOG_NAME subfolder.
