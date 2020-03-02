Setup
===

Run below commands

```bash
git clone git@github.com:taktakty/dotfiles.git
mkdir -p ~/.config/nvim
# zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
# bash
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
# nvim
ln -sf ~/dotfiles/dein.toml ~/.config/nvim/dein.toml
ln -sf ~/dotfiles/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
# ignore
ln -sf ~/dotfiles/ignore ~/.config/git/ignore
```
