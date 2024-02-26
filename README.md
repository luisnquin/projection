
Recursively upload all the files to S3 bucket.

```sh
$ aws s3 --profile $AWS_PROFILE cp --recursive ~/projection/bye-bye s3://$S3_BUCKET --storage-class STANDARD --acl private
```

Delete all the files from 'projection' directory keeping the directories there.

```sh
$ find ~/projection/bye-bye -type f -print0 | xargs -0 rm
```
