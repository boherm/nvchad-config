# Boherm NvChad config

## How to install?

1) Install nvim:
```
brew install nvim
```

2) Install NvChad:
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

3) Istall this configuration:
```
git clone https://github.com/boherm/nvchad-config ~/.config/nvim/lua/custom &&
nvim

```

4) Install Neovide:
```
brew install --cask neovide`
```

5) Enjoy!!

## Troubleshooting

**If you have some build problems with fzf, try this:**
```
cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim/
gcc -Wno-nullability-completeness -shared src/fzf.c -o build/libfzf.so
```
