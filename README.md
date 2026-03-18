# Flutter Mason Bricks

Репозиторий с [Mason](https://docs.brickhub.dev/) bricks для Flutter: базовая структура приложения и генерация фич.

## Содержимое

| Brick   | Описание |
|--------|----------|
| **app**    | Базовое приложение: `main.dart`, `app.dart`, скелет `shared/`, `mason.yaml`, `Makefile`, `.fvmrc`, `assets/`. |
| **feature**| Фича: data (repository, impl, datasource, models), presentation (cubits, pages, widgets), injection, navigator. |

---

## Как выложить в GitHub отдельным проектом

1. Создай новый репозиторий на GitHub (например, `flutter_bricks`).
2. В корень **нового** репозитория положи:
   - папки **`app/`** и **`feature/`** (содержимое из `bricks/app` и `bricks/feature`);
   - файлы **`README.md`** и **`mason.yaml`** из папки `bricks/`.

Итоговая структура репо:

```
flutter_bricks/
├── README.md      ← этот текст (скопировать из bricks/README.md)
├── mason.yaml     ← конфиг bricks (см. ниже)
├── app/
│   ├── brick.yaml
│   └── __brick__/
│       ├── lib/
│       ├── assets/
│       ├── mason.yaml
│       ├── Makefile
│       └── .fvmrc
└── feature/
    ├── brick.yaml
    └── __brick__/
        └── lib/features/feature/
```

В корне нового репо нужен свой **mason.yaml**:

```yaml
bricks:
  app:
    path: app
  feature:
    path: feature
```

Тогда после клонирования в этом репо можно выполнить `mason get` и использовать bricks локально.

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
mason add app --git-url https://github.com/USER/flutter_bricks.git --git-path app

# Генерация фич
mason add feature --git-url https://github.com/USER/flutter_bricks.git --git-path feature
```

Замени `USER` и `flutter_bricks` на свой аккаунт и имя репозитория.

Через **mason.yaml** вручную:

```yaml
bricks:
  app:
    git:
      url: https://github.com/USER/flutter_bricks.git
      path: app
  feature:
    git:
      url: https://github.com/USER/flutter_bricks.git
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

Будут созданы/перезаписаны: `lib/main.dart`, `lib/app.dart`, скелет `lib/shared/`, корневые `mason.yaml`, `Makefile`, `.fvmrc`, папка `assets/`. Имя пакета в импортах будет подставлено из `packageName`.

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

Для сгенерированного кода нужны:

- **Mason** — `dart pub global activate mason_cli`;
- в проекте: `get_it`, `dartz`, `flutter_bloc`, `equatable`, `freezed_annotation`, `json_serializable`, `auto_route` и т.д. — в зависимости от того, что реально использует твой `shared/` и фичи.

Brick **feature** рассчитан на проект с уже настроенными:

- `EasyApiClient` в DI;
- стилем репозиториев (abstract repository + impl + datasource, `Either<AppFailure, T>`).

---

## Версии и путь к bricks

- По умолчанию подтягивается ветка `main`. Чтобы зафиксировать версию, укажи `ref` в `mason.yaml` (тег или коммит):

```yaml
bricks:
  feature:
    git:
      url: https://github.com/USER/flutter_bricks.git
      path: feature
      ref: v1.0.0
```

- Если bricks лежат в подпапке одного репо (например, в `base_example_app` репо путь `bricks/feature`), в другом проекте подключай так:

```bash
mason add feature --git-url https://github.com/USER/base_example_app.git --git-path bricks/feature
```
