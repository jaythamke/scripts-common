#! /bin/bash

set -eu

DOCKER_CRED=$1
DOCKER_CRED_BASE64=$(echo -n "$DOCKER_CRED" | base64)

DOCKER_AUTHS="\
{
	\"auths\": {
		\"https://index.docker.io/v1/\": {
			\"auth\": \"${DOCKER_CRED_BASE64}\"
		}
	}
}"

DOCKER_AUTHS_BASE64=$(echo "$DOCKER_AUTHS" | base64 -w 0)

printf "\n${DOCKER_AUTHS_BASE64}\n\n"
