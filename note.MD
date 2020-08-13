 ~/.oh-my-zsh/plugins/
 
 plugins: yarn ansible cloudfoundry docker docker-compose gradle kubectl node nvm zsh-z zsh-autosuggestions
 
 git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
 
 
 
 sudo chmod -R 755  /home/yoyo/.oh-my-zsh/plugins/            
 touch ~/.z
 
 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
