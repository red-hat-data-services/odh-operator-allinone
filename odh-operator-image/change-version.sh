#/bin/bash

function usage() {
    echo "Modifies the ODH version in Dockerfile and calls git add"
    echo
    echo "usage: change-version.sh [options] VERSION"
    echo
    echo "required arguments:"
    echo
    echo "  VERSION    an ODH version tag which identifies an opendatahub-operator base image"
    echo "             as well as an odh-manifests tarball version from red-hat-data-services/odh-manifests"
    echo
    echo "optional arguments:"
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

sed -i "s/ARG version=.*/ARG version=$1/" Dockerfile
git add Dockerfile
if [ "$commit" == "true" ]; then
    git commit -m "Change the ODH version to $1"
fi
