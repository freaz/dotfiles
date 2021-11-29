set -l CARGO_BIN $HOME/.cargo/bin
if test -d $CARGO_BIN
  set -x PATH $CARGO_BIN $PATH
end
