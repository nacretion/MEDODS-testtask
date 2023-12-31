# Эндпоинты

**GET /up**: Проверка состояния приложения

### 1. Пациенты (Patients)

- **GET /patients**: Получить список всех пациентов.
- **POST /patients**: Создать нового пациента.

### 2. Запросы на консультацию (Consultation Requests)

- **GET /consultation_requests**: Получить список всех запросов на консультацию.
- **POST /consultation_requests**: Создать новый запрос на консультацию.

### 3. Рекомендации (Recommendations)

- **GET /recommendations**: Получить список всех рекомендаций в приложении.
- **POST /consultation_requests/:consultation_request_id/recommendations**: Создания новых рекомендаций в рамках запроса на консультацию.
- **GET /patients/:patient_id/recommendations**: Получить список рекомендаций для конкретного пациента.

### 4. Медикаменты (Medications)
Источник - OpenFDA
- **GET /medications/search_drug?query=**: Поиск лекарств по названию.

- **GET /medications/search_by_reactionmeddrapt?query=**: Поиск медикаментов по их реакции на пациентов.

В корневом каталоге проекта есть коллекция postman `MEDODS.postman_collection.json` запросов с заполненными телами запросов.
Обратите внимание, так как это тестовый сервер, он не содержит регистрацию пользователей и определение их ролей в системе, именно поэтому можно легко без всяких проверок получить **.all** для всех записей в БД

# Руководство по первому запуску

## Предварительные требования

1. **Клонируйте репозиторий**: клонируйте репозиторий на свою машину.

2. **Установите Docker и Docker Compose**: Убедитесь, что Docker и Docker Compose установлены. Скачать их можно с официального сайта [Docker](https://www.docker.com/get-started).

## Сборка образов и запуск контейнеров

1. **Соберите образы**: Из командной строки перейдите в директорию проектом и выполните команду `docker-compose build`, чтобы собрать Docker-образы.

    ```bash
    docker-compose build
    ```

2. **Запустите контейнеры**: После успешной сборки образов выполните команду `docker-compose up`, чтобы запустить контейнеры.

    ```bash
    docker-compose up
    ```

## Завершение работы

1. **Остановите контейнеры**: Остановите контейнеры с помощью `Ctrl+C` в окне командной строки, где была выполнена команда `docker-compose up`.

2. **Очистите ресурсы**: Для удаления контейнеров и сетей выполните команду `docker-compose down`. Это освободит ресурсы, занятые Docker-контейнерами.

    ```bash
    docker-compose down
    ```

# Тестирование
1. **Запустите тесты**
    ```bash
    rails test
    ```