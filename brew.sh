#! /usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew update
brew upgrade

brew install zsh

brew install git
brew install make
brew install cmake

brew install grep --with-default-names
brew install wget --enable-iri
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew install jq

# Casks
brew tap caskroom/cask

# Must
brew cask install iterm2
brew cask install shiftit
brew cask install karabiner-elements
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install macvim
brew cask install slack
brew cask install aerial

# Likely
brew install node
brew install python
brew install postman

# Optionals
# brew install virtualbox
# brew intsall docker
# brew install robo-3t

# Tryout later
brew cask install alfred
