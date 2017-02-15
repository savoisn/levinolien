#!/bin/bash
npm install && node node_modules/brunch/bin/brunch build --production
MIX_ENV=prod_cc mix deps
MIX_ENV=prod_cc mix compile
MIX_ENV=prod_cc mix ecto.migrate 
MIX_ENV=prod_cc mix phoenix.server
