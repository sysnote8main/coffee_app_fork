#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
./bin/rails assets:precompile
./bin/rails assets:clean
bundle exec rails s -p 3000 -b ENV["FRONT_PORT"]