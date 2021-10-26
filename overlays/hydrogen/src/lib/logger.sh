info() { printf "$(yellow_bold [HYDROGEN]) $(yellow $1)"; }
error() { printf "$(red_bold [HYDROGEN]) $(red_underlined FAILED) $(red $1)\n"; }
success() { printf "$(green_bold [HYDROGEN]) $(green $1)\n"; }
