COMPONENT=dispatch
LOG_FILE=/tmp/${COMPONENT}
source common.sh
echo Intsall GoLang
yum install golang -y

APP_PREREQ

go mod init ${COMPONENT}
go get
go build

SYSTEMD_SETUP