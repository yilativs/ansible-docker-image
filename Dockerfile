FROM fedora:27
RUN dnf -y install bash-completion openssh-clients vim ansible  && dnf clean all
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
