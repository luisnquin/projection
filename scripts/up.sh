#!/bin/sh

main() {
    buckets_path="$1"

    if ! test -d "$buckets_path"; then
        echo "error: first argument must be a valid folder path in this format: ./my-buckets"
        exit 1
    fi

    entries_count=$(find ./buckets -maxdepth 1 -type d -print | tail -n 1 | wc -l)

    INDEX=0
    for raw_entry in "$buckets_path"/*; do
        entry="$(basename "$raw_entry")" # profile@bucket

        profile_name="${entry%@*}"
        bucket_name=$(echo "$entry" | awk -F '@' '{print $2}')

        printf "\033[38;2;82;127;128m%s\033[0m@%s [%s/%s] - syncing...\r" "$profile_name" "$bucket_name" "$INDEX" "$entries_count"

        aws s3 --profile "$profile_name" cp --recursive "$raw_entry" "s3://$bucket_name" --storage-class STANDARD --acl private >/dev/null

        INDEX="$((INDEX + 1))"

        printf "\033[38;2;140;243;245m%s\033[0m@%s [%s/%s] - synced up.\n" "$profile_name" "$bucket_name" "$INDEX" "$entries_count"
    done
}

main "$@"
