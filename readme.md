# README #

This project configures a sftp server running on docker, using ssh key and passphrase to login.

###Base docker image
https://github.com/atmoz/sftp


### How do I get set up? ###

Prerequisites:
- docker
- Create the docker (from the home folder of the project): docker build -t sftp-docker .
 
Optional:
- Python (to test the configuration)

####SFTP server configuration ####
2. Generate rsa key (local) on the hosting server (one time configuration):      
ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key     
      passphrase: <passphrase>
3. Run the docker with ssh key configuration:    
docker run -v /home/ubuntu/.ssh/ssh_host_rsa_key.pub:/home/sftp-user/.ssh/keys/id_rsa.pub:ro -p 10022:22 -d sftp-docker sftp-user:sftp-user:1001::sftp-user    

#### SFTP clients configuration ####
1. Copy the certificate from the server to your testing machine:    
scp -i <server's certificate> -r ubuntu@<sftp server host>:~/.ssh/ssh_host_rsa_key ~/.ssh/ssh_host_rsa_key
2. Command line connection properties for staging    
    sftp -v -P10022 -i ~/.ssh/ssh_host_rsa_key sftp-user@<sftp server host>    
      passphrase: <passphrase>

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###
[See further details](www.google.com)
