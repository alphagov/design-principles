#!/bin/bash -xe

set -e

export RAILS_ENV=test

git clean -fdx

bundle install --path "${HOME}/bundles/${JOB_NAME}" --deployment

bundle exec rake
GOVUK_APP_DOMAIN=test.gov.uk bundle exec rake assets:precompile
