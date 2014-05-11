#
# Convenience function to go up n directories
# 
up () {
    local x="";
    for i in $(seq ${1:-1}); do
        x="$x../";
    done;
    cd $x;
}
