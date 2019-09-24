#################################################################
# Build the app
FROM ruby:2.4-slim
LABEL maintainer "vijay.gupta@cuelogic.com"
#################################################################


# expose 3000 to the host for the server
EXPOSE 3000


# add https support to apt before going through the next installation steps
RUN apt-get update -qq && apt-get install -y apt-transport-https gpg

# add yarn and node sources
ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
ADD https://deb.nodesource.com/gpgkey/nodesource.gpg.key /tmp/nodekey.gpg
RUN apt-key add /tmp/nodekey.gpg && rm /tmp/nodekey.gpg
RUN echo 'deb https://deb.nodesource.com/node_8.x jessie main' > /etc/apt/sources.list.d/node.list

# update and install
RUN apt-get update -qq && mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && apt-get install -y build-essential libpq-dev postgresql-client curl gnupg ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN apt-get -y install nodejs yarn

# following libraries are needed as dependency for pdfkit gem
RUN apt-get install -y libxrender1 libfontconfig1 libxext6 redis-server ruby-dev

RUN mkdir /app
WORKDIR /app

# install gem deps and yarn deps
RUN echo "1========="
RUN echo $(ls -la)
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
# COPY yarn.lock yarn.lock
RUN gem install bundler
RUN bundle install --binstubs

COPY . .
RUN echo "2========="
RUN echo $(pwd)
RUN true


# precompile the assets
RUN bundle exec rake assets:precompile

WORKDIR /app
#RUN echo "LAST LINE EXECUTED"
CMD ["sh", "entrypoint.sh"]