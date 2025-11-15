# Задание 1. Volume: обмен данными между контейнерами в поде
## Задача
Создать Deployment приложения, состоящего из двух контейнеров, обменивающихся данными.

### Шаги выполнения
1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Настроить busybox на запись данных каждые 5 секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.

### Что сдать на проверку
1. Манифесты:
- containers-data-exchange.yaml
2. Скриншоты:
- описание пода с контейнерами (kubectl describe pods data-exchange)
- вывод команды чтения файла (tail -f <имя общего файла>)

## Ответ:
1. [Файл-Манифест](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/containers-data-exchange.yaml) и Deployment приложения созданы.
2. busybox настроен на запись данных каждые 5 секунд в файл test-file.txt.
3. Возможность чтения файла контейнером multitool обеспечена:
    ![Скриншот консоли 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-1-2.png)
4. Описание пода с контейнерами (kubectl describe pods data-exchange)
    ![Скриншот консоли 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-1-1.png)
    ![Скриншот консоли 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-1-12.png)

## Задание 2. PV, PVC
### Задача
Создать Deployment приложения, использующего локальный PV, созданный вручную.

### Шаги выполнения
1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool, использующего созданный ранее PVC
2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.
3. Продемонстрировать, что контейнер multitool может читать данные из файла в смонтированной директории, в который busybox записывает данные каждые 5 секунд.
4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему. (Используйте команду kubectl describe pv).
5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV. Продемонстрировать, что произошло с файлом после удаления PV. Пояснить, почему.

### Что сдать на проверку
1. Манифесты:
- pv-pvc.yaml
2. Скриншоты:
- каждый шаг выполнения задания, начиная с шага 2.
3. Описания:
- объяснение наблюдаемого поведения ресурсов в двух последних шагах.

## Ответ:
1-4. [Файл-Манифест pv-pvc.yaml](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/pv-pvc.yaml) для создания  Deployment, PV и PVC для подключения папки на локальной ноде, которая будет использована в поде, созданы.
    ![Скриншот консоли 4](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-2-234.png)
5. PV остался не тронут. Удаляя Deployment и PVC мы перевели PV в статус "Released". При необходимости pvc и Deploymen можно пересоздать и продолжить работу с PV. Файл в PV остался на месте.
    ![Скриншот консоли после удаления PVC и Deployment3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-2-51.png)

После удаления PV файл на файловой системе ноды остался не тронут т.к. в параметрах PV мы использовали параемтр persistentVolumeReclaimPolicy: Retain. Данный параметр говорит о том что файлы остаются на локальном диске ноды после удаления PV и администратор должен вручную очистить данные при необходимости.
    ![Скриншот консоли после удаления PV](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-2-52.png)


## Задание 3. StorageClass
### Задача
Создать Deployment приложения, использующего PVC, созданный на основе StorageClass.

### Шаги выполнения
1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool, использующего созданный ранее PVC.
2. Создать SC и PVC для подключения папки на локальной ноде, которая будет использована в поде.
3. Продемонстрировать, что контейнер multitool может читать данные из файла в смонтированной директории, в который busybox записывает данные каждые 5 секунд.


### Что сдать на проверку
1. Манифесты:
- sc.yaml
2. Скриншоты:
- каждый шаг выполнения задания, начиная с шага 2


## Ответ:
1. [Файл-Манифест sc.yaml](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/sc.yaml) для создания  Deployment, sc и pvc создан.
2. Командой `kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.24/deploy/local-path-storage.yaml` включил Local Path Provisioner - динамического provisioner'а для Kubernetes, который создает Persistent Volumes используя локальные диски на нодах.
3. Скриншоты консоли:
    ![Скриншот консоли 5](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-3-1.png)
    ![Скриншот консоли 6](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_2.1/images/kuber-homeworks2.1-3-2.png)