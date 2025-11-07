# Домашнее задание к занятию «Базовые объекты K8S»
## Задание 1. Создать Pod с именем hello-world
1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью kubectl port-forward и вывести значение (curl или в браузере).

## Ответ:
1-2. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/pod.yaml) создан
 ![Скриншот терминала 1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/images/kuber-homeworks_1.2-01.png)
3. Результат вывода команды curl
![Скриншот терминала 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/images/kuber-homeworks_1.2-02.png)

## Задание 2. Создать Service и подключить его к Pod
1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью kubectl port-forward и вывести значение (curl или в браузере).

## Ответ:
1-2. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/pod-netology-web.yaml) и Pod созданы.
![Скриншот терминала 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/images/kuber-homeworks_1.2-21.png)
3. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/service-netology-web.yaml) и Service созданы.
![Скриншот терминала 4](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/images/kuber-homeworks_1.2-23.png)
4. Результат вывода команды curl
![Скриншот терминала 5](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.2/images/kuber-homeworks_1.2-24.png)
