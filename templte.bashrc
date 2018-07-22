export TERM=xterm-256color
## custom busyboxの使用を許可する
export PATH=$HOME/kawaii-term/bin:$PATH
## lコマンドをls -CFとメタ情報の表示に割り当てる
function L() {
  ls -CF;
}
alias l=L
## pコマンドをpwdに割り当てる　
alias p=pwd
FREE_MEM()
{
   python3 $HOME/kawaii-term/kawaii-term.py --mem
}
CPU_USAGE()
{
  python3 $HOME/kawaii-term/kawaii-term.py --vmstat
}
EMOJI()
{
  python3 $HOME/kawaii-term/kawaii-term.py --emoji
}
export PS1='$(free_mem) prompt > '
GREEN="\[$(tput setaf 2)\]"
PINK="\[$(tput setaf 199)\]"
YELLOW="\[$(tput setaf 220)\]"
ORANGE="\[$(tput setaf 202)\]"
BLUE="\[$(tput setaf 33)\]"
CYAN="\[$(tput setaf 111)\]"
RESET="\[$(tput sgr0)\]"
ULINE="\[$(tput smul)\]"
EULINE="\[$(tput rmul)\]"
BOLD="\[$(tput bold)\]"
STIM="\[$(tput sitm)\]" # 斜線開始
RTIM="\[$(tput ritm)\]" # 斜線終了
BCC_T="\[$(tput setb 7)\]"
export PS1="\[\$(tput sc; tput rc)\]${YELLOW}\$(EMOJI)${RESET} ${BCC_T}${CYAN}\$(FREE_MEM)${RESET} ${ORANGE}\W${RESET}${EULINE} ${BOLD}${BLUE}>${RESET} "