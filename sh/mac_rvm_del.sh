#/bin/sh

if [ -f "~/.rvm/bin/rvm" ]; then
    rvm seppuku
    for var in '.bash_profile' '.bashrc' '.bash_logout' '.zprofile' '.zshrc'
    do
        if [ -f "~/${var}" ]; then
        sed '/rvm/d' $var > rvmdel  && mv rvmdel $var
        fi
    done
fi
