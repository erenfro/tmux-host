# Tmux Host Status

Plugin that shows what host you're accessing, and what username you're accessinging it with.

### Usage

Just add `#{username}` and/or `#{hostname}` to your left or right status bar/

```tmux.conf
set -g status-right '#{username} #{hostname} | %a %Y-%m-%d %H:%M'
```

### Installation with Tmux Plugin Manager (recommended)

Add the plugin to the list of TPM plugins:

```tmux.conf
set -g @plugin 'https://git.linux-help.org/psi-jack/tmux-host'
```

Press prefix+I to install it.

### Manual Installation

Clone the repo:

```bash
$ git clone https://git.linux-help.org/psi-jack/tmux-host ~/clone/path
```

Add this line to your .tmux.conf:

```tmux.conf
run-shell ~/clone/path/host.tmux
```

Reload TMUX environment with:

```bash
tmux source-file ~/.tmux.conf
```

### Configurations

FIXME

### License

[MIT](LICENSE)

