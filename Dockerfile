ARG BASE_VERSION=8
FROM reactnativecommunity/react-native-android:$BASE_VERSION

# personal args
ARG INSTALL_RUBY_VERSION=3.0.0

COPY ./entrypoint.sh ./entrypoint.sh

SHELL ["/bin/bash", "-c"]
    
RUN apt update -qq; apt install -y git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc;echo 'eval "$(rbenv init -)"' >> ~/.bashrc;
RUN source ~/.bashrc; $HOME/.rbenv/bin/rbenv install $INSTALL_RUBY_VERSION; $HOME/.rbenv/bin/rbenv global $INSTALL_RUBY_VERSION; 

ENTRYPOINT ./entrypoint.sh
