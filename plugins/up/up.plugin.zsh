#
# Convenience function to go up n directories
# 
_up () {
    local x="";
    for i in $(seq ${1:-1}); do
        x="$x../";
    done;
    cd $x;
}

alias up='_up 2>&1'
