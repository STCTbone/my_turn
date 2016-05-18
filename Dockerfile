FROM elixir:latest

ENV PATH /usr/local/elixir/bin:$PATH
RUN apt-get update && apt-get install -y postgresql-client node
ENV APP_HOME /my_turn
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN mix local.hex --force
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
ADD . $APP_HOME
RUN mix deps.get
RUN mix deps.compile
