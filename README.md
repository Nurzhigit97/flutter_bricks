# Flutter Mason Bricks

Репозиторий с [Mason](https://docs.brickhub.dev/) bricks для Flutter: базовая структура приложения и генерация фич.

## Содержимое

| Brick   | Описание |
|--------|----------|
| **app**    | Базовое приложение: `main.dart`, `app.dart`, скелет `shared/`, `mason.yaml`, `Makefile`, `.fvmrc`, `assets/`. |
| **feature**| Фича: data (repository, impl, datasource, models), presentation (cubits, pages, widgets), injection, navigator. |

---

## Использование в новом Flutter-проекте

Предполагается: уже есть приложение (например, `flutter create my_app`) и нужно подключить bricks из этого репозитория.

### 1. Установка Mason (если ещё нет)

```bash
dart pub global activate mason_cli
```

### 2. Подключение bricks из GitHub

В корне **своего** Flutter-проекта:

```bash
# Базовое приложение (main, app, shared, mason, Makefile, .fvmrc, assets)
mason add app --git-url git@github.com:Nurzhigit97/flutter_bricks.git --git-path app

# Генерация фич
mason add feature --git-url git@github.com:Nurzhigit97/flutter_bricks.git --git-path feature
```

Через **mason.yaml** вручную:

```yaml
bricks:
  app:
    git:
      url: git@github.com:Nurzhigit97/flutter_bricks.git
      path: app
  feature:
    git:
      url: git@github.com:Nurzhigit97/flutter_bricks.git
      path: feature
```

Затем в проекте:

```bash
mason get
```

### 3. Создание базового каркаса приложения (brick `app`)

Один раз в новом проекте (или в пустом после `flutter create`):

```bash
mason make app
```

Mason спросит `Package name` (по умолчанию `base_app`). Можно передать конфиг:

```bash
echo '{"packageName":"my_app"}' > .mason_app_config.json
mason make app -c .mason_app_config.json
```

Будут созданы/перезаписаны: `lib/main.dart`, `lib/app.dart`, скелет `lib/shared/`, корневые `mason.yaml`, `Makefile`, `.fvmrc`, папка `assets/`. В корне появится файл **`pubspec_brick_dependencies.yaml`** со списком зависимостей — добавь их в свой `pubspec.yaml` (секция `dependencies` и при необходимости `dev_dependencies`), затем выполни `flutter pub get`.

### 4. Генерация фичи (brick `feature`)

В том же проекте:

```bash
mason make feature
```

Нужно ввести (или передать через конфиг):

- **Feature name (snake_case)** — например, `chat`, `user_profile`;
- **List folder/widget name (snake_case plural)** — например, `chats`, `user_profiles`;
- **Package name** — как в `pubspec.yaml` (например, `my_app`).

Через конфиг:

```bash
echo '{"featureName":"chat","listName":"chats","package":"my_app"}' > .mason_feature_config.json
mason make feature -c .mason_feature_config.json
```

Бrick создаёт в `lib/features/<feature_name>/`:

- data: `repositories/`, `datasource/`, `models/`;
- presentation: `cubits/`, `pages/`, `widgets/`;
- `<feature>_injection.dart`, `<feature>_navigator.dart`.

Дальше нужно:

1. Зарегистрировать фичу в DI — вызвать `<feature>Injection()` в `initInjections()` или добавить в `featureInjections` в `lib/shared/utils/config/feature_injections.dart`.
2. Добавить маршрут в роутер (auto_route и т.п.), если используешь этот brick с существующим роутингом.

### 5. Makefile (если сгенерировали через brick `app`)

Из корня проекта:

```bash
make get
make makeFeature featureName=chat listName=chats package=my_app
```

---

## Зависимости в проекте

- **Mason** — `dart pub global activate mason_cli`.

Brick **app** не подставляет зависимости в `pubspec.yaml` автоматически. После `mason make app` в корне проекта появляется файл **`pubspec_brick_dependencies.yaml`** — скопируй из него нужные пакеты в свой `pubspec.yaml` и выполни `flutter pub get`. Основные группы:

- **DI и state:** `get_it`, `flutter_bloc`, `equatable`
- **Сеть:** `dio`, `dartz`
- **Роутинг:** `auto_route` (+ dev: `build_runner`, `auto_route_generator`)
- **UI:** `google_fonts`, `flutter_svg`, `lottie`, `shimmer`, `animations`, `flutter_easyloading`, `fluttertoast`, `url_launcher`
- **Хранение:** `shared_preferences`, `flutter_secure_storage`
- **Firebase (по желанию):** `firebase_core`, `firebase_analytics`, `firebase_auth`, `firebase_messaging`, `firebase_crashlytics`, `flutter_local_notifications`
- **Прочее:** `intl`, `html`, `logging`, `app_links`, `package_info_plus`, `connectivity_plus`, `cached_network_image`, `flutter_cache_manager`, `photo_view`, `youtube_player_flutter`, `webview_flutter`, `flutter_markdown`, `no_screenshot` и др. (полный список — в сгенерированном файле).

Brick **feature** рассчитан на проект с уже настроенными:

- `EasyApiClient` в DI;
- стилем репозиториев (abstract repository + impl + datasource, `Either<AppFailure, T>`).

Для генерации моделей в фичах добавь в проект: `freezed_annotation`, `json_serializable` (и в dev_dependencies: `build_runner`, `freezed`, `json_serializable`).

---

## Версии и путь к bricks

- По умолчанию подтягивается ветка `main`. Чтобы зафиксировать версию, укажи `ref` в `mason.yaml` (тег или коммит):

```yaml
bricks:
  feature:
    git:
      url: git@github.com:Nurzhigit97/flutter_bricks.git
      path: feature
      ref: v1.0.0
```

- Если bricks лежат в подпапке одного репо (например, в `base_example_app` репо путь `bricks/feature`), в другом проекте подключай так:

```bash
mason add feature --git-url git@github.com:Nurzhigit97/base_example_app.git --git-path bricks/feature
```
