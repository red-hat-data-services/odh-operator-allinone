#/bin/bash

function usage() {
    echo "Modifies the ODH version in Dockerfile and calls git add"
    echo
    echo "usage: change-version.sh [options] OPERATOR_VERSION [MANIFEST_VERSION]"
    echo
    echo "required arguments:"
    echo
    echo "  OPERATOR_VERSION    opendatahub-operator image tag to use as a base image"
    echo "                      Also used for the manifest version if MANIFEST_VERSION is not specified."
    echo
    echo "optional arguments:"
    echo
    echo "  MANIFEST_VERSION    specifies which release tag to download for odh-manifests tarball"
    echo
    echo "  -h         show this message"
    echo "  -c         commit the change"
}

commit=false

while getopts hc opt; do
    case $opt in
        h)
            usage
            exit 0
            ;;
        c)
            commit=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

shift "$((OPTIND-1))"

if [ "$#" -lt 1 ]; then
    echo error: no ODH version specified
    usage
    exit 1
fi

if [ "$#" -gt 1 ]; then
    MVER=$2
else
    MVER=$1
fi

sed -i "s/ARG operator_ver=.*/ARG operator_ver=$1/" Dockerfile
sed -i "s/ARG manifest_ver=.*/ARG manifest_ver=$MVER/" Dockerfile

git add Dockerfile
if [ "$commit" == "true" ]; then
    git commit -m "Change the ODH version to $1 and manifest version to $MVER"
fi
