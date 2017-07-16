#REF: https://github.com/dougalcampbell/vagrant-quickref/blob/master/vagrant-quickref.md
vagrant box add 
vagrant box add [--provider PROVIDER [--insecure]] NAME URL
vagrant init [ NAME [ URL]]
vagrant up
vagrant ssh-config [--host NAME]
vagrant ssh [-c COMMAND | --command COMMAND [-p | --plain [-- SSH_OPTIONS]]]
flow:
vagrant init russmckendrick/centos71; vagrant up — provider virtualbox

# TODO detectar servidores creados por packer y wrappear gestion/inicio
# desde un vagrantfile puedo crear un box :-?
