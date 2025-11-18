# Домашнее задание к занятию «Настройка приложений и управление доступом в Kubernetes»
## Задание 1: Работа с ConfigMaps
### Задача
Развернуть приложение (nginx + multitool), решить проблему конфигурации через ConfigMap и подключить веб-страницу.

### Шаги выполнения
1. Создать Deployment с двумя контейнерами
- nginx
- multitool
2. Подключить веб-страницу через ConfigMap
3. Проверить доступность
### Что сдать на проверку
1. Манифесты:
- deployment.yaml
- configmap-web.yaml
2. Скриншот вывода curl или браузера

## Ответ:
1. Файлы-Манифест [deployment.yaml]() и [configmap-web.yaml]() созданы и применены.
2. Скриншот вывода curl
    ![Скриншот консоли 1]()


## Задание 2: Настройка HTTPS с Secrets
### Задача
Развернуть приложение с доступом по HTTPS, используя самоподписанный сертификат.

### Шаги выполнения
1. Сгенерировать SSL-сертификат
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout tls.key -out tls.crt -subj "/CN=myapp.example.com"
```
2. Создать Secret
3. Настроить Ingress
4. Проверить HTTPS-доступ
### Что сдать на проверку
1. Манифесты:
- secret-tls.yaml
- ingress-tls.yaml
2. Скриншот вывода curl -k


## Ответ:
1. Самоподписной tls сертификат сгенерирован:
    ![Скриншот консоли 2]()
    
2. Файлы-Манифест [secret-tls.yaml]() и [ingress-tls.yaml]() созданы и применены.
    ![Скриншот консоли 3]()

3. Скриншот вывода curl -k
    ![Скриншот консоли 4]()

## Задание 3: Настройка RBAC
### Задача
Создать пользователя с ограниченными правами (только просмотр логов и описания подов).

### Шаги выполнения
1. Включите RBAC в microk8s
`microk8s enable rbac`
2. Создать SSL-сертификат для пользователя
```
openssl genrsa -out developer.key 2048
openssl req -new -key developer.key -out developer.csr -subj "/CN={ИМЯ ПОЛЬЗОВАТЕЛЯ}"
openssl x509 -req -in developer.csr -CA {CA серт вашего кластера} -CAkey {CA ключ вашего кластера} -CAcreateserial -out developer.crt -days 365
```

3. Создать Role (только просмотр логов и описания подов) и RoleBinding
4. Проверить доступ
### Что сдать на проверку
1. Манифесты:
- role-pod-reader.yaml
- rolebinding-developer.yaml
2. Команды генерации сертификатов
3. Скриншот проверки прав (kubectl get pods --as=developer)


### Ответ:

1. RBAC в microk8s включен.
    ![Скриншот консоли 5]()

2. Команды генерации сертификатов
- создаём закрытую часть сертификата `openssl genrsa -out netology.key 2048`
- создаём csr запрос на выпуск сертификата `openssl req -new -key developer.key -out developer.csr -subj "/CN=netology"`
- выпускаем новый самоподписной сертификат на основе запроса `openssl x509 -req -in developer.csr -CA /var/snap/microk8s/current/certs/ca.crt -CAkey /var/snap/microk8s/current/certs/ca.key -CAcreateserial -out netology.crt -days 365`
    ![Скриншот консоли 6]()

3. Скриншот проверки прав (`kubectl get pods --as=developer`)
    ![Скриншот консоли 7]()