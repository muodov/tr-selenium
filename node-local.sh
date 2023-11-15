export HUB_IP=10.100.9.21
export THIS_NODE_IP=10.100.9.21

# -v /dev/shm/selenium-assets:/opt/selenium/assets \
# -v /var/run/docker.sock:/var/run/docker.sock \

docker run --rm -p 5555:5555 \
    --shm-size="2g" \
    -e SE_EVENT_BUS_HOST=${HUB_IP} \
    -e SE_EVENT_BUS_PUBLISH_PORT=4442 \
    -e SE_EVENT_BUS_SUBSCRIBE_PORT=4443 \
    -e SE_NODE_HOST=${THIS_NODE_IP} \
    --name selenium-node \
    selenium/node-chrome:4.15.0-20231110
