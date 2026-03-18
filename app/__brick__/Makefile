get:
	fvm flutter pub get

clean:
	fvm flutter clean

cleanGet:
	make clean
	make get

watch:
	fvm dart run build_runner watch --delete-conflicting-outputs

intl:
	fvm dart run intl_utils:generate

splash:
	fvm flutter pub run flutter_native_splash:create

generateIcons:
	fvm dart run flutter_launcher_icons

# Usage: make masonRemove name=feature  OR  make masonRemove-feature
masonRemove-%:
	mason remove $*

# make masonAdd-feature gitPath=bricks/feature
masonAdd-%:
	mason add $* --git-url git@github.com:Nurzhigit97/flutter_bricks.git --git-path $(gitPath)
	mason get

# Usage: make makeFeature featureName=chat listName=chats package=base_app
# Or: make makeFeature  (Mason will prompt for featureName, listName, package)
makeFeature:
	if [ -n "$(featureName)" ]; then \
		echo '{"featureName":"$(featureName)","listName":"$(listName)","package":"$(or $(package),base_app)"}' > .mason_feature_config.json && \
		mason make feature -c .mason_feature_config.json; \
		rm -f .mason_feature_config.json; \
	else \
		mason make feature; \
	fi

removeUnusedImports:
	dart fix --apply --code=unused_import

upgradeFlutter:
	fvm flutter upgrade

# # android
releaseApkSplit:
	fvm flutter build apk --release --split-per-abi 

shaKey:
	./gradlew signingReport

releaseApk:
	fvm flutter build apk --release

releaseAab:
	fvm flutter build appbundle --release

getAccessToGitHub:
	git remote set-url origin https://token@github.com/UserGithubName/projectMame.git

# ios
releaseIos:
	fvm flutter build ios --release

releaseIpa:
	fvm flutter build ipa --release

xcode:
	open ios/Runner.xcworkspace

shorebirdExport:
	export PATH="/Users/shaidievnurzhigit/.shorebird/bin:$PATH"

removeCache:
	rm -R ~/Library/Developer/CoreSimulator/Caches

nano:
	nano ~/.zshrc

createFlutter:
	fvm flutter create --platforms=android,ios $(name)

pubCacheRepair:
	rm -rf ~/ - pub-cache
	fvm flutter pub cache repair

pubCacheClean:
	rm -rf ~/ - pub-cache
	fvm flutter pub cache clean

#? git commands

#! Показывает статус файлов в рабочем каталоге.
checkoutToDevAndRemoveBranch:
	git checkout dev && git branch -d $(name)

# Создает новую ветку с указанным именем.
createBranch:
	git checkout -b $(name)

# Отправляет изменения на указанную ветку в удаленном репозитории.
pushBranch:
	git push origin $(name)

# Загружает изменения с удаленного репозитория, но не сливает их с вашей текущей веткой.
gitFetch:
	git fetch

# Получает изменения с удаленного репозитория и сливает их с вашей текущей веткой.
gitPull:
	git pull

#  Запускает инструмент для разрешения конфликтов при слиянии.
gitMergetool:
	git mergetool


#! git log показывает историю коммитов.
# Показывает различия между вашим рабочим каталогом и последним коммитом.
gitLog:
	git log --oneline --graph --all

# Показывает ограниченное количество последних коммитов.
gitLogN:
	git log -n 5


# Показывает коммиты, по сообщению с ключевым словом
gitLogBug:
	git log --grep="bug"

# Показывает коммиты, по автору
gitLogAuthor:
	git log --author="John Doe"

# Показывает коммиты, по дате
gitLogDate:
	git log --since="2 weeks ago"

# Показывает коммиты, по дате 2

gitLogDate2:
	git log --since="2025-02-01" --until="2025-02-05"

# Показывает коммиты, по файлу
gitLogFile:
	git log -- <file>

# Показывает коммиты, по сообщению
gitLogMessage:
	git log --grep="message"

# Показывает коммиты в красивом формате
# %h — короткий хэш коммита
# %an — имя автора
# %ar — время относительно текущего момента (например, "2 days ago")
# %s — сообщение коммита
gitLogPretty:
	git log --pretty=format:"%h - %an, %ar : %s"


#! git revert
# 111.Это создаст новый коммит, который отменит изменения, внесенные в указанном коммите. 
# 111.Это безопасный способ отменить изменения, так как не затрагивает историю репозитория
gitRevert:
	git revert <commit_hash>

# Откатить коммит и все изменения, сделанные этим коммитом
revertCommit:
	git revert $(commit_hash)


#! git reset
# Откатить не закоммиченные изменения в рабочем каталоге
resetChanges:
	git checkout -- <file>

# Откатить все не закоммиченные изменения в рабочем каталоге
resetAllChanges:
	git checkout -- .

# Откатить изменения, добавленные в индекс (но не закоммиченные)
resetStagedChanges:
	git reset <file>

# Откатить все изменения, добавленные в индекс
resetAllStagedChanges:
	git reset .

# Откатить последний коммит, сохранив изменения в рабочем каталоге
resetLastCommitSoft:
	git reset --soft HEAD~1

# Откатить последний коммит и все изменения в нем (удалить коммит и изменения)
resetLastCommitHard:
	git reset --hard HEAD~1

# Откатиться на n коммитов назад, сохранив изменения в рабочем каталоге
resetNCommitsSoft:
	git reset --soft HEAD~$(n)


# Откатить изменения после push в удаленный репозиторий
resetAndPushForce:
	git reset --hard HEAD~1
	git push --force
