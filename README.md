## Sync to AWS

Small utility to sync folders to AWS using [rclone](https://rclone.org/)

## usage

`sync_aws.bat <from> <to>`

- from is a local folder

- to is a rclone destintion like _rclone_config_:_bucket_/folder

expects to have a .env file containing the AWS key and secret in the format:

```
AWS_ACCESS_KEY=...
AWS_SECRET_ACCESS_KEY=...
```
