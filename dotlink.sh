#!/usr/bin/env bash
set -ue

helpmsg() {
    echo "Usage: $0 [--help | -h]" 0>&2
    echo ""
}

link_to_homedir() {
    if [ ! -d "$HOME/.dotbackup" ];then
        echo "$HOME/.dotbackup not found. Auto make it."
        mkdir "$HOME/.dotbackup"
    fi

    dotfiles_dir=$(cd $(dirname $0); pwd)
    for f in $dotfiles_dir/.??*; do
        local f_filename
        f_filename=$(basename "$f")
        [[ "$f_filename" == ".DS_Store" || \
            "$f_filename" == ".git" || \
            "$f_filename" == ".gitignore" || \
            "$f_filename" == ".gitmodules" ]] && continue
        # すでにシンボリックリンクが存在する場合は削除
        if [[ -L "$HOME/$f_filename" ]];then
            command rm -f "$HOME/$f_filename"
        fi
        # dotファイルまたはディレクトリが存在する場合はbackup
        if [[ -e "$HOME/$f_filename" ]];then
            command mv "$HOME/$f_filename" "$HOME/.dotbackup"
        fi
        command ln -snfv $f $HOME
    done
}

while [ $# -gt 0 ];do
    case ${1} in
        --debug|-d)
            set -uex
            ;;
        --help|-h)
            helpmsg
            exit 1
            ;;
        *)
            ;;
    esac
    shift
done

link_to_homedir
command echo -e "Install completed!!!"
