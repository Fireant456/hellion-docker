# Hellion Docker Container

[![Docker Pulls](https://img.shields.io/docker/pulls/fireant456/hellion-wine-dotnet452.svg)](https://hub.docker.com/r/fireant456/hellion-wine-dotnet452/)
[![Docker Stars](https://img.shields.io/docker/stars/fireant456/hellion-wine-dotnet452.svg)](https://hub.docker.com/r/fireant456/hellion-wine-dotnet452/)
[![Docker Build Status](https://img.shields.io/github/workflow/status/fireant456/hellion-wine-dotnet452/Publish%20Docker%20image)](https://github.com/Fireant456/hellion-wine-dotnet452/actions/workflows/DockerHub.yml)


[Docker Hub](https://hub.docker.com/r/fireant456/hellion-wine-dotnet452)  
[GitHub Repo](https://github.com/Fireant456/hellion-docker)

This docker container is designed to run [Hellion](https://store.steampowered.com/app/588210/HELLION/) Dedicated Game Server

This container is built on the Ubuntu:20.04 LTS image with Wine and SteamCMD installed including the .Net Framework 4.5.2 required by Hellion Game Server to run.

## Configuration

Set environment variables in order to set server name or ports at boot
| Variable   | Purpose                                |
|------------|----------------------------------------|
| ServerName | Set Hellion Server Name                |
| GamePort   | Set Game Server Port (Default: 6004)   |
| StatusPort | Set Server Status Port (Default: 6005) |