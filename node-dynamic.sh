#!/bin/bash
set -xe

# this script runs a selenium node  in "dynamic" mode.
# That is, a new docker container will be created for each browser session.
# Performance is worse compared to static mode, but isolation is better.

source local_params.sh
source remote_params.sh

sed -e "s/<THIS_NODE_IP>/${THIS_NODE_IP}/" \
    -e "s/<DOCKER_SELENIUM_VERSION>/${DOCKER_SELENIUM_VERSION}/" \
    -e "s/<MAX_SESSIONS>/${MAX_SESSIONS}/" \
    ./config.template.toml > "./config.toml"


docker run --rm -p 5555:5555 \
    -e SE_EVENT_BUS_HOST=${HUB_IP} \
    -e SE_EVENT_BUS_PUBLISH_PORT=4442 \
    -e SE_EVENT_BUS_SUBSCRIBE_PORT=4443 \
    -e SE_NODE_HOST=${THIS_NODE_IP} \
    -e SE_ENABLE_TRACING=false \
    -v ${PWD}/config.toml:/opt/selenium/config.toml \
    -v ${PWD}/selenium-assets:/opt/selenium/assets \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name selenium-node \
    selenium/node-docker:${DOCKER_SELENIUM_VERSION}
