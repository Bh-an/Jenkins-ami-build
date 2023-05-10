# Jenkins ami build and publish

- AMI's are pulled from aws and built using packer with the configuration provided in base_ami.json
- The build contains neccessary plugin for jenkins, supporting software like nginx server and certbot are also included
- Initialising this ami build will provide a ready and running jenkins service before initial config

> For running the ami builder; if running locally, use packer in cli with base_ami.json and fill in variables at top; if running using actions, variables should exist as github secrets described in workflow files

> For setting up and configuring jenkins using this ami: [repo link](https://github.com/Bh-an/Jenkins-server-IAC "Jenkins server IAC repo")
