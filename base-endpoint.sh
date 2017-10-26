#!/bin/bash

ACTION=$1


function deploy_docker_image() {
	echo "CI_PROJECT_ID: ${CI_PROJECT_ID}"
	echo "CI_BUILD_ID: ${CI_BUILD_ID}"
	echo "CI_REPO_NAME: ${CI_REPO_NAME}"
	echo "CI_BRANCH: ${CI_BRANCH}"
	echo "CI_COMMIT_ID: ${CI_COMMIT_ID}"
	echo "CI_COMMIT_MESSAGE: ${CI_COMMIT_MESSAGE}"
	echo "CI_COMMIT_DESCRIPTION: ${CI_COMMIT_DESCRIPTION}"
	echo "CI_COMMITTER_NAME: ${CI_COMMITTER_NAME}"
	echo "CI_COMMITTER_EMAIL: ${CI_COMMITTER_EMAIL}"
	echo "CI_COMMITTER_USERNAME: ${CI_COMMITTER_USERNAME}"
	echo "CI_TIMESTAMP: ${CI_TIMESTAMP}"
	echo "CI_STRING_TIME: ${CI_STRING_TIME}"
	echo "CI: ${CI}"
	echo "CI_NAME: ${CI_NAME}"

	DOCKER_REPO=952671759649.dkr.ecr.us-west-2.amazonaws.com
	IMAGE_NAME=demo2
	#REGION=us-west-2
	# jet --help
	# jet run build-application-container
	# ls -la /project
	#eval $(aws ecr get-login --region ${REGION})
	docker build /project --file /project/Dockerfile-application -t ${IMAGE_NAME}
	docker tag ${IMAGE_NAME} ${DOCKER_REPO}/${IMAGE_NAME}:helloworld
	# docker tag ${IMAGE_NAME} ${DOCKER_REPO}/${IMAGE_NAME}:${CI_COMMIT_ID}
	#docker push ${DOCKER_REPO}/${IMAGE_NAME}:${CI_COMMIT_ID}
}

case "$@" in
    'run')
        deploy_docker_image ;;
    *)
        echo '[ERROR] Invalid argument. Allowed arguments: run'
        exit 1 ;;
esac



