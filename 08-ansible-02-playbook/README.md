# Домашнее задание к занятию "08.02 Работа с Playbook"

## Подготовка к выполнению

1. Создайте свой собственный (или используйте старый) публичный репозиторий на github с произвольным именем.
2. Скачайте [playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
3. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

## Основная часть

1. Приготовьте свой собственный inventory файл `prod.yml`.
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev).
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать нужной версии дистрибутив, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
 - Скачивает с оф репозитория ckickhouse deb пакеты в установленную директорию
 - Устанавливает пекеты
 - Выполняет handler (перезапуск сервиса clickhouse-server)
 - Создает базу данных logs
 - Создает директорию для установки vector
 - Скачивает архив vector
 - Распаковывает vector в установленную директорию
 - Добавляет в переменную PATH директорию vector
 - Запускает vector
 - Tags не устанавливал

Вывод ansible-lint. В конфиге установлен skip_list. 
arsen@lite:~/08-ansible/netology-home-8/08-ansible-02-playbook/playbook$ ansible-lint site.yml
WARNING  Overriding detected file kind 'yaml' with 'playbook' for given positional argument: site.yml
WARNING  Listing 6 violation(s) that are fatal
fqcn-builtins: Use FQCN for builtin actions.
site.yml:12 Task/Handler: Ensure installation dir clickhouse

fqcn-builtins: Use FQCN for builtin actions.
site.yml:40 Task/Handler: Install clickhouse packages

fqcn-builtins: Use FQCN for builtin actions.
site.yml:52 Task/Handler: Create database

fqcn-builtins: Use FQCN for builtin actions.
site.yml:62 Task/Handler: Ensure installation dir vector

fqcn-builtins: Use FQCN for builtin actions.
site.yml:76 Task/Handler: Extract vector

fqcn-builtins: Use FQCN for builtin actions.
site.yml:90 Task/Handler: Start vector

You can skip specific rules or tags by adding them to your configuration file:
  .config/ansible-lint.yml
warn_list:  # or 'skip_list' to silence them completely
  - fqcn-builtins  # Use FQCN for builtin actions.

Finished with 6 failure(s), 0 warning(s) on 1 files.


---
