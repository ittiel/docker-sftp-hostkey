# README #

Taykey is transferring files to grapeshot using SFTP (grapeshot configuration)   
In order to replicate this behaviour on our staging environment we configured a sftp server running on docker.   
The dockerfile creates a taykey customized image to support hostkey and passphrase connection
to the sftp as done with Grapeshot.

###Base docker image
https://github.com/atmoz/sftp


### How do I get set up? ###

Prerequisites:
- docker
 
Optional:
- Python (to test the configuration)

####SFTP server configuration ####
1. Generate rsa key (local) on the hosting server (one time configuration):      
ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key 
      passphrase: taykey
2. Run the docker with Taykey configuration:    
docker run -v /home/ubuntu/.ssh/ssh_host_rsa_key.pub:/home/taykey/.ssh/keys/id_rsa.pub:ro -p 10022:22 -d 10.20.22.31:5000/taykey-sftp taykey:taykey:1001::taykey    

#### SFTP clients configuration ####
1. Copy the certificate from the server to your testing machine:    
scp -i <certificate for Taykey production> -r ubuntu@10.20.3.209:~/.ssh/ssh_host_rsa_key ~/.ssh/ssh_host_rsa_key
2. Command line connection properties for staging    
    sftp -v -P10022 -i ~/.ssh/ssh_host_rsa_key taykey@10.20.3.209    
      passphrase: taykey

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###
[See further details](www.google.com)