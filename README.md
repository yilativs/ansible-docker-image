# ansible-docker-image
Provides a docker image with ansible, open-sshclient, vim, bash-completions and  volumes to import ansible configs and ssh keys from local system,
thus allowing to have a latest version of anisble in any operating system supporing docker (windows, macos, linux).

# Usage:
Create a container:
~~~
docker create  --name ansible-playground -v /home/yourAccount/ansible-config:/home/yourAccount/ansible-config -v /home/yourAccount/.ssh:/home/ansible/.ssh -it yilativs/ansible:2.6
docker start -i ansible-playground
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
