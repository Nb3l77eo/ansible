# Самоконтроль выполненения задания

1. Где расположен файл с `some_fact` из второго пункта задания?

```
group_vars/all/examp.yml
```


2. Какая команда нужна для запуска вашего `playbook` на окружении `test.yml`?

```
ansible-playbook -i inventory/test.yml site.yml
```

3. Какой командой можно зашифровать файл?

```
ansible-vault encrypt group_vars/all/examp.yml
```

4. Какой командой можно расшифровать файл?
   
```
ansible-vault decrypt group_vars/all/examp.yml
```

5. Можно ли посмотреть содержимое зашифрованного файла без команды расшифровки файла? Если можно, то как?
   
```
ansible-vault view group_vars/all/examp.yml
```

6. Как выглядит команда запуска `playbook`, если переменные зашифрованы?
   
```
ansible-playbook -i inventory/test.yml site.yml --ask-vault-pass
```

```
$ cat > pass.txt
123456
^Z
[2]+  Stopped                 cat > pass.txt

$ ansible-playbook -i inventory/test.yml site.yml --vault-password-file pass.txt
```

7. Как называется модуль подключения к host на windows?
   
```
winrm
```

8. Приведите полный текст команды для поиска информации в документации ansible для модуля подключений ssh
   
```
ansible-doc -t connection ssh
```

9.  Какой параметр из модуля подключения `ssh` необходим для того, чтобы определить пользователя, под которым необходимо совершать подключение?

```
По умолчанию подключения происходят с использованием того логина, который используется на control-node. 

Использование в playbook:
---
- name: update webservers
  hosts: webservers
  remote_user: admin

  tasks:
  - name: thing to do first in this playbook
  . . .


Использование в inventory:
cloud:
  hosts:
    cloud1: my_backup.cloud.com
    cloud2: my_backup2.cloud.com
  vars:
    ansible_user: admin

inf: https://docs.ansible.com/ansible/latest/user_guide/connection_details.html

```
