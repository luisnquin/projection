
Recursively upload all the files to S3 bucket.

```sh
aws s3 --profile alt cp --recursive ~/projection s3://luisnquin-2 --storage-class STANDARD --acl private
```

Delete all the files from 'projection' directory keeping the directories there.

```sh
$ find ~/projection -type f ! -name "README.md" -print0 | xargs -0 rm
```
