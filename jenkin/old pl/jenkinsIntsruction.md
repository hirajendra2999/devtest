# Jenkins Installation Instruction

`yum install epel-release -y`

`yum install java-openjdk wget -y`

`wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo`

`rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key`

`yum install jenkins -y`

`systemctl start jenkins`

`systemctl enable jenkins`

