Implemented functionalities :  
- Using three docker container that pretend to work as machine/server, two container would run AlphaClient and one would run AlphaServer.
- Using docker compose for automation : containers creations and app automation (AlphaClient and AlphaServer)
- AlphaClient : can synchronize ssh log file to server as soon as the ssh login attempt happens
- AlphaServer : can accept logs from AlphaClients
- AlphaServer : can shows ssh attemp on console

~~To do :~~
- ~~Fix "Last message repeated N times" in logs.~~ Fixed
- ~~Create AlphaServer simple webview for monitoring~~ Changed to console view for better latency
- ~~Create automation script or using Ansible.~~ Changed the automation with docker-compose instead ~~and probably a simple script~~.

Requirements to run the deployment:
- Tested on Ubuntu 16.04
- Docker (version 17.03.1-ce)
- Docker-compose (version 1.14.0-rc2)

Usage (run from root directory):
- Automated deployment
    ```
    docker-compose up -d --build
    ```
- Watching the live report of SSH login attempt. Count both failed and successful attempts.
    ```
    watch -n 1 tail Server/monitoring.log
    ```
- All the client machines are accessible through SSH on localhost port 5001 and 5002, and the monitoring server on port 5000 (all default user=root password=screencast). You can change the ports by editing docker-compose.yml if you need to. Do SSH commands to test the attempt count
    ```
    ssh root@localhost -p 5001
    ssh root@localhost -p 5002
    ```

Source :
- https://docs.docker.com/engine/examples/running_ssh_service/
- https://stackoverflow.com

