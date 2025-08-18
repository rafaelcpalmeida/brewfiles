#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/bundle
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install the Homebrew packages I use on a day-to-day basis.
brew bundle install --file=Brewfile --verbose

# INSTAL CASK APPLICATIONS

brew bundle install --file=Brewfile-cask --verbose

# Remove outdated versions from the cellar
brew cleanup

# Copy Ghostty configs to the proper place
mkdir -p ~/.config/ghostty
cp -r ghostty-config ~/.config/ghostty/config
