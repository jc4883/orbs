commit_sha=344560615b92957b9f102229b7b1e77bd33d9308
custom_error_message="thats not cool"

if [[ "" == "$commit_sha" ]]; then
    echo "No commit SHA set to check for";
    exit 0;
fi

current_branch=$(git symbolic-ref --short HEAD);
is_in_branch=$(git branch $current_branch --contains $commit_sha || echo "failfailfail")

if [[ "$is_in_branch" == "failfailfail" ]]; then
    echo "$custom_error_message";
    exit 1;
fi