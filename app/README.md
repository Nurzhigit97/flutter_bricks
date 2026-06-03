# App brick

Создаёт базовую структуру Flutter-приложения по умолчанию:

- `lib/main.dart` — точка входа
- `lib/app.dart` — корневой виджет приложения
- `lib/core/` — инфраструктура (api_client, routes, services, theme, translation, utils, DI)
- `lib/shared/` — общие виджеты и app_features
- `lib/features/` — фичи: `main_page.dart`, barrel `features.dart` (дополняется brick `feature`)
- `mason.yaml` — конфиг Mason (bricks/feature)
- `Makefile` — команды get, clean, watch, makeFeature, release
- `.fvmrc` — версия Flutter (stable)
- `assets/` — папка для ассетов

## Использование

**Важно:** запускай `mason make app` из **корня целевого Flutter-проекта** (там, где лежит `pubspec.yaml`). Тогда создадутся `lib/` с `core/`, `features/`, `shared/` и остальные файлы.

В корне нового или существующего проекта:

```bash
mason make app
# или с указанием имени пакета:
mason make app -c mason_app_config.json
# где mason_app_config.json: {"packageName": "my_app"}
```

Либо добавить brick в проект и вызывать из папки с bricks:

```bash
mason add app --path bricks/app
mason make app
```

**Если `lib/features/` не создаётся:** brick берётся из кэша Mason. Обнови кэш и перегенерируй:

```bash
mason remove app
mason add app --git-url git@github.com:Nurzhigit97/flutter_bricks.git --git-path app
mason get
# Создай конфиг с именем пакета (как в pubspec.yaml), затем генерация:
echo '{"packageName":"example_app"}' > .mason_app_config.json
mason make app -c .mason_app_config.json --on-conflict overwrite
```

После генерации подставить реальный контент в `lib/shared/` из текущего base_example_app при необходимости (routes, l10n, app_features и т.д.).
