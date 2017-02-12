# vim:set ft=dockerfile:
#FROM debian:jessie
FROM ubuntu:16.04

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.4.1" \
	LANG=C.UTF-8

#FROM alpine:edge

#RUN apk --update add openssl ncurses erlang inotify-tools && rm -rf /var/cache/apk/*
RUN apt-get update 
RUN apt-get install -y wget openssl inotify-tools unzip curl
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y erlang

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

RUN wget -q https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip && \
    unzip Precompiled.zip && \
    rm -f Precompiled.zip && \
    ln -s /elixir/bin/elixirc /usr/local/bin/elixirc && \
    ln -s /elixir/bin/elixir /usr/local/bin/elixir && \
    ln -s /elixir/bin/mix /usr/local/bin/mix && \
    ln -s /elixir/bin/iex /usr/local/bin/iex

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mix local.hex --force
RUN wget -q  https://github.com/phoenixframework/archives/raw/master/phoenix_new-1.2.1.ez -O /tmp/phoenix_new-1.2.1.ez
RUN mix archive.install --force /tmp/phoenix_new-1.2.1.ez

RUN mix local.rebar --force

RUN mkdir /appli/

COPY ./ /appli

WORKDIR /appli/

ENV PORT 8080
ENV MIX_ENV prod

RUN mix deps

CMD /appli/entrypoint.sh 