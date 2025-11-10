# Домашнее задание к занятию «Запуск приложений в K8S»

## Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod
1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования.
4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
5. Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложений из п.1.

# Ответ:
1. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/deployment.yaml) и Deployment созданы. Возникшая при старте podА ошибка устранена:
  ![Скриншот консоли 1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/images/kuber-homeworks_1.3-1-1.png)
2 - 3. Колличество реплик увеличено до 2:
  ![Скриншот консоли 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/images/kuber-homeworks_1.3-1-3.png)
4. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/service.yaml) и Service созданы:
  ![Скриншот консоли 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/images/kuber-homeworks_1.3-1-4.png)
5. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/pod-multitool.yaml) и отдельный Pod c приложением multitool созданы. Результат выполнения команды curl my-service:8081:
  ![Скриншот консоли 4](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/images/kuber-homeworks_1.3-1-5-1.png)
  ![Скриншот консоли 5](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/images/kuber-homeworks_1.3-1-5-2.png)

## Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий
1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
3. Создать и запустить Service. Убедиться, что Init запустился.
4. Продемонстрировать состояние пода до и после запуска сервиса.

## Ответ:
1. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/deployment-task2.yaml) и Deployment приложения nginx созданы:
   ![Скриншот консоли 6](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/images/kuber-homeworks_1.3-2-1.png)
5. Демонстрация состояние Pod до и после запуска [сервиса](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/service-task2.yaml):
   ![Скриншот консоли 7](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_1.3/images/kuber-homeworks_1.3-2-5.png)
