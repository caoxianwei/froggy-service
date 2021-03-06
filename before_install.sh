#!/bin/sh

if { [ "$TRAVIS_BRANCH" == "master" ] ||
     [ "$TRAVIS_BRANCH" == "staging" ] ||
     [ "$TRAVIS_BRANCH" == "release" ]; } && [ "$TRAVIS_PULL_REQUEST" == "false" ];
then
  openssl aes-256-cbc -K $encrypted_1fa28bd21641_key -iv $encrypted_1fa28bd21641_iv -in secrets.tar.enc -out secrets.tar -d
  tar xvf secrets.tar
  sudo cp .env.travis .env
  sudo cp gs_credential.json backend/gs_credential.json
else
  sudo cp .env.example .env
fi
