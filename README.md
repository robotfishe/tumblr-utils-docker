# tumblr-utils-docker
This is a Docker implementation of [cebtenzzre's fork of the tumblr-utils backup app](https://github.com/cebtenzzre/tumblr-utils/tree/master).

You will need to set three environment variables and mount a volume for backups to be stored in.

ENV variables:
BLOG_NAME: The name of the blog to back up. If left blank, will default to "staff", backing up the tumblr staff blog. This is probably not what you want but might be useful for testing.
BACKUP_ARGS: Arguments to be sent to the tumblr-backup script. The container will run if this is left blank. See the [tumblr-utils documentation](https://github.com/cebtenzzre/tumblr-utils/blob/master/README.md#2-usage) for details.
API_KEY: Your tumblr oauth key. See the [tumblr-utils documentation](https://github.com/cebtenzzre/tumblr-utils/blob/master/README.md#1-installation) and [this github issue](https://github.com/cebtenzzre/tumblr-utils/issues/28) for help.
