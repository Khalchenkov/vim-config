# vim-config

## Vim
Vim last version

## Nerd Fonts

[Nerd fonts site](https://www.nerdfonts.com/)

Recomended font version < 3version

Move archive to `~/.local/share/fonts/`, unzip archive, remove zip file and run

```bash
fc-cache -fv
sudo fc-cache -fv
```

## Nodejs

[Nodejs site](https://nodejs.org/en)

Or use npm

```bash
npm cache clean -f
sudo npm install -g n
sudo n stable
```

## Vim-plug

[Vim-plug github](https://github.com/junegunn/vim-plug)

## Coc-settings

Run `:CocConfig`

```json
{
  "inlayHint.enable": false
}
```
