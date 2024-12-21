#!/usr/bin/env bash

function sadd {
  eval "$(ssh-agent)"
  ssh-add ~/.ssh/id_ed25519
}
