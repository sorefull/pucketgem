gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 &&
curl -sSL https://get.rvm.io | bash -s stable &&
source ~/.rvm/scripts/rvm &&
rvm install ruby-2.3.1 &&
sudo apt-get update -qq &&
sudo apt-get install libpcap-dev -qq &&
gem install bundler &&
bundle install
