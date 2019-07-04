#!/bin/sh

if ! type bundle > /dev/null 2>&1; then
  cat << EOS
"bundler" is not installed.
Please exec following command to install bunlder.

    gem install bundler

EOS
fi

bundle config --global path vendor/bundle
bundle config --global bin vendor/bin
bundle config --global jobs "$(nproc)"
bundle config --global disable_shared_gems true
