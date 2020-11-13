#!/bin bash



if [ -z "$SRC_ROOT" ] ; then
    SRC_ROOT=~/git
fi


while getopts 'i:e:' opt; do
    case "${opt}" in
            i) fn=$(basename i$OPTARG)
                cp $OPTARG $SRC_ROOT/dotfiles/$fn ;;
            e) if [ -f ~/$OPTARG ] ; then
                   echo "Copying ~/$OPTARG to ~/${OPTARG}.df_bak"
                   cp ~/$OPTARG ~/${OPTARG}.bak
               fi
           cp $SRC_ROOT/dotfiles/$OPTARG ~/ ;;
        *) echo "Required params either -i or -e" && exit 1 ;;
    esac
done



