#/bin/sh

if [ -f "/home/deployer/.rvm/bin/rvm" ]; then
    rvm seppuku
    for var in '.bash_profile' '.bashrc' '.bash_logout' '.zprofile' '.zshrc'
    do
        sed '/rvm/d' $var > rvmdel  && mv rvmdel $var
    done
fi
