#!/bin/bash

# Get the latest version of Homebrew.
echo "Updating Homebrew ..."
brew update

# Get the latest version of Hombrew Cask.
echo "Updating Homebrew Cask ..."
brew tap caskroom/cask

# Get the Homebrew Versions Cask (necessary for installing java 8)
echo "Updating Homebrew Versions Cask ..."
brew tap caskroom/versions

# Get the latest version of Ansible.
echo "Updating Ansible ..."
brew install ansible

# Run the local dev Ansible playbook.
ansible-playbook --ask-become-pass -i inventories/development playbooks/setup-localdev.yml
