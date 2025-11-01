# Домашнее задание к занятию «Kubernetes. Причины появления. Команда kubectl»

## Задание 1. Установка MicroK8S
1. Установить MicroK8S на локальную машину или на удалённую виртуальную машину.
2. Установить dashboard.
3. Сгенерировать сертификат для подключения к внешнему ip-адресу.

## Ответ:
1. Для установки MicroK8S необходимо выполнить сл. действия:
  - Установить snapd - `sudo apt install snapd`
  - Установить microk8s - `sudo snap install microk8s --classic`
  - Добавить локального пользователя в группу microk8s - `sudo usermod -a -G microk8s $USER`
  - Создать директорию ~/.kube и измнить на неё права - `sudo mkdir ~/.kube && sudo chown -f -R $USER ~/.kube`
2. Для установки dashboard используем команду - microk8s enable dashboard.
3. Для генерации сертификата для подключения к внешнему адресу - добавляем адресс в файл /var/snap/microk8s/current/certs/csr.conf.template и выполняем команду - `sudo microk8s refresh-certs --cert front-proxy-client.crt`

## Задание 2. Установка и настройка локального kubectl
1. Установить на локальную машину kubectl.
2. Настроить локально подключение к кластеру.
3. Подключиться к дашборду с помощью port-forward.

## Ответ:
1. Для установки на локальную машину kubectl выполняем команду:
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```
2. Настройка подключения к кластеру призводится редактированием файла ~/.kube/config
   ![Скриншот экрана 1]()
3. Перед подключением к dashboard необходимо:
   - Создать service account для dashboard командой - `microk8s kubectl create serviceaccount dashboard-admin -n kube-system`
   - Привязать cluster-admin роль:
   ```
microk8s kubectl create clusterrolebinding dashboard-admin --clusterrole=cluster-admin --serviceaccount=kube-system:dashboard-admin
```
  - Получить токен для авторизации:
```
microk8s kubectl describe secret -n kube-system $(microk8s kubectl get secret -n kube-system | grep dashboard-admin | awk '{print $1}')
```
  - Запустить проброс порта для подключения :
```
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address 0.0.0.0
```
  - Пробуем зайти на страницу https://127.0.0.1:10443
![Скриншот экрана 2]()
