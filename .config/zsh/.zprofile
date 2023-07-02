#!/bin/bash
# ~/.zsh_profile
#

. $HOME/.profile

if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/share/gem/ruby/3.0.0/bin" ]; then
    PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
fi

