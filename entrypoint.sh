#!/bin/bash
MIX_ENV=prod mix deps
MIX_ENV=prod mix compile
MIX_ENV=prod mix ecto.migrate 
MIX_ENV=prod mix phoenix.server

