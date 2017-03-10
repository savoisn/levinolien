FROM bitwalker/alpine-elixir-phoenix:latest

#RUN wget -q  https://github.com/phoenixframework/archives/raw/master/phoenix_new-1.2.1.ez -O /tmp/phoenix_new-1.2.1.ez && \
  #mix archive.install --force /tmp/phoenix_new-1.2.1.ez && \
  #rm /tmp/phoenix_new-1.2.1.ez && \
RUN  mix local.hex --force && \
  mix local.rebar --force 


# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD package.json package.json
RUN npm install

ADD . .

# Run frontend build, compile, and digest assets
RUN brunch build --production && \
    mix do compile, phoenix.digest

CMD ["entrypoint.sh"]
