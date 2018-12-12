#! /bin/zsh

echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "clone zsh: autosuggestions, completions, alias-tips, syntax-highlighting"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "clone Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "copying files from here to HOME"
cp blinks-custom.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/
cp .zshrc ${HOME}/.zshrc
source ~/.zshrc
cp .vimrc ${HOME}/.vimrc

echo "installing vim plugins"
vim +PluginInstall +qall

echo "copying vscode settings"
cp vscode.settings.json ~/Library/Application\ Support/Code/User/settings.json
cp vscode.keybinding.json ~/Library/Application\ Support/Code/User/keybindings.json

echo "importing iTerm2 colorscheme"
open "shaman-custom.itermcolors";ok

echo "adding global .gitignore"
cp .gitignore_global ~/.gitignore_global
git config --global --replace-all core.excludesfile ~/.gitignore_global


##########################
##### System configs #####
##########################
echo "enabling ssh"
sudo systemsetup -setremotelogin on

echo "disable Are You Sure you want to open this application message"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Disable local Time Machine snapshots"
sudo tmutil disablelocal;ok

echo "Set standby delay to 24 hours (default is 1 hour)"
sudo pmset -a standbydelay 86400;ok

echo "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" ";ok

echo "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false;ok


echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true;ok


echo "Disable the crash reporter"
defaults write com.apple.CrashReporter DialogType -string "none";ok


echo "Reveal IP, hostname, OS, etc. when clicking clock in login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName;ok


echo "Disable smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false;ok

echo "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false;ok

echo "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1;ok



echo "Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false;ok

echo "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40;ok

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3;ok



# echo "Use scroll gesture with the Ctrl (^) modifier key to zoom"
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144;ok
# echo "Follow the keyboard focus while zoomed in"
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true;ok


echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false;ok

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10;ok


echo "Set measurement units and use metrics"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true;ok


echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0;ok



echo "Allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true;ok

echo "Disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true;ok


echo "Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true;ok

echo "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;ok

echo "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true;ok

echo "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true;ok

echo "Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true;ok

echo "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv";ok

echo "Set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36;ok

echo "Change minimize/maximize window effect to scale"
defaults write com.apple.dock mineffect -string "scale";ok

echo "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true;ok

echo "Enable spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true;ok

echo "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true;ok

echo "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false;ok

echo "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1;ok


echo "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true;ok

echo "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true;ok

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true;ok

echo "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0;ok
echo "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0;ok

echo "Bottom right/left screen corner → Start screen saver"
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0;ok
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0;ok

echo "set system-wide hotkey to show/hide iterm with ^\`"
defaults write com.googlecode.iterm2 Hotkey -bool true;ok

echo "animate split-terminal dimming"
defaults write com.googlecode.iterm2 AnimateDimming -bool true;ok

