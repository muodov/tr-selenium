source local_params.sh
docker run --rm -p 4442-4444:4442-4444 --name selenium-hub selenium/hub:${DOCKER_SELENIUM_VERSION}
