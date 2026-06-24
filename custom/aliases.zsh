
# aliases defined by me

# change dir and list contents
cl() {
    cd "$@" && ls
}
# compile as latex and open pdf
otex() {
    pdflatex "$@" && xdg-open "${@%'.tex'}.pdf"
}

# connect to wpa network
wpac() {
    sudo ip link set wlp1s0 up
    sudo wpa_supplicant -B -i wlp1s0 -c /etc/wpa_supplicant/wpa.conf && sudo dhcpcd
}
# register new network
wpanew() {
    entry=$(wpa_passphrase $1 $2)
    if [[ $? -eq 0 ]]; then
        echo "Adding the following network entry:"
        echo $entry

        echo $entry >> /etc/wpa_supplicant/wpa_supplicant-wlp1s0.conf
        systemctl restart wpa_supplicant@wlp1s0.service
        return 0
    else
        return 1
    fi
}
# zsh config
alias srcz='source ~/.zshrc'
# ros setup file
# alias srcr='source ~/catkin_ws/devel/setup.zsh'
# shorter nvim
alias nv='nvim'
alias vi='nvim'
# ls looking cute
#   G: colorized output ON MAC :(
#   F: symbols denoting type (dir /, exec *, etc.)
alias ls='ls -F --color=always'
alias ll='ls -lah'
alias lt='ls -ltr'
# start qutebrowser in the background
#   l critical: only log critical messages in terminal
alias qb='qutebrowser -l critical &'
alias cg='cargo'
# tree piped to less with:
#   p: file type and permissions (like ls -l)
#   h: size with prefixes
#   F: symbols denoting type (dir /, exec *, etc.)
#   C: force colorized output
alias tls='tree -phFC | less -R'
# ps piped to grep
#   ef: show all files
alias psgr='ps -ef | grep'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias c="tr -d '\n' | xclip -i -selection clipboard"
alias v="xclip -o -selection clipboard"
# alias kc="kitty +kitten clipboard"
# alias kv="kitty +kitten clipboard --get-clipboard"
alias fzfc='fzf | tr -d '\n' | xclip -i -selection clipboard'
# zsh native moving and renaming utility
# uses simple regexes, matches occurences of * in src/dest
autoload zmv
alias mmv='noglob zmv -W'
alias o='xdg-open'
alias py=python3
alias pm='paru'
alias ge="grep -e"
alias sysc="systemctl"


colors() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}
# safer rm and mv
#   b: if moving would overwrite, create new with ~ appended
#
# alias mv="mv -b"
# alias REALLY_RM_FOR_REAL=/bin/rm
# rm() {
#     mv "$@" $USER_TRASH_DIR
# }
#
#

sledup() {
  local num="${1:-01}"
  ssh -vvv -i ~/.ssh/id_ed25519 spire@glas-sled"${num}"-pc01.eng.spire.com
}


