#!/bin/bash

# Make sure Homebrew is installed.
which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing Homebrew ..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "Installing Homebrew Cask ..."
    brew tap caskroom/cask

    echo "Installing Homebrew Versions Cask ..."
    brew tap caskroom/versions  # used to get java 8
fi

echo "Updating Homebrew ..."
brew update   # this also updates homebrew cask and versions

# Make sure Ansible is installed
which -s ansible
if [[ $? != 0 ]] ; then
    echo "Installing Ansible ..."
    brew install ansible
fi

# Run the local dev Ansible playbook.
ansible-playbook --ask-become-pass -i inventories/development playbooks/setup-localdev.yml
