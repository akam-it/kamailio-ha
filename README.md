# kamailio-ha
Kamailio+rtpengine failover demo infrastructure for kamailio-rus-2020 conference.

# Requirements
You have to have virtualbox, vagrand and ansible installed and operational. I have used it only on Linux host and did't test it on Windows.

# Usage
Clone this repo to your computer:
```sh
$ cd
$ git clone https://github.com/akam-it/kamailio-ha.git
$ cd kamailio-ha
```

Run vagrand, it will download a Debian box image and will use this image for deploying virtual machines, described in the file Vagrantfile:
```sh
$ vagrant up
```

After virtual machines are deployed vagrant will start provisioning described in the folder .ansilbe

# Installed machines
- 192.168.51.10 - Virtual IP address that belong to MAIN kamailio+rtpengine node
- 192.168.51.11 - kamailio1
- 192.168.51.12 - kamailio2
- 192.168.51.21 - asterisk1
- 192.168.51.22 - asterisk2
- 192.168.51.100 - redis database

# Make a call
- Register your softphone(s) on 192.168.51.10, you can use 2XX number and any password.
- Call to 1XX for hello-world and Echo() application or 2XX for call to another registered user.

After call is established you can check active dialogs and rtp sessions on both kamailio nodes:
```sh
$ kamcmd dmq.list_nodes
$ kamcmd dlg.list
$ rtpengine-ctl list sessions all
```

Kill kamailio application on main node  or pause virtual machhine 'kamailio1' and see how active calls, after little pause of 3 seconds, migrate to kamailio2. New calls will be handled by kamailio2 node.

# Hightlights
Subscripbsions and events should be enabled for Redis:

redis.conf
```
notify-keyspace-events "KEA"
```


Kamalio and rtpengine should be allowed to bind to nonlocal IP
```sh
# echo net.ipv4.ip_nonlocal_bind=1 >> /etc/sysctl.conf
# sysctl -p
```


