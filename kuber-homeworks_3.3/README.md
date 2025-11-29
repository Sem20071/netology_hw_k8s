# Домашнее задание к занятию «Как работает сеть в K8s»

## Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа
1. Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы.
2. В качестве образа использовать network-multitool.
3. Разместить поды в namespace App.
4. Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены.
5. Продемонстрировать, что трафик разрешён и запрещён.


## Ответ:
1. Создан [terraform](https://github.com/Sem20071/netology_hw_k8s/tree/main/kuber-homeworks_3.3/terraform-create-vm) проекта для автоматизированного создания и настройки k8s кластера в YC. Кластер создан настроен:
    ![Скриншот консоли 1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/images/kuber-homeworks_3.3-1-pre.png)

2. Созданы [deployment'ы](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/deployment.yaml) приложений frontend, backend и cache и соответсвующие [сервисы](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/service.yaml)
    ![Скриншот консоли 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/images/kuber-homeworks_3.3-1-2.png)

3. Поды размещены в namespace App.
     ![Скриншот консоли 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/images/kuber-homeworks_3.3-2-pre.png)

4. Создана [запрещающая](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/np-deny.yaml) и [разрешающая](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/np-allow.yaml) политики.

5. Демонстрация,что трафик разрешён и запрещён
    - До создания запрещающей политики трафик разрешен, после - запрещен.
    ![Скриншот консоли 4](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/images/kuber-homeworks_3.3-1-3.png)
    - до создания разрешающей политики трафик запрещён после - разрешен (backend -> cache)
    ![Скриншот консоли 5](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/images/kuber-homeworks_3.3-1-4.png)
    - Трафик с frontend до backend разрешен и с frontend до cache - запрещен.
    ![Скриншот консоли 6](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/images/kuber-homeworks_3.3-1-5.png)
    - Трафик с backend до cache разрешен и с backend до frontend - запрещен.
    ![Скриншот консоли 7](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.3/images/kuber-homeworks_3.3-1-6.png)

