#This script will cover just the startup of ssh server on the Kali Linux box

#Lets greet the user first
echo " "
echo "***********************************************************************"
echo "Hello There.....! Just got Kali Linux newly installed...? That's great :) "
echo "Let's configure the SSH server to start upon every boot-up so you could connect to it remotely"
echo "Sit back and relax let the script do the majority of work for you."
echo "***********************************************************************"
#Let's talk technical now

#Step1
#Asking for user input to install the ssh server onto the system
echo " "
echo " "
echo " "
echo "***********************************************************************"
echo "Do yo want to install the SSH server onto your system...?(Y/N)"
read ENTRY
if [ $ENTRY = "Y" ];
then
	sudo apt-get install openssh-server -y
else 
	echo "You choose not to enable ssh on startup :( Program terminated...! "
fi
echo "***********************************************************************"

#Step2
#Backing up the old_ssh_default keys into a new seperate file
echo " "
echo " "
echo " "
echo "***********************************************************************"
echo "We need to backup these files into a new directory:"
echo " "
cd /etc/ssh/ &&  ls
echo "***********************************************************************"

echo " "
echo " "
echo " "
echo "************************************************************************"
#Actually moving the files
mkdir /etc/ssh/old_default_ssh_keys
echo "Files Moved."
echo "************************************************************************"

#This command creates the new directory for backing up the ssh keys
mv /etc/ssh/ssh_host_* /etc/ssh/old_default_ssh_keys

#Step3
#Regenerating the ssh keys
echo " "
echo " "
echo " "
echo "************************************************************************"
dpkg-reconfigure openssh-server
echo "************************************************************************"
#Step4
#Start ssh service for every instance of bootup
echo " "
echo " "
echo " "
echo "***********************************************************************"
systemctl enable ssh.service
echo "***********************************************************************"
#This command adds ssh service to the startup programs

#Step5
#Start ssh for that instance of bootup
systemctl start ssh.service 

#Step6
#Show the status of the ssh service
echo " "
echo " "
echo " "
echo "***********************************************************************"
echo " The status of ssh service on your system is: "
echo " "
systemctl status ssh.service
echo "************************************************************************"

#Step7
#Editing the ssh server configuration file
#First let us see the contents of the ssh server configuration file
echo " "
echo " "
echo " "
echo "********************************************************************"
echo "This is your sshd_config file: "
echo " "
cat /etc/ssh/sshd_config
echo "********************************************************************"

#Getting the user to change the configuration file
echo " "
echo " "
echo " "
echo "***********************************************************************"
echo "In order to protect the system from getting damaged we advise you to modify the file yourself manually."
echo "You will find this file in /etc/ssh/ directory and is named sshd_config."
echo "Given below are the lines that you need to edit in the configuration file: "
echo "Match the lines exactly as below to the lines in your config file leaving the rest to default"
echo "PermitRootLogin yes"
echo "PublicKeyAuthentication no"
echo "PasswordAuthentication yes"
echo "***********************************************************************"

#Step8
#Finishing up
echo " "
echo " "
echo " "
echo "***********************************************************************"
echo "Hope so you have correctly modified the ssh config file because thats an important step....!"
echo "The ssh server is now enabled to autorun on every startup allowing you to remotely connect to it."
echo "Happy Hacking!!!!!!"
echo "***********************************************************************"

