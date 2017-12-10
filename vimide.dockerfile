#Docker file for VIM IDE with YouCompleteMe          

FROM ubuntu:latest
RUN apt update \
&& apt install -y git curl vim wget \
&& wget -O /root/.vimrc https://files.linuxpersonal.com/public/vimrc.txt \
&& apt install -y build-essential cmake python python3 python-dev python3-dev \
&& mkdir -p /root/.vim/bundle

#Git Clone Plugins                        
RUN cd /root/.vim/bundle \
&& git clone https://github.com/VundleVim/Vundle.vim \
&& git clone https://github.com/scrooloose/nerdtree \
&& git clone https://github.com/majutsushi/tagbar \
&& git clone https://github.com/kien/ctrlp.vim \
&& git clone https://github.com/bling/vim-airline \
&& git clone https://github.com/vim-airline/vim-airline-themes \
&& git clone https://github.com/Lokaltog/powerline \
&& git clone https://github.com/fisadev/FixedTaskList.vim \
&& git clone https://github.com/rosenfeld/conque-term \
&& git clone https://github.com/tpope/vim-surround \
&& git clone https://github.com/flazz/vim-colorschemes \
&& git clone https://github.com/garbas/vim-snipmate \
&& git clone https://github.com/MarcWeber/vim-addon-mw-utils \
&& git clone https://github.com/tomtom/tlib_vim \
&& git clone https://github.com/honza/vim-snippets \
&& git clone https://github.com/tpope/vim-commentary \
&& git clone https://github.com/mitsuhiko/vim-sparkup \
&& git clone https://github.com/Rykka/riv.vim \
&& git clone https://github.com/scrooloose/syntastic \
&& git clone https://github.com/Valloric/MatchTagAlways \
&& git clone https://github.com/tmhedberg/SimpylFold \
&& git clone https://github.com/jnurmine/Zenburn \
&& git clone https://github.com/SirVer/ultisnips \
&& git clone https://github.com/vim-scripts/closetag.vim \
&& git clone https://github.com/mattn/emmet-vim \
&& git clone https://github.com/morhetz/gruvbox \
&& git clone https://github.com/Valloric/YouCompleteMe

RUN cd /root/.vim/bundle/YouCompleteMe \
&& git submodule update --init --recursive
RUN /root/.vim/bundle/YouCompleteMe/install.py --clang-completer

WORKDIR /scripts
CMD ["/bin/bash"]
