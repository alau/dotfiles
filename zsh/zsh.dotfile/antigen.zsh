ADOTDIR=~/.zsh/bundle
source ~/.zsh/bundle/antigen/antigen.zsh

# Load default library
antigen-lib

antigen-theme ~/.zsh/theme.zsh-theme --no-local-clone

antigen-apply
