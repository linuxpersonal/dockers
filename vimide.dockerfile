#Docker file for VIM IDE with YouCompleteMe       

FROM alpine:latest                                  
RUN apk update \                               
&& apk add git curl vim wget \          
&& git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \                    
&& wget -O /root/.vimrc https://files.linuxpersonal.com/public/vimrc.txt \                             
&& apk add build-base cmake python python3 \
&& apk add python-dev python3-dev       

WORKDIR /scripts                                   
CMD ["/bin/sh"]                                  

## Run the below commands via docker terminal after build
# vim +PlugInstall +qall                       
# cd ~/.vim/bundle/YouCompleteMe 
# ./install.py --clang-completer                                    
