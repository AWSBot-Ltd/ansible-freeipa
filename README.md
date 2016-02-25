# ansible-freeipa
An Ansible playbook for configuring FreeIPA server(s) and clients.
* Requires Ansible 2.1.0
* Expects Fedora Release 23/Debian 8 (Jessie)

## Getting started
This playbook is made specifically for a client (Debian 8), server (Fedora 23) architecture. 

The installation of FreeIPA is relatively simple, as FreeIPA supports Fedora out of the box. However debian is not supported, and so has been cobbled together from [snippets](http://pakjiddat.com/installing-freeipa-client-debian) on the internet, and general trial and error.

* Copy the hosts.example file and alter the values for the servers and clients with DNS names for the respective instances.
* Copy the group_vars/all.example.yml and fill in the relavent values for the variables.

Then execute the command
```
  ansible-playbook freeipa.yml
```
Once complete the server will need to be rebooted (see known bugs).

## Known Bugs
 * Joining a server to the domain raises an error about NTP (even though its specified not to) and uploading SSH keys. The server will still be joined to the domain and after a reboot can be logged into.
 * The server requires a reboot, this also causes an error in Ansible - so for now has been removed from the playbook.

Both these errors have been specified to be ignored by Ansible, until a time when they can be properly fixed.

## References
* http://pakjiddat.com/installing-freeipa-client-debian
* http://www.freeipa.org/page/Quick_Start_Guide
* https://docs.fedoraproject.org/en-US/Fedora/15/html/FreeIPA_Guide/linux-manual.html
