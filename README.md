# Tmux IP Address

The plugin shows public IP Address on the status bar of tmux using `#{ip_address}` syntax on the tmux `status-right` option.


## Usage

Add `#{ip_address}` to your existing `status-right` tmux option:

```bash
set -g status-right '#{ip_address} | #H'
```

You'll now see some information like so:

```
172.116.1.10
```

IP Address can be refreshed by <kbd>prefix</kbd> + <kbd>A</kbd>.
The key combination of refreshing IP Address can be customized by:
```bash
set -g @ip_address_refresh_key 'P'
```

## Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```bash
set -g @plugin 'anghootys/tmux-ip-address'
```

Hit `prefix + I` to fetch the plugin and source it.

`#{ip_address}` interpolation should now work.

### Manual Installation

Clone the repo:

```bash
$ git clone https://github.com/anghootys/tmux-ip-address ~/clone/path
```

Add this line to the bottom of `.tmux.conf`:

```bash
run-shell ~/clone/path/ip_address.tmux
```

Reload TMUX environment:

```bash
# type this in terminal
$ tmux source-file ~/.tmux.conf
```

`#{ip_address}` interpolation should now work.

## License

[MIT](LICENSE)
