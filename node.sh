docker run --rm -p 5555:5555 \
    -e SE_EVENT_BUS_HOST=10.5.0.5 \
    -e SE_EVENT_BUS_PUBLISH_PORT=4442 \
    -e SE_EVENT_BUS_SUBSCRIBE_PORT=4443 \
    -v ${PWD}/config.toml:/opt/bin/config.toml \
    -v ${PWD}/assets:/opt/selenium/assets \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name selenium-node \
    selenium/node-docker:4.5.3-20221024
