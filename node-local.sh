source local_params.sh

# -v /dev/shm/selenium-assets:/opt/selenium/assets \
# -v /var/run/docker.sock:/var/run/docker.sock \

docker run --rm -p 5555:5555 \
    --shm-size="50g" \
    -e SE_EVENT_BUS_HOST=${HUB_IP} \
    -e SE_EVENT_BUS_PUBLISH_PORT=4442 \
    -e SE_EVENT_BUS_SUBSCRIBE_PORT=4443 \
    -e SE_NODE_HOST=${THIS_NODE_IP} \
    -e SE_NODE_MAX_SESSIONS=30 \
    -e SE_NODE_OVERRIDE_MAX_SESSIONS=true \
    -e SE_NODE_SESSION_TIMEOUT=30 \
    selenium/node-chrome:${DOCKER_SELENIUM_VERSION}
