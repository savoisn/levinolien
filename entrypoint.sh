#!/bin/bash
MIX_ENV=prod_cc mix ecto.migrate 
MIX_ENV=prod_cc mix phoenix.server
