
# S3 Projection

Place to **put and deliver**(and then if you're ready for that, to erase) objects to the S3. There's no need to deal with
environment variables, you only need to have your **AWS CLI profiles** configured and the specified *S3 buckets* **must** exist.

## About buckets folder structure

Every referenced bucket must have the format `<profile>@<bucket>`. So then you could have a tree like this.

**Note:** the *profile* **must** match with the one configured in the AWS CLI. You can check your profiles with `aws configure list-profiles`.

```sh
buckets
├── luisnquin@my-bucket
│   ├── activity
│   │   ├── my-old-company
│   │   │   ├── certifications
│   │   │   └── receipts
│   │   └── my-company
│   │       ├── profile-pictures
│   │       │   └── github.com
│   │       │       └── amazing-cat.png (will be uploaded)
│   │       ├── projects
│   │       │   ├── global
│   │       │   └── pain-control
│   │       └── receipts
│   └── work
│       └── documents
└── luisnquin-company@company-bucket
    ├── legal-advices
    ├── projects
    └── receipts
        └── receipt-1.pdf (will be uploaded too)
```

## To deliver


```sh
# Uploads all the files from the buckets folder.
$ just up
```

## To delete every file preserving the folder structure

```sh
# Deletes all the files from the buckets folder.
$ just erase
```


## LICENSE

[MIT](./LICENSE)
