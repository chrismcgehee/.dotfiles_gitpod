#!/bin/bash

echo 'Installing dotfiles...'
mkdir -p $HOME/.config/lyncser
# eval $(gp env -e)
if [[ ! -z "$REAL_GCP_ACCOUNT_CREDENTIALS" ]]; then
  echo "Using real GCP account credentials"
  cp $HOME/.gitconfig $HOME/.gitconfig_gitpod
  echo "$REAL_GCP_ACCOUNT_CREDENTIALS" > $HOME/.config/lyncser/credentials.json
  echo "$REAL_GCP_OAUTH_TOKEN" > $HOME/.config/lyncser/token.json
  echo "$REAL_ENCRYPTION_KEY" > $HOME/.config/lyncser/encryption.key
  if [[ ! -z "$LYNCSER_LOCAL_CONFIG" ]]; then
    echo "$LYNCSER_LOCAL_CONFIG" > $HOME/.config/lyncser/localConfig.yaml
  fi
  lyncser sync # download global config 
  lyncser sync --force-download # dowload rest of files 
fi
