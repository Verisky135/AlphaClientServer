Implemented functionalities :  
- Creation of three docker container that pretend to work as machine/server, two container would run AlphaClient and one would run AlphaServer.
- Docker compose that automated the containers creations (but the AlphaServer and AlphaClient still don't have automation yet)
- AlphaClient : can synchronize ssh log file to server as soon as the ssh login attempt happens
- AlphaServer : can accept logs from AlphaClients

To do :
- Create AlphaServer simple webview for monitoring
- ~~Create automation script or using Ansible.~~ Changed the automation with docker-compose instead, and probably a simple script.
