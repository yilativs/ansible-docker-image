FROM centos:8
# turns on fastest mirror for dnf
# installs sudo bash-completion openssh-clients vim ansible and ncurses (provides /usr/bin/clear)
# and ansible user to sudoers list in order to let it run sudo without password
RUN echo 'fastestmirror=1' >> /etc/dnf/dnf.conf && dnf install -y epel-release && dnf -y install sudo bash-completion ncurses openssh-clients vim ansible  && dnf clean all && sudo pip3 install "molecule[lint]" &&sudo pip3 install ansible-lint && echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible
ADD https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-doc-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-galaxy-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-playbook-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-pull-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-vault-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-completion.bash /etc/bash_completion.d/
RUN chmod +rx /etc/bash_completion.d/*
RUN adduser ansible
VOLUME ["/etc/ansible"]
VOLUME ["/home/ansible/.ssh"]
USER ansible
CMD ["/bin/bash"]

#the idea with running image with different ansible arguments won't work because you'll have to create container each time
#ENTRYPOINT ["/usr/bin/ansible"]
