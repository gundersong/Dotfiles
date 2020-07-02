# Dotfiles

### .vimrc
Lives in ~/.vimrc and holds all the configuration, shortcut remaps and plugin information for vim/neovim.

To ensure this config works from scratch, you must first install [vim-plug](https://github.com/junegunn/vim-plug).

Then, once that is installed, open vim/neovim and run `:PlugInstall`, which will install all the required plugins.


### .tmux.conf
Lives in ~/.tmux.conf and holds the custom configuration of tmux.


### init.vim
Lives in ~/.config/nvim/init.vim, and creates the config for neovim, including sourcing the existing vim config in ~/.vimrc.


### coc-settings.json
Can be updating by running `:CocConfig` in vim once the first ~/.vimrc file has been added.

