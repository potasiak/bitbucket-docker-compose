# Bitbucket Docker Compose

This image provides a `docker-compose` command for Bitbucket Pipelines.

## Usage

In your Bitbucket repository, create a file **bitbucket-pipelines.yml**.
Use this image to use `docker-compose` commaind in Bitbucket Pipelines.

```yaml
image: potasiak/bitbucket-docker-compose:latest

...

  script: docker-compose  ...
```
