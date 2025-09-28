1 Сохраните скрипт в файл, например: /usr/local/bin/test.sh 

2 Сделайте его исполняемым: chmod +x /usr/local/bin/test.sh

3 переместите юнит-файл: /etc/systemd/system/test.service

4 Включите и запустите сервис: 

sudo systemctl daemon-reload

sudo systemctl enable test.service

sudo systemctl start test.service

# для этих команд ,инициализатор должен быть systemd


Этот проект **НЕ является открытым ПО**.  
Коммерческое использование **запрещено** без письменного разрешения.  
