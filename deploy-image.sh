#!/usr/bin/env bash
set -e
ORG=djunoltd
REPO=install
NAMESPACE=$ORG/$REPO
TAG=${TRAVIS_BRANCH/\//-}

if [ $TRAVIS_PULL_REQUEST == "false" ]
then
    if [ $TAG == "master" ]
    then
        TAG=$DJUNO_VERSION
    else
        TAG=$TAG-$DJUNO_VERSION
    fi
else
    TAG="pr-$TRAVIS_PULL_REQUEST-$TAG-$DJUNO_VERSION"
fi



IMAGE=$NAMESPACE:$TAG

docker run --rm --privileged docker/binfmt:820fdd95a9972a5308930a2bdfb8573dd4447ad3
docker buildx create --name multi
docker buildx use multi
docker buildx inspect --bootstrap
docker buildx build --build-arg tag=$DJUNO_VERSION --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t $IMAGE .

if [ $TRAVIS_SECURE_ENV_VARS == "true" ]
then
	docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
    docker buildx build --build-arg tag=$DJUNO_VERSION --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t $IMAGE --push .
else
	echo "images can be pushed only from base repo"
fi