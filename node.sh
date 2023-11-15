source local_params.sh

sed -e "s/<THIS_NODE_IP>/${THIS_NODE_IP}/" \
    -e "s/<DOCKER_SELENIUM_VERSION>/${DOCKER_SELENIUM_VERSION}/" \
    ./config.template.toml > "./config.toml"

docker run --rm -p 5555:5555 \
    -e SE_EVENT_BUS_HOST=${HUB_IP} \
    -e SE_EVENT_BUS_PUBLISH_PORT=4442 \
    -e SE_EVENT_BUS_SUBSCRIBE_PORT=4443 \
    -e SE_NODE_HOST=${THIS_NODE_IP} \
    -v ${PWD}/config.toml:/opt/bin/config.toml \
    -v /dev/shm/selenium-assets:/opt/selenium/assets \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name selenium-node \
    selenium/node-docker:${DOCKER_SELENIUM_VERSION}
