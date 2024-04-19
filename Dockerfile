ARG UBUNTU_VERSION

FROM ubuntu:$UBUNTU_VERSION

RUN apt update -y && apt upgrade -y
RUN apt install curl -y \
        && curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash \
        && apt install speedtest -y

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
