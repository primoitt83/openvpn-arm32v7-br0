# openvpn-arm32v7-br0

Works on both arm32v7 and aarch64 devices.

Tested on rk322x-box Armbian 22.11.1 (Debian 10)

Tested on Orange Pi 3B Ubuntu 24.04.

## How to test?

Clone and start this project:

````
cd /opt
git clone https://github.com/primoitt83/openvpn-arm32v7-br0.git
cd openvpn-arm32v7-br0
chmod +x *.sh
./start.sh
````
Generate and check ovpn file:
````
cd /opt/openvpn-arm32v7-br0
docker-compose exec openvpn-br0 /bin/bash
cd /etc/openvpn/pki
chmod +x ovpn.sh
ovpn.sh client mydomain:port > client.ovpn
cat client.ovpn
exit
````

Copy and check ovpn file outside the container:
````
docker cp openvpn-br0:/etc/openvpn/pki/client.ovpn .
cat client.ovpn
````

Now copy client.ovpn and import into openvpn app.

To stop , delete or rebuild:
````
cd /opt/openvpn-arm32v7-br0
./stop.sh
docker rmi openvpn-arm32v7-br0-openvpn-br0
````







