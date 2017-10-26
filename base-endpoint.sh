#!/bin/bash

ACTION=$1


function deploy_docker_image() {
	DOCKER_REPO=952671759649.dkr.ecr.us-west-2.amazonaws.com
	IMAGE_NAME=demo2

	# jet --help
	# jet run build-application-container
	# ls -la /project
	docker build /project --file /project/Dockerfile-application -t ${IMAGE_NAME}
	docker tag ${IMAGE_NAME} ${DOCKER_REPO}/${IMAGE_NAME}:first
	# docker push ${DOCKER_REPO}/${IMAGE_NAME}:first
}

case "$@" in
    'run')
        deploy_docker_image ;;
    *)
        echo '[ERROR] Invalid argument. Allowed arguments: run'
        exit 1 ;;
esac