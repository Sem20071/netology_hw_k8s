# Домашнее задание к занятию «Helm»

## Задание 1. Подготовить Helm-чарт для приложения
1. Необходимо упаковать приложение в чарт для деплоя в разные окружения.
2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
3. В переменных чарта измените образ приложения для изменения версии.

## Ответ:
Приожение упаковано в чарт для деплоя в разные окружения. Созданы Файл-манифесты:
1. [configmap.yaml](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/netology-chart/templates/configmap.yaml)
2. [deployment.yaml](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/netology-chart/templates/deployment.yaml)
3. [ingress.yaml](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/netology-chart/templates/ingress.yaml)
4. [service.yaml](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/netology-chart/templates/service.yaml)

Так же были созданы 3 файла с переменными для разных окружений:
1. [ns-app1-v1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/ns-app1-v1/values.yaml)
2. [ns-app1-v2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/ns-app1-v2/values.yaml)
3. [ns-app2-v3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/ns-app2-v3/values.yaml)

## Задание 2. Запустить две версии в разных неймспейсах
1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
3. Продемонстрируйте результат.

## Ответ:
1. Чарт подготовлен. Запущено несколько версий приложений:
    ![Скриншот консоли 1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/images/kuber-homeworks_2.4-1-1.png)
2. Первая версия в namespace=app1, вторая версия в namespace=app1 и третья версия в namespace=app2:
    ![Скриншот консоли 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/images/kuber-homeworks_2.4-1-2.png)
3. Демонстрация результата:
    ![Скриншот консоли 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.4/images/kuber-homeworks_2.4-1-3.png)