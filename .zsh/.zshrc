## .zshrc

case ${OSTYPE} in
  darwin*)
    source $ZDOTDIR/.zshrc.darwin
    ;;
  linux*)
    source $ZDOTDIR/.zshrc.linux
    ;;
esac

