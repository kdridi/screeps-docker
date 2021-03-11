FROM node:10
LABEL maintainer="Karim DRIDI <karim.dridi@gmail.com>"

RUN apt update && \
    apt install -y sudo && \
    useradd -l -u 33333 -G sudo -md /home/screeps -s /bin/bash -p screeps screeps && \
    sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

ENV HOME=/home/screeps
WORKDIR $HOME

RUN { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> .bashrc

USER screeps

COPY vendor/github.com/screeps/screeps.git/ ./

RUN sudo rm -rf .git* && \
    sudo chown -R screeps:screeps $HOME && \
    npm install

EXPOSE 21025

COPY "docker-entrypoint.sh" /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start"]