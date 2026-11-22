# Foxberry for the shell: file colors, fzf, autosuggestions and htop.
# Source it in ~/.zshrc after your plugins:  source /path/to/foxberry/themes/shell/foxberry.zsh
# Set FOXBERRY_DIR if the theme files live elsewhere.
# Part of Foxberry, a light Nord theme. MIT license; see LICENSE and THIRD_PARTY_NOTICES.md.

: ${FOXBERRY_DIR:=${0:A:h:h}}

# eza / ls and the completion menu
export LS_COLORS="$(<$FOXBERRY_DIR/ls/foxberry-ls-colors)"
export EZA_COLORS="$(<$FOXBERRY_DIR/eza/foxberry-eza-colors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# fzf (fzf takes the last value of each key, so this goes after your own options)
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=fg:#3b4252,fg+:#2e3440:bold --color=bg:-1,bg+:#c9d0dc --color=hl:#287f92,hl+:#2b5f6e --color=info:#6a7488,prompt:#5374b3,pointer:#287f92:bold --color=marker:#4e8044,spinner:#986393,header:#967044 --color=border:#8e97a8,separator:#8e97a8,scrollbar:#8e97a8 --color=label:#3b4252,query:#3b4252:regular --color=gutter:#e5e9f0,selected-bg:#d8dee9,selected-fg:#2e3440"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#8e97a8'

# fast-syntax-highlighting
(( ${+FAST_HIGHLIGHT_STYLES} )) && source $FOXBERRY_DIR/fast-syntax-highlighting/foxberry.zsh

# htop has no themes and draws its bars as ANSI 0 text on cyan/green, which is
# 2.2:1 on Foxberry. While htop runs, ANSI 0 becomes light (OSC 4, 4.0:1);
# OSC 104 restores the terminal color afterwards, also after Ctrl-C.
htop() {
  printf '\e]4;0;#ECEFF4\a'
  { command htop "$@" } always { printf '\e]104;0\a' }
}
