FROM fedora:33
# turn on fastest mirror for dnf
# install sudo bash-completion openssh-clients vim ansible
# and ansible user to sudoers list in order to let it run sudo without password
RUN echo 'fastestmirror=1' >> /etc/dnf/dnf.conf && dnf -y install sudo bash-completion openssh-clients vim ansible  && dnf clean all && echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible
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
