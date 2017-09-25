import pysftp
cnopts = pysftp.CnOpts()
cnopts.hostkeys = None
# sftpConn = pysftp.Connection(host='10.20.3.209', port=10022, username='taykey',
#                              private_key_pass='taykey',private_key='~/.ssh/ssh_host_rsa_key_2', cnopts=cnopts)


sftpConn = pysftp.Connection(host='172.17.0.2', port=22, username='sftp-user',
                             private_key_pass='sftp-pass',private_key='~/.ssh/ssh_host_rsa_key', cnopts=cnopts)
print (sftpConn.listdir())
sftpConn.put("somefile")
print (sftpConn.listdir())
sftpConn.close()