# Домашнее задание к занятию «Сетевое взаимодействие в Kubernetes»

## Задание 1: Настройка Service (ClusterIP и NodePort)
### Задача
Развернуть приложение из двух контейнеров (nginx и multitool) и обеспечить доступ к ним:
- Внутри кластера через ClusterIP.
- Снаружи через NodePort.
### Шаги выполнения
1. Создать Deployment с двумя контейнерами:
- nginx (порт 80).
- multitool (порт 8080).
- Количество реплик: 3.
2. Создать Service типа ClusterIP, который:
- Открывает nginx на порту 9001.
- Открывает multitool на порту 9002.
3. Проверить доступность изнутри кластера:
```
 kubectl run test-pod --image=wbitt/network-multitool --rm -it -- sh
 curl <service-name>:9001 # Проверить nginx
 curl <service-name>:9002 # Проверить multitool
```
4. Создать Service типа NodePort для доступа к nginx снаружи.
5. Проверить доступ с локального компьютера:
` curl <node-ip>:<node-port> `
или через браузер.

### Что сдать на проверку
1. Манифесты:
- deployment-multi-container.yaml
- service-clusterip.yaml
- service-nodeport.yaml
2. Скриншоты проверки доступа (curl или браузер).

## Ответ:
1. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/deployment-multi-container.yaml) и Deployment, с двумя контейнерами, созданы:
   ![Скриншот консоли 1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-1-1.png)
2. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/service-clusterip.yaml) и Service тип ClusterIP созданы:
    ![Скриншот консоли 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-1-2.png)
3. Результат выполенния команды curl из тестового PodА:
    ![Скриншот консоли 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-1-3.png)
4-5. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/service-nodeport.yaml) и Service ,типа NodePort для доступа к nginx, созданы.    Nginx доступен снаружи:
    ![Скриншот консоли 4](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-1-45.png)


## Задание 2: Настройка Ingress
### Задача
Развернуть два приложения (frontend и backend) и обеспечить доступ к ним через Ingress по разным путям.

### Шаги выполнения
1. Развернуть два Deployment:
- frontend (образ nginx).
- backend (образ wbitt/network-multitool).
2. Создать Service для каждого приложения.
3. Включить Ingress-контроллер:
` microk8s enable ingress `
4. Создать Ingress, который:
- Открывает frontend по пути /.
- Открывает backend по пути /api.
5. Проверить доступность:
```
 curl <host>/
 curl <host>/api
```
или через браузер.

### Что сдать на проверку
1. Манифесты:
- deployment-frontend.yaml
- deployment-backend.yaml
- service-frontend.yaml
- service-backend.yaml
- ingress.yaml
2. Скриншоты проверки доступа (curl или браузер).


## Ответ:
1. [Файлы-Манифест-deployment-frontend](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/deployment-backend.yaml) ,[Файлы-Манифест-deployment-backend](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/deployment-frontend.yaml) и два Deployment, созданы:
   ![Скриншот консоли 5](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-2-1.png)
2. [Файлы-Манифест-service-frontend](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/service-frontend.yaml) ,[Файлы-Манифест2-service-backend](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/service-backend.yaml) и два Service, созданы:
   ![Скриншот консоли 6](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-2-2.png)
3. Ingress-контроллер включен.
   ![Скриншот консоли 7](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-2-3.png)
4. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/ingress.yaml) и Ingress созданы:
   ![Скриншот консоли 8](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-2-4.png)
5. Оба сервиса доступны снаружи:
   ![Скриншот консоли 9](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.4/images/kuber-homeworks_1.4-2-4-51.png)
