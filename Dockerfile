FROM reactnativecommunity/react-native-android:latest

# pass down args for the react-native-android image 
ARG BUCK_VERSION=2021.01.12.01
ENV BUCK_VERSION=$BUCK_VERSION

ARG SDK_VERSION=commandlinetools-linux-7302050_latest.zip
ENV SDK_VERSION=$SDK_VERSION

ARG ANDROID_BUILD_VERSION=31
ENV ANDROID_BUILD_VERSION=$ANDROID_BUILD_VERSION

ARG ANDROID_TOOLS_VERSION=31.0.0
ENV ANDROID_TOOLS_VERSION=$ANDROID_TOOLS_VERSION

ARG NDK_VERSION=21.4.7075529
ENV NDK_VERSION=$NDK_VERSION

ARG NODE_VERSION=14.x
ENV NODE_VERSION=$NODE_VERSION

ARG WATCHMAN_VERSION=4.9.0
ENV WATCHMAN_VERSION=$WATCHMAN_VERSION

ARG CMAKE_VERSION=3.18.1
ENV CMAKE_VERSION=$CMAKE_VERSION

# personal args
ARG INSTALL_RUBY_VERSION=3.0.0


SHELL ["/bin/bash", "-c"]

RUN apt update -qq; \ 
    apt install -y sudo tar bash wget build-essential openssl libreadline8 libreadline-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config; \
    wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz; \
    tar -xzvf chruby-0.3.9.tar.gz; \
    cd chruby-0.3.9; \
    make install; \
    cd ..; \
    wget -O ruby-install-0.8.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.3.tar.gz; \
    tar -xzvf ruby-install-0.8.3.tar.gz; \
    cd ruby-install-0.8.3; \ 
    make install; \
    cd ..; \
    ruby-install "$INSTALL_RUBY_VERSION" ;\
    rm -rf chruby-0.3.9 chruby-0.3.9.tar.gz ruby-install-0.8.3 ruby-install-0.8.3.tar.gz; 

    

