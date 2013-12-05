#/bin/sh

# rbenv
cd /usr/local/ && git clone https://github.com/sstephenson/rbenv.git
cd /usr/local/rbenv
mkdir /usr/local/rbenv/shims /usr/local/rbenv/versions
groupadd deployer
chown -R root:deployer /user/local/rbenv/shims
chmod -R 0775 /user/local/rbenv/shims
cp /root/rbenv.sh /etc/profile.d/
chmod 0755 /etc/profile.d/rbenv.sh

# ruby_build
cd /usr/local/src/ && git clone https://github.com/sstephenson/ruby-build.git
cd /usr/local/src/ruby-build && ./install.sh
