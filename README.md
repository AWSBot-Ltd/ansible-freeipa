# ansible-freeipa
An Ansible playbook for configuring IPA server(s) and clients.
* Requires Ansible 1.9.4
* Expects RHEL 7 (server)/Debian 8 (client)

## Getting started
This playbook is made specifically for a client (Debian 8), server (RHEL 7) architecture. 

The installation of IPA is relatively simple, as FreeIPA supports Fedora out of the box. However debian is not supported, and so has been cobbled together from [snippets](http://pakjiddat.com/installing-freeipa-client-debian) on the internet, and general trial and error.

* Copy the hosts.example file and alter the values for the servers and clients with DNS names for the respective instances.
* Copy the group_vars/all.example.yml and fill in the relavent values for the variables.

Then execute the command
```
  ansible-playbook ipa-server.yml
```
or
```
  ansible-playbook ipa-client.yml
```
There is also a Makefile which can be used on a localhost (providing the group_vars have been set),
```
  make server
  make client
  make ...
```

Once complete the instance will need to be rebooted (see known bugs).

## Known Bugs
 * Joining a server to the domain raises an error about NTP (even though its specified not to) and uploading SSH keys. The server will still be joined to the domain and after a reboot can be logged into.
 * The server requires a reboot, this also causes an error in Ansible - so for now has been removed from the playbook.

Both these errors have been specified to be ignored by Ansible, until a time when they can be properly fixed.

## References
* http://pakjiddat.com/installing-freeipa-client-debian
* http://www.freeipa.org/page/Quick_Start_Guide
* https://docs.fedoraproject.org/en-US/Fedora/15/html/FreeIPA_Guide/linux-manual.html
* https://www.certdepot.net/rhel7-configure-freeipa-server/
