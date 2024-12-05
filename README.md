# tr-selenium

```bash

# do this on each machine in the cluster
cp local_params.COPYME.sh local_params.sh
vim local_params.sh # change the values
chmod 777 selenium-assets # make it writable by the docker containers (it will accumulate the artifacts from all sessions)

# on the main hub machine
./hub.sh
# optionally, run a node on the same machine
./node-local.sh

# on the other machines
./node.sh

# list all containers
sudo docker ps -a

# stop all containers (e.g. after a manual abort)
./stop-all-containers.sh

# remove all containers (clean up after an abort)
./remove-all-containers.sh

```
