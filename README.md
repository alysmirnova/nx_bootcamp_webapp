# Домашнее задание № 2: Git, Docker и генераторы статических сайтов

Генерация сайта на [Hugo](https://gohugo.io/) и запуск с помощью [Docker](https://www.docker.com/).

## Содержимое репозитория

В папках **archetypes**, **content**, **resources**, **themes**, а также **config.toml** находятся исходные файлы для создания сайта на [Hugo](https://gohugo.io/).

## Запуск

```git clone --recurse-submodules --remote-submodules git@github.com:alysmirnova/nx_bootcamp_webapp.git``` - клонирование репозитория.

```bash build.sh``` - команда для сборки сайта и создания образа.

```bash run.sh``` - команда для создания контейнера и запуска сайта. 

Посмотреть сайт можно на http://localhost:8080/.
