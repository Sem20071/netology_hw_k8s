# Домашнее задание к занятию «Установка Kubernetes»

## Задание 1. Установить кластер k8s с 1 master node
1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
2. В качестве CRI — containerd.
3. Запуск etcd производить на мастере.
4. Способ установки выбрать самостоятельно.

## Ответ:
Разворачивать k8s кластер буду при помощи kubeadm.
1. С помощью [terraform](https://github.com/Sem20071/netology_hw_k8s/tree/main/kuber-homeworks_3.2/terraform-create-vm) развернул 5 ВМ. k8s-master-01 и k8s-worker-01 ... 04. 
  ![Скриншот консоли 1](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.2/images/kuber-homeworks_3.2-1-1.png)

2. Подключаюсь к k8s-master-01 и инициализирую клстер.
  ![Скриншот консоли 2](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.2/images/kuber-homeworks_3.2-1-2.png)
  ![Скриншот консоли 3](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.2/images/kuber-homeworks_3.2-1-3.png)

3. Настраиваю kubectl ля работы с кластероми включаю модуль br_netfilter.
  ![Скриншот консоли 4](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.2/images/kuber-homeworks_3.2-1-4.png)

4. Скачиваю манифест и устанавливаю плагин Flannel. Master-нода готова для подключения worker-нод.
  ![Скриншот консоли 5](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.2/images/kuber-homeworks_3.2-1-5.png)

5. Подключаем все 4 worker-ноды к кластеру.
  ![Скриншот консоли 6](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.2/images/kuber-homeworks_3.2-1-6.png)

6. После подключения worker-нод проверяем ноды на master-ноде. Назначем роль worker-нодам.
  ![Скриншот консоли 7](https://github.com/Sem20071/netology_hw_k8s/blob/main/kuber-homeworks_3.2/images/kuber-homeworks_3.2-1-7.png)


  