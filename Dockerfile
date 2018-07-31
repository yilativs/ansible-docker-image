FROM fedora:27
RUN dnf -y install bash-completion openssh-clients vim ansible  
RUN adduser ansible
VOLUME ["/etc/ansible"]
VOLUME ["/home/ansible/.ssh"]
USER ansible
CMD ["/bin/bash"]

#the idea with running image with different ansible arguments won't work because you'll have to create container each time
#ENTRYPOINT ["/usr/bin/ansible"]
