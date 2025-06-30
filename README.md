# proxmox-commands

prerequisite

- curl

## tip: APT Cache Clean and Update (Ubuntu)

```sh
sudo rm -rf /var/lib/apt/lists/*
sudo apt clean
sudo apt update
```

## tip: Use KST Timezone (Ubuntu)

```sh
sudo timedatectl set-timezone Asia/Seoul
```

## [Debian] docker installation

```sh
curl -s https://raw.githubusercontent.com/kimbank/proxmox-commands/main/debian-docker-installation.sh | bash
```

## [Ubuntu] docker installation

```sh
curl -s https://raw.githubusercontent.com/kimbank/proxmox-commands/main/ubuntu-docker-installation.sh | bash
```

## [Ubuntu] JDK 17

```sh
curl -s https://raw.githubusercontent.com/kimbank/proxmox-commands/main/ubuntu-jdk17.sh | bash
```

## [Debian] uptime kuma (non-docker)

> https://github.com/louislam/uptime-kuma?tab=readme-ov-file#-non-docker

```sh
curl -s https://raw.githubusercontent.com/kimbank/proxmox-commands/main/debian-uptime-kuma.sh | bash
```
