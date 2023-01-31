COMPONENT=dispatch
source common.sh
echo Intsall GoLang
yum install golang -y

echo AddUser
useradd roboshop
sudo su roboshop

curl -L -s -o /tmp/${COMPONENT}.zip https://github.com/roboshop-devops-project/${COMPONENT}/archive/refs/heads/main.zip
unzip /tmp/${COMPONENT}.zip
mv ${COMPONENT}-main ${COMPONENT}
cd ${COMPONENT}

go mod init ${COMPONENT}
go get
go build

sudo mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
sudo systemctl daemon-reload
sudo systemctl enable ${COMPONENT}
sudo systemctl start ${COMPONENT}