What have been done :
A dockerfile specified a container for client machine.
- Container would pretend to be a machine with SSH functionality
- Container can log ssh attempts

The AlphaClient would run on 2 of that container.

To do :
- Create AlphaClient : it would run rsync to sync ssh log file to AlphaServer
- Create AlphaServer on docker
- Create docker compose 
- Create automation script or using Ansible
