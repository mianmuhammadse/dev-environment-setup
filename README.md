# Dotfiles

My personal dotfiles managed with GNU Stow and backed up on GitHub.

## What's Inside

- **nvim**: Neovim configuration files
- **tmux**: Tmux configuration files

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- Git

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
   ```

2. Change to the dotfiles directory:

   ```bash
   cd ~/dotfiles
   ```

3. Use Stow to symlink configurations:

   ```bash
   # Install all configurations
   stow */

   # Or install specific configurations
   stow nvim
   ```

## How It Works

This repository uses GNU Stow to manage dotfiles. Stow creates symlinks from the files in this repository to their expected locations in your home directory.

The directory structure in each package mirrors the structure relative to your home directory. For example:

- `nvim/.config/nvim/init.vim` → `~/.config/nvim/init.vim`
- `tmux/.tmux.conf` → `~/.tmux.conf`

## Adding New Configurations

1. Create a new directory for your configuration:

   ```bash
   mkdir -p ~/dotfiles/new_config/.config
   ```

2. Move your configuration files, preserving the directory structure:

   ```bash
   mv ~/.config/new_config ~/dotfiles/new_config/.config/
   ```

3. Stow the new configuration:

   ```bash
   cd ~/dotfiles
   stow new_config
   ```

4. Commit and push your changes:
   ```bash
   git add .
   git commit -m "Add new configuration"
   git push
   ```

## Updating Configurations

Simply update the files in the dotfiles repository, and the changes will be reflected in your home directory via the symlinks. Don't forget to commit and push your changes to keep your GitHub backup current.

## Removing Configurations

To remove the symlinks for a specific configuration:

```bash
stow -D nvim
```

## Restowing After Updates

If you've added new files to your configuration, you may need to restow:

```bash
stow -R nvim
```

## Troubleshooting

- Use `stow -n -v package_name` to simulate stowing and see what would happen
- If you get conflicts, make sure you've moved the original files to your dotfiles repository

## Neovim Setup

The Neovim configuration follows Josean's 2024 setup guide, which includes:

- Lazy.nvim as the plugin manager
- Telescope for fuzzy finding
- LSP configuration with Mason
- Treesitter for syntax highlighting
- Themes and statusline customizations

## Tmux Setup

The tmux configuration includes:

- Custom key bindings (prefix set to Ctrl+a)
- Status bar customization
- Mouse support
- Integration with system clipboard
- Better pane navigation

## Tmux Plugin Manager (TPM)

To install tmux plugins:

1. Install TPM if you haven't already:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. In a tmux session, press `prefix + I` to install the plugins

## License

MIT

## Author

Mian Muhammad
