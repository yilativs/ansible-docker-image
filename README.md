# ansible-docker-image
Provides a docker image with pre-installed ansible and ansible-lint,molecule,open-sshclient,bash-completions  and defined volumes to import ansible configs and ssh keys from local system, thus allowing to have a multiple versions of ansible on same computer per project.

# Usage:
Build container (optional)
docker build -t yilativs/ansible:2.9.3 .



Create a container:
~~~
docker create  --name ansible4yourProject -v /home/yourAccount/yourProject/ansible-config-dir:/etc/ansible -v /home/yourAccount/.ssh:/home/ansible/.ssh -it yilativs/ansible:2.9.3
docker start -i ansible4yourProject
~~~

`WARNING: docker requires full paths for volumes DO NOT USE ~/.ssh instead provide full paths, e.g. /home/yourUserName/.ssh`

when running ansible from container to connect to nodes with users other than ansible specify ssh user with option --user  (see https://docs.ansible.com/ansible/latest/cli/ansible.html)

or define it via group variables in a file group_vars/all:
(see  https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)
```
ansible_connection: ssh
ansible_ssh_user: yourUserName
ansible_ssh_pass: betterUseSshKeysThanStoreUnprotectdPassword
```

NOTE: When using ssh on servers don't forget to adduser ansible (or the one you like) and execute  
```
ssh-copy-id ansible@for-all-of-your-ansible-managed-hosts
```
