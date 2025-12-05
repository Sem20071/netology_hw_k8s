# Домашнее задание к занятию Troubleshooting

## Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить
1. Установить приложение по команде:
`kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml`
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.

## Ответ:

![Скриншот экрана 0](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.5/images/kuber-homeworks_3.5-1-1.png)

Проблема заключается в том, что внутри пода web-consumer не резолвится имя auth-db, к которому идёт обращение. Предлагаю следующие варианты решения данной проблемы:
1. Размещение подов в одном namespace.
    ![Скриншот экрана 1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.5/images/kuber-homeworks_3.5-1-3.png)
    ![Скриншот экрана 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.5/images/kuber-homeworks_3.5-1-2.png)

2. Правельно обращаться к требуемому ресурсу (сервису) - по полному имени `auth-db.data.svc.cluster.local`
    ![Скриншот экрана 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.5/images/kuber-homeworks_3.5-1-5.png)
    ![Скриншот экрана 4](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.5/images/kuber-homeworks_3.5-1-4.png)