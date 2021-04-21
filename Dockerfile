FROM docker:stable AS base

LABEL maintainer="sebastian@potasiak.dev"

RUN apk add --no-cache \
    bash \
    python3


FROM base AS builder

LABEL maintainer "Sebastian Potasiak <sebastian@potasiak.dev>"

RUN apk add --no-cache \
    gcc \
    libffi-dev \
    make \
    musl-dev \
    openssl-dev \
    python3-dev \
    py3-pip

RUN CRYPTOGRAPHY_DONT_BUILD_RUST=1 pip install --no-cache-dir docker-compose


FROM base AS target

COPY --from=builder /usr/lib/python3.8/site-packages /usr/lib/python3.8/site-packages
COPY --from=builder /usr/bin/docker-compose /usr/bin/docker-compose

RUN mkdir -p /opt/atlassian/bitbucketci/agent/build

WORKDIR /opt/atlassian/bitbucketci/agent/build

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
