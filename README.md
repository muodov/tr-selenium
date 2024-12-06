# tr-selenium

```bash

# do this on each machine in the cluster
cp local_params.COPYME.sh local_params.sh
vim local_params.sh # change the values
chmod 777 selenium-assets # make it writable by the docker containers (it will accumulate the artifacts from all sessions)

## On the main hub machine only
./hub.sh

## On worker nodes:

# run a node in static mode (single container per node)
./node-static.sh

# run a node in dynamic mode (container per browser session)
./node.sh

## Helper scripts

# list all containers
sudo docker ps -a

# stop all containers (e.g. after a manual abort)
sudo ./stop-all-containers.sh

# remove all containers (clean up after an abort)
sudo ./remove-all-containers.sh

# cleanup containers (stop and remove)
sudo ./cleanup-containers.sh

```
