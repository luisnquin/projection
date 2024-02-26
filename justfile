
BUCKETS_PATH := "./buckets"


up:
    @./scripts/up.sh {{ BUCKETS_PATH }}

erase:
    @find {{ BUCKETS_PATH }} -type f -print0 | xargs -0 rm
