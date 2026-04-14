# feature brick

Генерирует фичу: data layer (models, repository, remote datasource), presentation (cubits с Freezed, pages + elements), **injection** и **navigator** для подключения в приложение.

## Подключение brick: локально и через Git

### В этом репозитории (локально)

Brick уже подключён по относительному пути в `mason.yaml`:

```yaml
bricks:
  feature:
    path: bricks/feature
```

После клонирования репозитория выполни один раз:

```bash
mason get
```

Дальше brick доступен как `feature`.

### В другом проекте (из Git)

Чтобы использовать этот же brick в другом проекте из данного репозитория, в корне **того** проекта добавь brick с Git:

```bash
mason add feature --git-url https://github.com/USER/base_example_app.git --git-path bricks/feature
```

Или вручную в `mason.yaml` того проекта:

```yaml
bricks:
  feature:
    git:
      url: https://github.com/USER/base_example_app.git
      path: bricks/feature
  # опционально: зафиксировать версию (ветка, тег или коммит)
  # feature:
  #   git:
  #     url: https://github.com/USER/base_example_app.git
  #     path: bricks/feature
  #     ref: main   # или v0.1.0, или sha коммита
```

Затем в том проекте:

```bash
mason get
mason make feature
```

## Использование

Из корня проекта:

```bash
mason make feature --feature_name chat --list_name chats --package base_app
```

Или без аргументов (Mason запросит переменные):

```bash
mason make feature
```

Переменные:
- **featureName** — имя фичи в snake_case (например `chat`, `notification2`)
- **listName** — имя папки cubits в snake_case (например `chats`, `notifications`)
- **package** — имя пакета (по умолчанию `base_app`)

## Зависимости

Сгенерированный код использует: `flutter_bloc`, `bloc`, `freezed_annotation`, `auto_route`, `dartz`, `dio`, `get_it` и dev: `build_runner`, `freezed`, `json_serializable`. Полный список с версиями — в `required_dependencies.yaml`.

**В новом проекте** эти зависимости не нужно копировать вручную: post-gen хук при `mason make feature` добавляет в `pubspec.yaml` только отсутствующие пакеты.

## После генерации

1. Запусти build_runner для Freezed и json_serializable:
   ```bash
   fvm dart run build_runner build --delete-conflicting-outputs
   ```

2. Зарегистрируй injection: вызови `{{featureName}}Injection()` при старте приложения (например в `main.dart` или в общем месте инициализации DI рядом с другими фичами).

3. Добавь `{{featureName.pascalCase()}}Navigator` в роуты: в `app_routes.dart` в children `MainRoute` добавь
   `AutoRoute(page: {{featureName.pascalCase()}}Navigator.page, children: [AutoRoute(page: {{featureName.pascalCase()}}PageRoute.page, initial: true), ...])`.

4. В `remote_data_source` поправь URL эндпоинтов под свой API.
