##
# Namedir
##

namedir() { eval $1=\$2 ; if [[ ! -d ~$1 ]] then unset $1 ; fi }

