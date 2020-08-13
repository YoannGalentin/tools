 ~/.oh-my-zsh/plugins/
 
 plugins: yarn ansible cloudfoundry docker docker-compose gradle kubectl node nvm zsh-z zsh-autosuggestions
 
 git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
 
 
 
 sudo chmod -R 755  /home/yoyo/.oh-my-zsh/plugins/            
 touch ~/.z
 
 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions







sudo apt-get update
sudo apt-get install -y vim
sudo apt install -y ansible git

# docker
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo apt-get install -y docker-compose


sudo usermod -aG docker ansible
sudo usermod -aG docker adecewas
