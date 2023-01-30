LOG_FILE=/tmp/mysql
source common.sh
ROBOSHOP_MYSQL_PASSWORD=RoboShp@21
if [ -z "${ROBOSHOP_MYSQL_PASSWORD}" ]; then
  echo -e "\e[31m ROBOSHOP_MYSQL_PASSWORD env variable is needed\e[0m"
  exit 1
fi

echo "Setting Up MySQL Repo"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo &>>$LOG_FILE
StatusCheck $?

echo "Disable MySQL Default Module to Enable 5.7 MySQL"
dnf module disable mysql -y &>>$LOG_FILE
StatusCheck $?

echo "Install MySQL"
yum install mysql-community-server -y &>>$LOG_FILE
StatusCheck $?


echo "Start MySQL Service"
systemctl enable mysqld &>>$LOG_FILE
systemctl restart mysqld &>>$LOG_FILE
StatusCheck $?



