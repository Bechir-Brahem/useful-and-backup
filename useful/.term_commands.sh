#!/bin/bash# prints the input
#competitive programming
function cp_tmp_func() {
    mkdir $1
    cd $1
    touch $1.cpp input .clang-format
    # cat /home/bachra/Templates/.clang-format > .clang-format
    # cat /home/bachra/Templates/main.cpp > $1.cpp
    cp /home/bachra/Templates/.clang-format .clang-format
    cp /home/bachra/Templates/main.cpp $1.cpp

    v $1.cpp
}
function cop() {
    cd /home/bachra/cp/
    #1) basic usage "cop problem contest"
    #2) for problems without contests "cop problem"
    #3) just to test quickly "cop"
    if [ ! "$2" = "" ]; then
        if [ ! -d $2 ]; then
            mkdir $2
        fi
        cd $2
        if [ -d $1 ]; then
            echo "the directory $1 exist in $2"
        else
            #creates new problem in the contest dir
            cp_tmp_func $1
        fi
    else
        if [ ! "$1" = "" ]; then
            if [ -d $1 ]; then
                echo "this problem directory exists"
            else
                cp_tmp_func $1
            fi
        else
            #erases test dir and makes a new one
            if [ -d "test" ]; then
                rm -r test
            fi
            cp_tmp_func test
        fi
    fi

}

function cf() {
    if [ -d /home/bachra/cp/cf/$1-c++14 ]; then
        echo "this problem directory exists"
        cd /home/bachra/cp/cf/$1-c++14
    else
        python3 /home/bachra/github/useful-and-backup/useful/parse.py $1
        cd /home/bachra/cp/cf/$1-c++14
    fi
}
function pidoff() {
    ps aux | grep $1 | head -1
}

function com() {
    if [ ! "$1" = "" ]; then
        g++ $1 -o do -Wall -Wextra -pedantic -std=c++11 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Winline -fdiagnostics-parseable-fixits -fdiagnostics-generate-patch -fdiagnostics-show-template-tree -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -D_FORTIFY_SOURCE=2 -fstack-protector -Og -ggdb3
    else
        echo "compiling *.cpp debug mode"
        g++ *.cpp -o do -Wall -Wextra -pedantic -std=c++11 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Winline -fdiagnostics-parseable-fixits -fdiagnostics-generate-patch -fdiagnostics-show-template-tree -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -D_FORTIFY_SOURCE=2 -fstack-protector -Og -ggdb3
    fi
}
function rmm() {
    mv $1 /home/bachra/Desktop/rm_trash/
}

# PS1="\[\e]0;\u: \w\a\]\[\033[01;32m\]BACHRA\[\033[01;37m\]:\[\033[01;33m\]\w\[\033[01;00m\] "

LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:ow=0:"
export LS_COLORS

alias bigkill="kill -n 9"
alias :q="exit"
alias ..="cd .."
alias ....="cd ../.."
alias gdb="gdb -q"
alias upcoming_contest="/home/bachra/github/useful-and-backup/useful/upcoming_contest.py"
alias doc="/home/bachra/github/useful-and-backup/useful/doc_viewer.py"
alias py3="python3"
# alias cf="py3 /home/bachra/github/useful-and-backup/useful/parse.py"
alias thingy="cp ~/Templates/main.cpp ."
alias c="/home/bachra/github/useful-and-backup/useful/compile.py"
alias do="./do"
alias amir="echo \"20898795\""
alias clinic="echo \"36089000\""
alias ambulance="echo \"92147267\""
alias algo="v /home/bachra/github/useful-and-backup/course-notes/algo/notes.md"
