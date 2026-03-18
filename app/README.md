# App brick

Создаёт базовую структуру Flutter-приложения по умолчанию:

- `lib/main.dart` — точка входа
- `lib/app.dart` — корневой виджет приложения
- `lib/shared/` — скелет shared (injections, theme, config, api_client, log)
- `mason.yaml` — конфиг Mason (bricks/feature)
- `Makefile` — команды get, clean, watch, makeFeature, release
- `.fvmrc` — версия Flutter (stable)
- `assets/` — папка для ассетов

## Использование

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

После генерации подставить реальный контент в `lib/shared/` из текущего base_example_app при необходимости (routes, l10n, app_features и т.д.).
