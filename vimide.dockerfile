#Docker file for VIM IDE with YouCompleteMe       

FROM ubuntu:zesty                                  
RUN apt-get update \                               
&& apt-get -y install git curl vim wget \          
&& git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \                    
&& wget -O /root/.vimrc https://files.linuxpersonal.com/public/vimrc.txt \                             
&& apt-get install build-essential cmake -y \      
&& apt-get install python-dev python3-dev -y       
# RUN vim +PlugInstall +qall                       
# RUN cd ~/.vim/bundle/YouCompleteMe ./install.py --clang-completer                                    
WORKDIR /scripts                                   
CMD ["/bin/bash"]                                  
~                    
