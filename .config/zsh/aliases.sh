# =================================================
# =================================================
# ================ SNAEK'S ALIASES ================
# =================================================
# =================================================

alias cpu="ps axch -o cmd:20,pid:15,%cpu --sort=-%cpu | head"
alias mem="ps axch -o cmd:20,pid:15,%mem --sort=-%mem | head"
alias ports="sudo lsof -iTCP -sTCP:LISTEN -n -P"                    # Show currently open ports with an easy-to-remember command
alias colors="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | zsh"
alias cra='npx create-react-app'
alias sudoo='sudo -E env "PATH=$PATH"'                              # If you've issues with PATH being different with a sudo command, this is one solution.

# git

alias gitfiles="git ls-tree --full-tree --name-only -r"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# Adding flags
alias df='df -h'                                                    # Human-readable sizes
alias free='free -m'                                                # Show sizes in MB
alias du='sudo du -h --max-depth 1'                                 # Human-readable way of easily seeing which directories in pwd take up the most space on the drive
alias grep='grep --color=auto'

# packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Get top process eating memory/CPU
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'

# Changing ls to exa
alias ls='exa -al --color=always --group-directories-first'         # Exa is a non-standard improvement of ls, with (mostly) the same flags
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
alias lD='exa -D --color=always'
alias lr='exa -tRFh'


# Shortcuts to copy/paste
alias c="xclip -sel clip"           # Copy to system clipboard
alias v="xclip -o -sel clip"        # Paste from system clipboard
alias cx="xclip"                    # Copy to X register, pastable only in X apps
alias vx="xclip -o"                 # Paste from X register

# Network
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# Advent of Code (WARN! Session cookie is private. Set it as an environment variable to avoid leaking it to Github, etc)
getaocinput() {
    # Parameter is an integer representing the day you wish to get the input for.
    curl "https://adventofcode.com/$(date +%Y)/day/$1/input" -X GET -H "Cookie: session=$AOCSESSION" > input.txt
}

# Shortcut for Doom Emacs
alias doom="$HOME/.emacs.d/bin/doom"

# Shortcut for serving the current folder to localhost:9000
alias serve="browser-sync start -s -f . --no-verify --host $(ip route get 1.1.1.1 | awk '{print $7}') --port 9000 --browser firefox-developer-edition"

# Copy file contents to clipboard
#alias filetoclipb='xclip -selection clipboard < "$1"'
filetoclipb() {
    xclip -selection clipboard < "$1"
}

# Requires yt-dlp (the replacement for youtube-dl)
dl() {
    # yt-dlp --extract-audio --audio-format 'mp3' --audio-quality 0 "$1"
    yt-dlp -x --audio-format 'mp3' --embed-metadata --audio-quality 0 -o "%(artist)s - %(track)s.%(ext)s" "$1"
}

# Update to currently fastest mirrors
alias updmirrors="sudo pacman-mirrors --fasttrack"

# Fetch Meyer's CSS reset to current folder
# alias cssreset="wget https://meyerweb.com/eric/tools/css/reset/reset.css"
alias cssreset="cp $HOME/dev/modernreset.css ./reset.css"

alias utilcss="cp $HOME/dev/utilities.css ./util.css"

cssnormalize() {
    if [ "$1" = "mini" ]; then
        wget https://cdn.jsdelivr.net/npm/modern-normalize/modern-normalize.min.css
    elif [ "$#" -eq "0" ]; then
        wget https://cdn.jsdelivr.net/npm/modern-normalize/modern-normalize.css
    fi
}

# Remap `colorer` to use the right directory automatically
color() {
    colorer "/home/ken/.config/colorer/colorschemes/$1" "/home/ken/.config/colorer/out"
}

alias mpdrpc="mpd-discord-rpc"
alias vim="nvim"
alias vi="nvim"

imagine() {
    python \
        $HOME/ai/stable-diffusion/scripts/txt2img.py \
        --plms \
        --ckpt sd-v1-4.ckpt \
        --skip_grid \
        --n_samples 1 \
        --seed 42 \
        --prompt \
        "$1"
}

# Reassigning useless (oh-my-)zsh shortcut to something a little more useful, like, I don't know, maybe a markdown previewer
unalias md
md() {
    pandoc "$1" | lynx -stdin;
}

mktex() {
    latexmk -pdfxe -pvc "$1"
}

invoke() {
    source $HOME/invokeai/.venv/bin/activate && \
    invokeai --web
}

a1111() {
    $HOME/stable-diffusion-webui/webui.sh --api --xformers
}
