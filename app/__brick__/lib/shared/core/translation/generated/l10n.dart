// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Русский`
  String get language {
    return Intl.message('Русский', name: 'language', desc: '', args: []);
  }

  /// `Настройки`
  String get settings {
    return Intl.message('Настройки', name: 'settings', desc: '', args: []);
  }

  /// `Мы в социальных сетях`
  String get weAreOnSocialMedia {
    return Intl.message(
      'Мы в социальных сетях',
      name: 'weAreOnSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Связаться с нами`
  String get contactUs {
    return Intl.message(
      'Связаться с нами',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message('Профиль', name: 'profile', desc: '', args: []);
  }

  /// `Контакты`
  String get contacts {
    return Intl.message('Контакты', name: 'contacts', desc: '', args: []);
  }

  /// `Сменить пароль`
  String get changePassword {
    return Intl.message(
      'Сменить пароль',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get exit {
    return Intl.message('Выйти', name: 'exit', desc: '', args: []);
  }

  /// `Выберите дату`
  String get selectDate {
    return Intl.message(
      'Выберите дату',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get phoneNumber {
    return Intl.message(
      'Номер телефона',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Электронная почта`
  String get mail {
    return Intl.message('Электронная почта', name: 'mail', desc: '', args: []);
  }

  /// `Скопирован`
  String get copy {
    return Intl.message('Скопирован', name: 'copy', desc: '', args: []);
  }

  /// `Адрес`
  String get address {
    return Intl.message('Адрес', name: 'address', desc: '', args: []);
  }

  /// `Добавить`
  String get add {
    return Intl.message('Добавить', name: 'add', desc: '', args: []);
  }

  /// `Поиск`
  String get search {
    return Intl.message('Поиск', name: 'search', desc: '', args: []);
  }

  /// `Удалить`
  String get delete {
    return Intl.message('Удалить', name: 'delete', desc: '', args: []);
  }

  /// `Город`
  String get city {
    return Intl.message('Город', name: 'city', desc: '', args: []);
  }

  /// `Отмена`
  String get cancel {
    return Intl.message('Отмена', name: 'cancel', desc: '', args: []);
  }

  /// `Закрыть`
  String get close {
    return Intl.message('Закрыть', name: 'close', desc: '', args: []);
  }

  /// `Дата`
  String get date {
    return Intl.message('Дата', name: 'date', desc: '', args: []);
  }

  /// `Продолжить`
  String get continues {
    return Intl.message('Продолжить', name: 'continues', desc: '', args: []);
  }

  /// `Подтвердить`
  String get confirm {
    return Intl.message('Подтвердить', name: 'confirm', desc: '', args: []);
  }

  /// `Отправить`
  String get send {
    return Intl.message('Отправить', name: 'send', desc: '', args: []);
  }

  /// `Ошибка отправки смс`
  String get errorSendSms {
    return Intl.message(
      'Ошибка отправки смс',
      name: 'errorSendSms',
      desc: '',
      args: [],
    );
  }

  /// `Смс отправлено`
  String get smsWasSend {
    return Intl.message(
      'Смс отправлено',
      name: 'smsWasSend',
      desc: '',
      args: [],
    );
  }

  /// `Неверный код`
  String get unCorrectCode {
    return Intl.message(
      'Неверный код',
      name: 'unCorrectCode',
      desc: '',
      args: [],
    );
  }

  /// `Введите код`
  String get enterCode {
    return Intl.message('Введите код', name: 'enterCode', desc: '', args: []);
  }

  /// `Повторный код, можете запросить через {seconds} секунд`
  String retryCodeMessage(Object seconds) {
    return Intl.message(
      'Повторный код, можете запросить через $seconds секунд',
      name: 'retryCodeMessage',
      desc: '',
      args: [seconds],
    );
  }

  /// `Мы отправили код на ваш номер`
  String get weSendCodeToPhoneNumber {
    return Intl.message(
      'Мы отправили код на ваш номер',
      name: 'weSendCodeToPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердить`
  String get comfirm {
    return Intl.message('Подтвердить', name: 'comfirm', desc: '', args: []);
  }

  /// `Отправить снова`
  String get sendAgain {
    return Intl.message(
      'Отправить снова',
      name: 'sendAgain',
      desc: '',
      args: [],
    );
  }

  /// `Забыл(а) пароль`
  String get forgotPassword {
    return Intl.message(
      'Забыл(а) пароль',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер телефона`
  String get enterPhoneNumber {
    return Intl.message(
      'Введите номер телефона',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка отправки кода`
  String get errorOnSendCode {
    return Intl.message(
      'Ошибка отправки кода',
      name: 'errorOnSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Получить код`
  String get getCode {
    return Intl.message('Получить код', name: 'getCode', desc: '', args: []);
  }

  /// `Введите новый пароль`
  String get enterNewPassword {
    return Intl.message(
      'Введите новый пароль',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Придумайте новый пароль для авторизации`
  String get inventNewPasswordForLogin {
    return Intl.message(
      'Придумайте новый пароль для авторизации',
      name: 'inventNewPasswordForLogin',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get newPassword {
    return Intl.message(
      'Новый пароль',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Введите пароль`
  String get enterPassword {
    return Intl.message(
      'Введите пароль',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Повторите новый пароль`
  String get confirmNewPassword {
    return Intl.message(
      'Повторите новый пароль',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Повторите пароль`
  String get repeatPassword {
    return Intl.message(
      'Повторите пароль',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Пароли не совпадают`
  String get passwordDoesntMatch {
    return Intl.message(
      'Пароли не совпадают',
      name: 'passwordDoesntMatch',
      desc: '',
      args: [],
    );
  }

  /// `Старый пароль успешно сброшен`
  String get oldPasswordSuccessfullyWasReset {
    return Intl.message(
      'Старый пароль успешно сброшен',
      name: 'oldPasswordSuccessfullyWasReset',
      desc: '',
      args: [],
    );
  }

  /// `Ваш пароль обновлен. Теперь перейдите на страницу авторизвации, и введите новый пароль`
  String get yourPasswordWasUpdatedGoToLogin {
    return Intl.message(
      'Ваш пароль обновлен. Теперь перейдите на страницу авторизвации, и введите новый пароль',
      name: 'yourPasswordWasUpdatedGoToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message('Сохранить', name: 'save', desc: '', args: []);
  }

  /// `Войти`
  String get login {
    return Intl.message('Войти', name: 'login', desc: '', args: []);
  }

  /// `Пароль`
  String get password {
    return Intl.message('Пароль', name: 'password', desc: '', args: []);
  }

  /// `Введите имя`
  String get enterFirstName {
    return Intl.message(
      'Введите имя',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get frstName {
    return Intl.message('Имя', name: 'frstName', desc: '', args: []);
  }

  /// `Введите фамилию`
  String get enterLastName {
    return Intl.message(
      'Введите фамилию',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get lastName {
    return Intl.message('Фамилия', name: 'lastName', desc: '', args: []);
  }

  /// `Уже есть аккаунт?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Уже есть аккаунт?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Начать`
  String get start {
    return Intl.message('Начать', name: 'start', desc: '', args: []);
  }

  /// `Не удалось загрузить данные`
  String get cantLoadData {
    return Intl.message(
      'Не удалось загрузить данные',
      name: 'cantLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Успешно добавлен`
  String get addedSuccessfully {
    return Intl.message(
      'Успешно добавлен',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось создать`
  String get cantCreate {
    return Intl.message(
      'Не удалось создать',
      name: 'cantCreate',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось отредактировать`
  String get cantEdit {
    return Intl.message(
      'Не удалось отредактировать',
      name: 'cantEdit',
      desc: '',
      args: [],
    );
  }

  /// `Успешно удалено`
  String get deleteSuccessfully {
    return Intl.message(
      'Успешно удалено',
      name: 'deleteSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Изменения сохранены`
  String get changesIsSaved {
    return Intl.message(
      'Изменения сохранены',
      name: 'changesIsSaved',
      desc: '',
      args: [],
    );
  }

  /// `ФИО`
  String get fio {
    return Intl.message('ФИО', name: 'fio', desc: '', args: []);
  }

  /// `Поле не может быть пустым`
  String get fieldCantBeIsEmpty {
    return Intl.message(
      'Поле не может быть пустым',
      name: 'fieldCantBeIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Это поле обязательно`
  String get fieldIsRequired {
    return Intl.message(
      'Это поле обязательно',
      name: 'fieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Введите число`
  String get enterNumber {
    return Intl.message(
      'Введите число',
      name: 'enterNumber',
      desc: '',
      args: [],
    );
  }

  /// `Введите адрес`
  String get enterAddress {
    return Intl.message(
      'Введите адрес',
      name: 'enterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Введите электронную почту`
  String get enterGmail {
    return Intl.message(
      'Введите электронную почту',
      name: 'enterGmail',
      desc: '',
      args: [],
    );
  }

  /// `Неверный формат почты`
  String get unCorrectEmail {
    return Intl.message(
      'Неверный формат почты',
      name: 'unCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать клиента`
  String get editClient {
    return Intl.message(
      'Редактировать клиента',
      name: 'editClient',
      desc: '',
      args: [],
    );
  }

  /// `Успешно обновлен`
  String get editSuccessfully {
    return Intl.message(
      'Успешно обновлен',
      name: 'editSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при редактировании`
  String get errorOnEdit {
    return Intl.message(
      'Ошибка при редактировании',
      name: 'errorOnEdit',
      desc: '',
      args: [],
    );
  }

  /// `Данные не изменились`
  String get dataWasntChange {
    return Intl.message(
      'Данные не изменились',
      name: 'dataWasntChange',
      desc: '',
      args: [],
    );
  }

  /// `Выберите город`
  String get selectCity {
    return Intl.message(
      'Выберите город',
      name: 'selectCity',
      desc: '',
      args: [],
    );
  }

  /// `Создать`
  String get create {
    return Intl.message('Создать', name: 'create', desc: '', args: []);
  }

  /// `и`
  String get and {
    return Intl.message('и', name: 'and', desc: '', args: []);
  }

  /// `Подробнее`
  String get detail {
    return Intl.message('Подробнее', name: 'detail', desc: '', args: []);
  }

  /// `Политикой конфиденциальности`
  String get privacyPolicy {
    return Intl.message(
      'Политикой конфиденциальности',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Продолжая, я соглашаюсь с `
  String get movingOnIAgreeWith {
    return Intl.message(
      'Продолжая, я соглашаюсь с ',
      name: 'movingOnIAgreeWith',
      desc: '',
      args: [],
    );
  }

  /// `Условиями использования.`
  String get userAgreement {
    return Intl.message(
      'Условиями использования.',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Старый пароль`
  String get oldPassword {
    return Intl.message(
      'Старый пароль',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Введите старый пароль`
  String get enterOldPassword {
    return Intl.message(
      'Введите старый пароль',
      name: 'enterOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Выберите изображение`
  String get selectImage {
    return Intl.message(
      'Выберите изображение',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Комментарий`
  String get comment {
    return Intl.message('Комментарий', name: 'comment', desc: '', args: []);
  }

  /// `Введите комментарий`
  String get enterComment {
    return Intl.message(
      'Введите комментарий',
      name: 'enterComment',
      desc: '',
      args: [],
    );
  }

  /// `Введите корректные данные`
  String get enterCorrectData {
    return Intl.message(
      'Введите корректные данные',
      name: 'enterCorrectData',
      desc: '',
      args: [],
    );
  }

  /// `Данные успешно обновлены`
  String get dataSuccessfullyUpdated {
    return Intl.message(
      'Данные успешно обновлены',
      name: 'dataSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Изменения сохранены`
  String get changesSaved {
    return Intl.message(
      'Изменения сохранены',
      name: 'changesSaved',
      desc: '',
      args: [],
    );
  }

  /// `Подробнее`
  String get detailed {
    return Intl.message('Подробнее', name: 'detailed', desc: '', args: []);
  }

  /// `Имя`
  String get firstName {
    return Intl.message('Имя', name: 'firstName', desc: '', args: []);
  }

  /// `Далее`
  String get further {
    return Intl.message('Далее', name: 'further', desc: '', args: []);
  }

  /// `Удалить аккаунт`
  String get deleteAccount {
    return Intl.message(
      'Удалить аккаунт',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Дата рождения`
  String get birthdate {
    return Intl.message('Дата рождения', name: 'birthdate', desc: '', args: []);
  }

  /// `Введите дату рождения`
  String get enterBirthdate {
    return Intl.message(
      'Введите дату рождения',
      name: 'enterBirthdate',
      desc: '',
      args: [],
    );
  }

  /// `Никаких изменений не было!`
  String get nothingChanged {
    return Intl.message(
      'Никаких изменений не было!',
      name: 'nothingChanged',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, повторите пароль`
  String get pleaseRepeatPassword {
    return Intl.message(
      'Пожалуйста, повторите пароль',
      name: 'pleaseRepeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Обновить пароль`
  String get updatePassword {
    return Intl.message(
      'Обновить пароль',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Применить`
  String get apply {
    return Intl.message('Применить', name: 'apply', desc: '', args: []);
  }

  /// `Скачать`
  String get download {
    return Intl.message('Скачать', name: 'download', desc: '', args: []);
  }

  /// `Не удалось получить изображение.`
  String get cantGetImage {
    return Intl.message(
      'Не удалось получить изображение.',
      name: 'cantGetImage',
      desc: '',
      args: [],
    );
  }

  /// `Доступ к галерее отклонен`
  String get accessToTheGalleryIsDenied {
    return Intl.message(
      'Доступ к галерее отклонен',
      name: 'accessToTheGalleryIsDenied',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, включите доступ к галерее в настройках.`
  String get pleaseEnableAccessToTheGalleryInTheSettings {
    return Intl.message(
      'Пожалуйста, включите доступ к галерее в настройках.',
      name: 'pleaseEnableAccessToTheGalleryInTheSettings',
      desc: '',
      args: [],
    );
  }

  /// `Открыть настройки`
  String get openSettings {
    return Intl.message(
      'Открыть настройки',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Добавить фото`
  String get addImage {
    return Intl.message('Добавить фото', name: 'addImage', desc: '', args: []);
  }

  /// `Нажимая кнопку "Войти" я соглашаюсь с условиями `
  String get byClickingTheSignInButtonIAgreeToTheTermsAndConditions {
    return Intl.message(
      'Нажимая кнопку "Войти" я соглашаюсь с условиями ',
      name: 'byClickingTheSignInButtonIAgreeToTheTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get homePage {
    return Intl.message('Главная', name: 'homePage', desc: '', args: []);
  }

  /// `В разработке`
  String get inDevelopment {
    return Intl.message(
      'В разработке',
      name: 'inDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Данная функциональность находится в разработке`
  String get thisFunctionInDelevelopmentState {
    return Intl.message(
      'Данная функциональность находится в разработке',
      name: 'thisFunctionInDelevelopmentState',
      desc: '',
      args: [],
    );
  }

  /// `Эти поля обязательны`
  String get thisFieldsIsRequired {
    return Intl.message(
      'Эти поля обязательны',
      name: 'thisFieldsIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Профиль успешно обновлен`
  String get updateProfileSuccess {
    return Intl.message(
      'Профиль успешно обновлен',
      name: 'updateProfileSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось обновить профиль`
  String get cantUpdateProfile {
    return Intl.message(
      'Не удалось обновить профиль',
      name: 'cantUpdateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать данные`
  String get editData {
    return Intl.message(
      'Редактировать данные',
      name: 'editData',
      desc: '',
      args: [],
    );
  }

  /// `Удалить сотрудника`
  String get deletePersonal {
    return Intl.message(
      'Удалить сотрудника',
      name: 'deletePersonal',
      desc: '',
      args: [],
    );
  }

  /// `Один сотрудник`
  String get onePersonal {
    return Intl.message(
      'Один сотрудник',
      name: 'onePersonal',
      desc: '',
      args: [],
    );
  }

  /// `будет удален из списка сотрудников`
  String get willBeRemovedFromTheListOfEmployees {
    return Intl.message(
      'будет удален из списка сотрудников',
      name: 'willBeRemovedFromTheListOfEmployees',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите удалить этот элемент?`
  String get youReallyWantRemoveThisElement {
    return Intl.message(
      'Вы действительно хотите удалить этот элемент?',
      name: 'youReallyWantRemoveThisElement',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message('Редактировать', name: 'edit', desc: '', args: []);
  }

  /// `Предметы`
  String get subjects {
    return Intl.message('Предметы', name: 'subjects', desc: '', args: []);
  }

  /// `Университеты`
  String get universities {
    return Intl.message(
      'Университеты',
      name: 'universities',
      desc: '',
      args: [],
    );
  }

  /// `Новости`
  String get news {
    return Intl.message('Новости', name: 'news', desc: '', args: []);
  }

  /// `Уровень`
  String get level {
    return Intl.message('Уровень', name: 'level', desc: '', args: []);
  }

  /// `О приложении`
  String get aboutApp {
    return Intl.message('О приложении', name: 'aboutApp', desc: '', args: []);
  }

  /// `Описание`
  String get info {
    return Intl.message('Описание', name: 'info', desc: '', args: []);
  }

  /// `OKUPro — первая образовательная онлайн-платформа с Искусственным Интеллектом из Кыргызстана! 🇰🇬 Платформа для школьников и студентов из Центральной Азии. Мы объединяем обучение, тестирование, карьерную навигацию и мотивацию в одной платформе.`
  String get description {
    return Intl.message(
      'OKUPro — первая образовательная онлайн-платформа с Искусственным Интеллектом из Кыргызстана! 🇰🇬 Платформа для школьников и студентов из Центральной Азии. Мы объединяем обучение, тестирование, карьерную навигацию и мотивацию в одной платформе.',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get ru {
    return Intl.message('Русский', name: 'ru', desc: '', args: []);
  }

  /// `Кыргызча`
  String get kyrgyz {
    return Intl.message('Кыргызча', name: 'kyrgyz', desc: '', args: []);
  }

  /// `Выбор языка`
  String get selectLanguage {
    return Intl.message(
      'Выбор языка',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Тема`
  String get theme {
    return Intl.message('Тема', name: 'theme', desc: '', args: []);
  }

  /// `Узнать как поступить`
  String get knowHowDo {
    return Intl.message(
      'Узнать как поступить',
      name: 'knowHowDo',
      desc: '',
      args: [],
    );
  }

  /// `Принятие документов`
  String get giveDoc {
    return Intl.message(
      'Принятие документов',
      name: 'giveDoc',
      desc: '',
      args: [],
    );
  }

  /// `Описание заведения`
  String get descriptionBuild {
    return Intl.message(
      'Описание заведения',
      name: 'descriptionBuild',
      desc: '',
      args: [],
    );
  }

  /// `Сайт:`
  String get site {
    return Intl.message('Сайт:', name: 'site', desc: '', args: []);
  }

  /// `Социальные сети:`
  String get socialMedia {
    return Intl.message(
      'Социальные сети:',
      name: 'socialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Как поступить?`
  String get howToMake {
    return Intl.message(
      'Как поступить?',
      name: 'howToMake',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get home {
    return Intl.message('Главная', name: 'home', desc: '', args: []);
  }

  /// `AI камера`
  String get aiCamera {
    return Intl.message('AI камера', name: 'aiCamera', desc: '', args: []);
  }

  /// `Универы`
  String get univers {
    return Intl.message('Универы', name: 'univers', desc: '', args: []);
  }

  /// `Кабинет`
  String get profileBottom {
    return Intl.message('Кабинет', name: 'profileBottom', desc: '', args: []);
  }

  /// `ИИ камера в процессе разработки`
  String get aiInProgress {
    return Intl.message(
      'ИИ камера в процессе разработки',
      name: 'aiInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Хорошо`
  String get good {
    return Intl.message('Хорошо', name: 'good', desc: '', args: []);
  }

  /// `Выберите другую`
  String get selectAnother {
    return Intl.message(
      'Выберите другую',
      name: 'selectAnother',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка загрузки уровней`
  String get errorLoadLevels {
    return Intl.message(
      'Ошибка загрузки уровней',
      name: 'errorLoadLevels',
      desc: '',
      args: [],
    );
  }

  /// `Повторить`
  String get repeat {
    return Intl.message('Повторить', name: 'repeat', desc: '', args: []);
  }

  /// `Смотреть все`
  String get seeAll {
    return Intl.message('Смотреть все', name: 'seeAll', desc: '', args: []);
  }

  /// `Вы уверены, что хотите удалить аккаунт?`
  String get areYouReallyWantDeleteAccount {
    return Intl.message(
      'Вы уверены, что хотите удалить аккаунт?',
      name: 'areYouReallyWantDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get logout {
    return Intl.message('Выход', name: 'logout', desc: '', args: []);
  }

  /// `Вы уверены, что хотите выйти из аккаунта?`
  String get areYouReallyWantLogout {
    return Intl.message(
      'Вы уверены, что хотите выйти из аккаунта?',
      name: 'areYouReallyWantLogout',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get signIn {
    return Intl.message('Войти', name: 'signIn', desc: '', args: []);
  }

  /// `Разработано`
  String get developedBy {
    return Intl.message('Разработано', name: 'developedBy', desc: '', args: []);
  }

  /// `ч`
  String get h {
    return Intl.message('ч', name: 'h', desc: '', args: []);
  }

  /// `мин`
  String get min {
    return Intl.message('мин', name: 'min', desc: '', args: []);
  }

  /// `сек`
  String get sec {
    return Intl.message('сек', name: 'sec', desc: '', args: []);
  }

  /// `Нет подключения к интернету`
  String get hasntInternet {
    return Intl.message(
      'Нет подключения к интернету',
      name: 'hasntInternet',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте соединение`
  String get checkInternetConnection {
    return Intl.message(
      'Проверьте соединение',
      name: 'checkInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Не удается подключиться к серверу. Проверьте интернет-соединение и попробуйте снова.`
  String get cantConnectToServer {
    return Intl.message(
      'Не удается подключиться к серверу. Проверьте интернет-соединение и попробуйте снова.',
      name: 'cantConnectToServer',
      desc: '',
      args: [],
    );
  }

  /// `Превышено время ожидания`
  String get timeout {
    return Intl.message(
      'Превышено время ожидания',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `Сервер не отвечает`
  String get serverNotResponding {
    return Intl.message(
      'Сервер не отвечает',
      name: 'serverNotResponding',
      desc: '',
      args: [],
    );
  }

  /// `Сервер не отвечает в течение долгого времени. Попробуйте позже.`
  String get serverNotRespondingLongTime {
    return Intl.message(
      'Сервер не отвечает в течение долгого времени. Попробуйте позже.',
      name: 'serverNotRespondingLongTime',
      desc: '',
      args: [],
    );
  }

  /// `Неверный запрос`
  String get badRequest {
    return Intl.message(
      'Неверный запрос',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `Сервер не может обработать ваш запрос из-за неправильного синтаксиса.`
  String get badRequestSintaxError {
    return Intl.message(
      'Сервер не может обработать ваш запрос из-за неправильного синтаксиса.',
      name: 'badRequestSintaxError',
      desc: '',
      args: [],
    );
  }

  /// `Не авторизован`
  String get unauthorized {
    return Intl.message(
      'Не авторизован',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Для доступа к этому ресурсу требуется авторизация.`
  String get unauthorizedDescription {
    return Intl.message(
      'Для доступа к этому ресурсу требуется авторизация.',
      name: 'unauthorizedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Доступ запрещен`
  String get forbidden {
    return Intl.message(
      'Доступ запрещен',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `У вас нет прав для доступа к этому ресурсу.`
  String get forbiddenDescription {
    return Intl.message(
      'У вас нет прав для доступа к этому ресурсу.',
      name: 'forbiddenDescription',
      desc: '',
      args: [],
    );
  }

  /// `Страница не найдена`
  String get notFound {
    return Intl.message(
      'Страница не найдена',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Запрашиваемая страница не существует.`
  String get notFoundDescription {
    return Intl.message(
      'Запрашиваемая страница не существует.',
      name: 'notFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка сервера`
  String get serverError {
    return Intl.message(
      'Ошибка сервера',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Внутренняя ошибка сервера. Попробуйте позже.`
  String get serverErrorDescription {
    return Intl.message(
      'Внутренняя ошибка сервера. Попробуйте позже.',
      name: 'serverErrorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка шлюза`
  String get badGateway {
    return Intl.message('Ошибка шлюза', name: 'badGateway', desc: '', args: []);
  }

  /// `Сервер получил неверный ответ от вышестоящего сервера.`
  String get theServerReceivedAnIncorrectResponseFromAndUpstreamServer {
    return Intl.message(
      'Сервер получил неверный ответ от вышестоящего сервера.',
      name: 'theServerReceivedAnIncorrectResponseFromAndUpstreamServer',
      desc: '',
      args: [],
    );
  }

  /// `Сервис недоступен`
  String get serviceUnavailable {
    return Intl.message(
      'Сервис недоступен',
      name: 'serviceUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Сервер временно недоступен. Попробуйте позже.`
  String get serviceUnavailableDescription {
    return Intl.message(
      'Сервер временно недоступен. Попробуйте позже.',
      name: 'serviceUnavailableDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message('Ошибка', name: 'error', desc: '', args: []);
  }

  /// `Что-то пошло не так`
  String get somethingWentWrong {
    return Intl.message(
      'Что-то пошло не так',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Попробуйте позже`
  String get repeatAgain {
    return Intl.message(
      'Попробуйте позже',
      name: 'repeatAgain',
      desc: '',
      args: [],
    );
  }

  /// `Перезапустите приложение`
  String get restartApp {
    return Intl.message(
      'Перезапустите приложение',
      name: 'restartApp',
      desc: '',
      args: [],
    );
  }

  /// `Попробовать снова`
  String get tryAgain {
    return Intl.message(
      'Попробовать снова',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Вернуться на главный экран`
  String get backToHome {
    return Intl.message(
      'Вернуться на главный экран',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Школа`
  String get school {
    return Intl.message('Школа', name: 'school', desc: '', args: []);
  }

  /// `Введите название школы`
  String get enterSchoolName {
    return Intl.message(
      'Введите название школы',
      name: 'enterSchoolName',
      desc: '',
      args: [],
    );
  }

  /// `Другое`
  String get other {
    return Intl.message('Другое', name: 'other', desc: '', args: []);
  }

  /// `К сожалению предоставленной вами школы пока нет в нашей базе. Напишите полное ее название и мы рассмотрим ее добавление`
  String get hasntSchoolWeWillAddYourSchool {
    return Intl.message(
      'К сожалению предоставленной вами школы пока нет в нашей базе. Напишите полное ее название и мы рассмотрим ее добавление',
      name: 'hasntSchoolWeWillAddYourSchool',
      desc: '',
      args: [],
    );
  }

  /// `Предложить школу`
  String get suggestSchool {
    return Intl.message(
      'Предложить школу',
      name: 'suggestSchool',
      desc: '',
      args: [],
    );
  }

  /// `Район`
  String get region {
    return Intl.message('Район', name: 'region', desc: '', args: []);
  }

  /// `Сначала выберите регион`
  String get selectRegionFirst {
    return Intl.message(
      'Сначала выберите регион',
      name: 'selectRegionFirst',
      desc: '',
      args: [],
    );
  }

  /// `Выберите район`
  String get selectDistrict {
    return Intl.message(
      'Выберите район',
      name: 'selectDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Район`
  String get district {
    return Intl.message('Район', name: 'district', desc: '', args: []);
  }

  /// `Выберите регион`
  String get selectRegion {
    return Intl.message(
      'Выберите регион',
      name: 'selectRegion',
      desc: '',
      args: [],
    );
  }

  /// `Сначала выберите район`
  String get selectDistrictFirst {
    return Intl.message(
      'Сначала выберите район',
      name: 'selectDistrictFirst',
      desc: '',
      args: [],
    );
  }

  /// `Выберите школу`
  String get selectSchool {
    return Intl.message(
      'Выберите школу',
      name: 'selectSchool',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестная ошибка`
  String get other_error {
    return Intl.message(
      'Неизвестная ошибка',
      name: 'other_error',
      desc: '',
      args: [],
    );
  }

  /// `Доступ ограничен`
  String get accessRestricted {
    return Intl.message(
      'Доступ ограничен',
      name: 'accessRestricted',
      desc: '',
      args: [],
    );
  }

  /// `Для доступа к этому разделу необходимо авторизоваться`
  String get toAccessThisSectionYouMustBeAuthorized {
    return Intl.message(
      'Для доступа к этому разделу необходимо авторизоваться',
      name: 'toAccessThisSectionYouMustBeAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `Все`
  String get all {
    return Intl.message('Все', name: 'all', desc: '', args: []);
  }

  /// `Далее`
  String get next {
    return Intl.message('Далее', name: 'next', desc: '', args: []);
  }

  /// `Вход`
  String get signIn2 {
    return Intl.message('Вход', name: 'signIn2', desc: '', args: []);
  }

  /// `Войти через номер телефона`
  String get signInWithPhone {
    return Intl.message(
      'Войти через номер телефона',
      name: 'signInWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Номер должен начинаться с +996`
  String get phoneNumberMustStartWith996 {
    return Intl.message(
      'Номер должен начинаться с +996',
      name: 'phoneNumberMustStartWith996',
      desc: '',
      args: [],
    );
  }

  /// `Введите полный номер телефона`
  String get enterFullPhoneNumber {
    return Intl.message(
      'Введите полный номер телефона',
      name: 'enterFullPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `или`
  String get or {
    return Intl.message('или', name: 'or', desc: '', args: []);
  }

  /// `Войти через Apple`
  String get signInWithApple {
    return Intl.message(
      'Войти через Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Войти через Google`
  String get signInWithGoogle {
    return Intl.message(
      'Войти через Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Введите код подтверждения`
  String get enterConfirmationCode {
    return Intl.message(
      'Введите код подтверждения',
      name: 'enterConfirmationCode',
      desc: '',
      args: [],
    );
  }

  /// `Неверный номер?`
  String get incorrectNumber {
    return Intl.message(
      'Неверный номер?',
      name: 'incorrectNumber',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get ruTitle {
    return Intl.message('Русский', name: 'ruTitle', desc: '', args: []);
  }

  /// `Кыргызча`
  String get kyTitle {
    return Intl.message('Кыргызча', name: 'kyTitle', desc: '', args: []);
  }

  /// `Тесты`
  String get tests {
    return Intl.message('Тесты', name: 'tests', desc: '', args: []);
  }

  /// `Тест`
  String get test {
    return Intl.message('Тест', name: 'test', desc: '', args: []);
  }

  /// `Длительность`
  String get duration {
    return Intl.message('Длительность', name: 'duration', desc: '', args: []);
  }

  /// `мин`
  String get minute {
    return Intl.message('мин', name: 'minute', desc: '', args: []);
  }

  /// `Личный кабинет`
  String get myProfile {
    return Intl.message(
      'Личный кабинет',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `История тестов`
  String get testHistory {
    return Intl.message(
      'История тестов',
      name: 'testHistory',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get logout2 {
    return Intl.message('Выйти', name: 'logout2', desc: '', args: []);
  }

  /// `ДД/ММ/ГГГГ`
  String get dateFormat {
    return Intl.message('ДД/ММ/ГГГГ', name: 'dateFormat', desc: '', args: []);
  }

  /// `Выбрать`
  String get select {
    return Intl.message('Выбрать', name: 'select', desc: '', args: []);
  }

  /// `Пол`
  String get gender {
    return Intl.message('Пол', name: 'gender', desc: '', args: []);
  }

  /// `Мужчина`
  String get man {
    return Intl.message('Мужчина', name: 'man', desc: '', args: []);
  }

  /// `Женщина`
  String get woman {
    return Intl.message('Женщина', name: 'woman', desc: '', args: []);
  }

  /// `Подписка`
  String get subscription {
    return Intl.message('Подписка', name: 'subscription', desc: '', args: []);
  }

  /// `6 месяцев`
  String get sizMonth {
    return Intl.message('6 месяцев', name: 'sizMonth', desc: '', args: []);
  }

  /// `6 месяцев`
  String get sixMonth {
    return Intl.message('6 месяцев', name: 'sixMonth', desc: '', args: []);
  }

  /// `Активна`
  String get active {
    return Intl.message('Активна', name: 'active', desc: '', args: []);
  }

  /// `300 сом `
  String get threeHundredSom {
    return Intl.message(
      '300 сом ',
      name: 'threeHundredSom',
      desc: '',
      args: [],
    );
  }

  /// `(скидка -75%)`
  String get discount75 {
    return Intl.message(
      '(скидка -75%)',
      name: 'discount75',
      desc: '',
      args: [],
    );
  }

  /// `Активна до`
  String get activeUntil {
    return Intl.message('Активна до', name: 'activeUntil', desc: '', args: []);
  }

  /// `Посмотреть все планы`
  String get viewAllPlans {
    return Intl.message(
      'Посмотреть все планы',
      name: 'viewAllPlans',
      desc: '',
      args: [],
    );
  }

  /// `Прочитать все`
  String get readAll {
    return Intl.message('Прочитать все', name: 'readAll', desc: '', args: []);
  }

  /// `Пройти полный тест`
  String get takeFullTest {
    return Intl.message(
      'Пройти полный тест',
      name: 'takeFullTest',
      desc: '',
      args: [],
    );
  }

  /// `Прогресс`
  String get progress {
    return Intl.message('Прогресс', name: 'progress', desc: '', args: []);
  }

  /// `Пройти тест`
  String get takTest {
    return Intl.message('Пройти тест', name: 'takTest', desc: '', args: []);
  }

  /// `Тест не найден`
  String get testUndefined {
    return Intl.message(
      'Тест не найден',
      name: 'testUndefined',
      desc: '',
      args: [],
    );
  }

  /// `Выберите ответ`
  String get selectAnswer {
    return Intl.message(
      'Выберите ответ',
      name: 'selectAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Задание`
  String get task {
    return Intl.message('Задание', name: 'task', desc: '', args: []);
  }

  /// `Показать решение`
  String get showSolution {
    return Intl.message(
      'Показать решение',
      name: 'showSolution',
      desc: '',
      args: [],
    );
  }

  /// `Тема`
  String get topic {
    return Intl.message('Тема', name: 'topic', desc: '', args: []);
  }

  /// `Генерирую ответ`
  String get generatingAnswer {
    return Intl.message(
      'Генерирую ответ',
      name: 'generatingAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Завершить`
  String get finish {
    return Intl.message('Завершить', name: 'finish', desc: '', args: []);
  }

  /// `Предыдущий`
  String get previous {
    return Intl.message('Предыдущий', name: 'previous', desc: '', args: []);
  }

  /// `Следующий`
  String get next2 {
    return Intl.message('Следующий', name: 'next2', desc: '', args: []);
  }

  /// `Решение`
  String get solution {
    return Intl.message('Решение', name: 'solution', desc: '', args: []);
  }

  /// `Сгенерировано ИИ`
  String get generatedByAI {
    return Intl.message(
      'Сгенерировано ИИ',
      name: 'generatedByAI',
      desc: '',
      args: [],
    );
  }

  /// `Правильный ответ`
  String get correctAnswer {
    return Intl.message(
      'Правильный ответ',
      name: 'correctAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Посмотреть результат`
  String get viewResult {
    return Intl.message(
      'Посмотреть результат',
      name: 'viewResult',
      desc: '',
      args: [],
    );
  }

  /// `Пройти еще раз`
  String get retake {
    return Intl.message('Пройти еще раз', name: 'retake', desc: '', args: []);
  }

  /// `Правильных ответов`
  String get correctAnswers {
    return Intl.message(
      'Правильных ответов',
      name: 'correctAnswers',
      desc: '',
      args: [],
    );
  }

  /// `Неправильных ответов`
  String get incorrectAnswers {
    return Intl.message(
      'Неправильных ответов',
      name: 'incorrectAnswers',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get register {
    return Intl.message('Регистрация', name: 'register', desc: '', args: []);
  }

  /// `Выйти из теста?`
  String get logoutFromTest {
    return Intl.message(
      'Выйти из теста?',
      name: 'logoutFromTest',
      desc: '',
      args: [],
    );
  }

  /// `Вы уверены, что хотите выйти из теста?`
  String get logoutFromTestDescription {
    return Intl.message(
      'Вы уверены, что хотите выйти из теста?',
      name: 'logoutFromTestDescription',
      desc: '',
      args: [],
    );
  }

  /// `Написать`
  String get write {
    return Intl.message('Написать', name: 'write', desc: '', args: []);
  }

  /// `Оставить предложение/жалобу`
  String get leaveSuggestionOrComplaint {
    return Intl.message(
      'Оставить предложение/жалобу',
      name: 'leaveSuggestionOrComplaint',
      desc: '',
      args: [],
    );
  }

  /// `Регион/Город`
  String get regionCity {
    return Intl.message('Регион/Город', name: 'regionCity', desc: '', args: []);
  }

  /// `Файл слишком большой. Попробуйте выбрать изображение меньшего размера.`
  String get imageSizeAreLong {
    return Intl.message(
      'Файл слишком большой. Попробуйте выбрать изображение меньшего размера.',
      name: 'imageSizeAreLong',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка отправки изображения`
  String get errorUploadImage {
    return Intl.message(
      'Ошибка отправки изображения',
      name: 'errorUploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Требуется обновление`
  String get needUpdateApp {
    return Intl.message(
      'Требуется обновление',
      name: 'needUpdateApp',
      desc: '',
      args: [],
    );
  }

  /// `Текущая версия:`
  String get currentVersion {
    return Intl.message(
      'Текущая версия:',
      name: 'currentVersion',
      desc: '',
      args: [],
    );
  }

  /// `Новая версия:`
  String get newVersion {
    return Intl.message(
      'Новая версия:',
      name: 'newVersion',
      desc: '',
      args: [],
    );
  }

  /// `Обновить приложение`
  String get updateApp {
    return Intl.message(
      'Обновить приложение',
      name: 'updateApp',
      desc: '',
      args: [],
    );
  }

  /// `Для продолжения работы необходимо обновить приложение`
  String get needUpdateAppToUse {
    return Intl.message(
      'Для продолжения работы необходимо обновить приложение',
      name: 'needUpdateAppToUse',
      desc: '',
      args: [],
    );
  }

  /// `Добро пожаловать в OKUPro AI!`
  String get welcome {
    return Intl.message(
      'Добро пожаловать в OKUPro AI!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Задайте любой вопрос по учебе, и я помогу вам найти ответ`
  String get answerAnyQuestion {
    return Intl.message(
      'Задайте любой вопрос по учебе, и я помогу вам найти ответ',
      name: 'answerAnyQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Напишите что-нибудь...`
  String get writeSomething {
    return Intl.message(
      'Напишите что-нибудь...',
      name: 'writeSomething',
      desc: '',
      args: [],
    );
  }

  /// `Результатов`
  String get resultLength {
    return Intl.message(
      'Результатов',
      name: 'resultLength',
      desc: '',
      args: [],
    );
  }

  /// `Неверные координаты`
  String get uncorrectCoordinate {
    return Intl.message(
      'Неверные координаты',
      name: 'uncorrectCoordinate',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при открытии карты`
  String get errorOpeningMap {
    return Intl.message(
      'Ошибка при открытии карты',
      name: 'errorOpeningMap',
      desc: '',
      args: [],
    );
  }

  /// `Местоположение`
  String get location {
    return Intl.message('Местоположение', name: 'location', desc: '', args: []);
  }

  /// `Показать на карте`
  String get showOnMap {
    return Intl.message(
      'Показать на карте',
      name: 'showOnMap',
      desc: '',
      args: [],
    );
  }

  /// `Выберите карту`
  String get selectMap {
    return Intl.message(
      'Выберите карту',
      name: 'selectMap',
      desc: '',
      args: [],
    );
  }

  /// `Открыть в 2GIS`
  String get openIn2gis {
    return Intl.message(
      'Открыть в 2GIS',
      name: 'openIn2gis',
      desc: '',
      args: [],
    );
  }

  /// `Открыть в приложении карт`
  String get openInMap {
    return Intl.message(
      'Открыть в приложении карт',
      name: 'openInMap',
      desc: '',
      args: [],
    );
  }

  /// `Карты`
  String get maps {
    return Intl.message('Карты', name: 'maps', desc: '', args: []);
  }

  /// `Учебные заведения`
  String get educationCenter {
    return Intl.message(
      'Учебные заведения',
      name: 'educationCenter',
      desc: '',
      args: [],
    );
  }

  /// `Карта`
  String get map {
    return Intl.message('Карта', name: 'map', desc: '', args: []);
  }

  /// `Новый запрос`
  String get newRequest {
    return Intl.message('Новый запрос', name: 'newRequest', desc: '', args: []);
  }

  /// `Нет доступных чатов`
  String get noAvailableChats {
    return Intl.message(
      'Нет доступных чатов',
      name: 'noAvailableChats',
      desc: '',
      args: [],
    );
  }

  /// `Пусто`
  String get empty {
    return Intl.message('Пусто', name: 'empty', desc: '', args: []);
  }

  /// `Нет вопросов`
  String get hasNotQuestions {
    return Intl.message(
      'Нет вопросов',
      name: 'hasNotQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Нет доступа к галерее. Разрешите доступ в настройках.`
  String get permissionGallryDescription {
    return Intl.message(
      'Нет доступа к галерее. Разрешите доступ в настройках.',
      name: 'permissionGallryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось выбрать изображение`
  String get errorSelectImage {
    return Intl.message(
      'Не удалось выбрать изображение',
      name: 'errorSelectImage',
      desc: '',
      args: [],
    );
  }

  /// `Нет доступа к камере. Разрешите доступ в настройках.`
  String get permissionCameraDescription {
    return Intl.message(
      'Нет доступа к камере. Разрешите доступ в настройках.',
      name: 'permissionCameraDescription',
      desc: '',
      args: [],
    );
  }

  /// `Требуется разрешение`
  String get RequiredPermission {
    return Intl.message(
      'Требуется разрешение',
      name: 'RequiredPermission',
      desc: '',
      args: [],
    );
  }

  /// `Требуется разрешение`
  String get requiredPermission {
    return Intl.message(
      'Требуется разрешение',
      name: 'requiredPermission',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать фото`
  String get editImage {
    return Intl.message(
      'Редактировать фото',
      name: 'editImage',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при описании вопроса`
  String get errorOnGetAnswerToQuestionFromAI {
    return Intl.message(
      'Ошибка при описании вопроса',
      name: 'errorOnGetAnswerToQuestionFromAI',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите строку`
  String get mustBeString {
    return Intl.message(
      'Пожалуйста, введите строку',
      name: 'mustBeString',
      desc: '',
      args: [],
    );
  }

  /// `dd/MM/yyyy`
  String get ddmmyyyy {
    return Intl.message('dd/MM/yyyy', name: 'ddmmyyyy', desc: '', args: []);
  }

  /// `Загрузка PDF...`
  String get loadingPdf {
    return Intl.message(
      'Загрузка PDF...',
      name: 'loadingPdf',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка загрузки PDF`
  String get pdfLoadingError {
    return Intl.message(
      'Ошибка загрузки PDF',
      name: 'pdfLoadingError',
      desc: '',
      args: [],
    );
  }

  /// `Информация о кэше`
  String get cacheInformation {
    return Intl.message(
      'Информация о кэше',
      name: 'cacheInformation',
      desc: '',
      args: [],
    );
  }

  /// `Размер кэша:`
  String get cacheSize {
    return Intl.message('Размер кэша:', name: 'cacheSize', desc: '', args: []);
  }

  /// `Количество файлов:`
  String get numberOfFiles {
    return Intl.message(
      'Количество файлов:',
      name: 'numberOfFiles',
      desc: '',
      args: [],
    );
  }

  /// `Максимум:`
  String get maximum {
    return Intl.message('Максимум:', name: 'maximum', desc: '', args: []);
  }

  /// `Кэш автоматически очищается при превышении лимитов. Старые файлы удаляются первыми.`
  String get cacheAutoClearDescription {
    return Intl.message(
      'Кэш автоматически очищается при превышении лимитов. Старые файлы удаляются первыми.',
      name: 'cacheAutoClearDescription',
      desc: '',
      args: [],
    );
  }

  /// `Очистить кэш`
  String get clearCache {
    return Intl.message('Очистить кэш', name: 'clearCache', desc: '', args: []);
  }

  /// `Это удалит все кэшированные PDF файлы. Они будут загружены заново при следующем открытии.`
  String get clearCacheDescription {
    return Intl.message(
      'Это удалит все кэшированные PDF файлы. Они будут загружены заново при следующем открытии.',
      name: 'clearCacheDescription',
      desc: '',
      args: [],
    );
  }

  /// `Очистить`
  String get clear {
    return Intl.message('Очистить', name: 'clear', desc: '', args: []);
  }

  /// `Кэш очищен`
  String get cacheCleared {
    return Intl.message('Кэш очищен', name: 'cacheCleared', desc: '', args: []);
  }

  /// `Ошибка загрузки:`
  String get loadingError {
    return Intl.message(
      'Ошибка загрузки:',
      name: 'loadingError',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось загрудить pdf`
  String get cantLoadPdf {
    return Intl.message(
      'Не удалось загрудить pdf',
      name: 'cantLoadPdf',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось сделать фото`
  String get errorTakePhoto {
    return Intl.message(
      'Не удалось сделать фото',
      name: 'errorTakePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось обновить картинку`
  String get cantUpdateProfileImage {
    return Intl.message(
      'Не удалось обновить картинку',
      name: 'cantUpdateProfileImage',
      desc: '',
      args: [],
    );
  }

  /// `Почта`
  String get email {
    return Intl.message('Почта', name: 'email', desc: '', args: []);
  }

  /// `получено опыта`
  String get gotSkills {
    return Intl.message(
      'получено опыта',
      name: 'gotSkills',
      desc: '',
      args: [],
    );
  }

  /// `активная подписка до`
  String get activeSubscribeUntil {
    return Intl.message(
      'активная подписка до',
      name: 'activeSubscribeUntil',
      desc: '',
      args: [],
    );
  }

  /// `Видео-уроки по ОРТ (кырг и русс)`
  String get videoLessonsORT {
    return Intl.message(
      'Видео-уроки по ОРТ (кырг и русс)',
      name: 'videoLessonsORT',
      desc: '',
      args: [],
    );
  }

  /// `Реальные пробные тесты по ОРТ`
  String get realORTTests {
    return Intl.message(
      'Реальные пробные тесты по ОРТ',
      name: 'realORTTests',
      desc: '',
      args: [],
    );
  }

  /// `Рейтинг`
  String get rating {
    return Intl.message('Рейтинг', name: 'rating', desc: '', args: []);
  }

  /// `Новые возможности в ИИ`
  String get newFunctionsAI {
    return Intl.message(
      'Новые возможности в ИИ',
      name: 'newFunctionsAI',
      desc: '',
      args: [],
    );
  }

  /// `Баллы и бонусы`
  String get pointsAndBonuses {
    return Intl.message(
      'Баллы и бонусы',
      name: 'pointsAndBonuses',
      desc: '',
      args: [],
    );
  }

  /// `Соревнования между пользователями`
  String get competitionsBetweenUsers {
    return Intl.message(
      'Соревнования между пользователями',
      name: 'competitionsBetweenUsers',
      desc: '',
      args: [],
    );
  }

  /// `Мы активно работаем над улучшением приложения. Если у вас есть рекомендации по улучшению, то пожалуйста свяжитесь с нами`
  String get weActivelyWorkingToUpgradeOurApp {
    return Intl.message(
      'Мы активно работаем над улучшением приложения. Если у вас есть рекомендации по улучшению, то пожалуйста свяжитесь с нами',
      name: 'weActivelyWorkingToUpgradeOurApp',
      desc: '',
      args: [],
    );
  }

  /// `Что добавить?`
  String get whatAdd {
    return Intl.message('Что добавить?', name: 'whatAdd', desc: '', args: []);
  }

  /// `не в лиге`
  String get notInTheLeague {
    return Intl.message(
      'не в лиге',
      name: 'notInTheLeague',
      desc: '',
      args: [],
    );
  }

  /// `Фио`
  String get bio {
    return Intl.message('Фио', name: 'bio', desc: '', args: []);
  }

  /// `Лига`
  String get league {
    return Intl.message('Лига', name: 'league', desc: '', args: []);
  }

  /// `скидка`
  String get discount {
    return Intl.message('скидка', name: 'discount', desc: '', args: []);
  }

  /// `сом`
  String get som {
    return Intl.message('сом', name: 'som', desc: '', args: []);
  }

  /// `Получите доступ к`
  String get getAccessTo {
    return Intl.message(
      'Получите доступ к',
      name: 'getAccessTo',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка загрузки планов`
  String get errorGetPlans {
    return Intl.message(
      'Ошибка загрузки планов',
      name: 'errorGetPlans',
      desc: '',
      args: [],
    );
  }

  /// `Подробнее на сайте`
  String get moreOnWebsite {
    return Intl.message(
      'Подробнее на сайте',
      name: 'moreOnWebsite',
      desc: '',
      args: [],
    );
  }

  /// `всем тестам для подготовки к ОРТ`
  String get accessToAllTests {
    return Intl.message(
      'всем тестам для подготовки к ОРТ',
      name: 'accessToAllTests',
      desc: '',
      args: [],
    );
  }

  /// `внутренним страницам университетов`
  String get acccessToDetailPageUniversity {
    return Intl.message(
      'внутренним страницам университетов',
      name: 'acccessToDetailPageUniversity',
      desc: '',
      args: [],
    );
  }

  /// `ИИ камере для решения задач`
  String get accessToAIChat {
    return Intl.message(
      'ИИ камере для решения задач',
      name: 'accessToAIChat',
      desc: '',
      args: [],
    );
  }

  /// `Рекомендации:`
  String get recommendations {
    return Intl.message(
      'Рекомендации:',
      name: 'recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Версия`
  String get version {
    return Intl.message('Версия', name: 'version', desc: '', args: []);
  }

  /// `Чтобы продолжить, войдите в аккаунт`
  String get toContinueNeedSignIn {
    return Intl.message(
      'Чтобы продолжить, войдите в аккаунт',
      name: 'toContinueNeedSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Информация доступна только для авторизованных пользователей`
  String get cantGetInfoOnyForAuthedusers {
    return Intl.message(
      'Информация доступна только для авторизованных пользователей',
      name: 'cantGetInfoOnyForAuthedusers',
      desc: '',
      args: [],
    );
  }

  /// `Доступ по подписке`
  String get accessOnlyAfterSubscribe {
    return Intl.message(
      'Доступ по подписке',
      name: 'accessOnlyAfterSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Оформите подписку, чтобы открыть все данные и использовать все функции без ограничений.`
  String get infoAboutSubscribe {
    return Intl.message(
      'Оформите подписку, чтобы открыть все данные и использовать все функции без ограничений.',
      name: 'infoAboutSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `По вашему запросу ничего не найдено`
  String get emptyDataAfterSearch {
    return Intl.message(
      'По вашему запросу ничего не найдено',
      name: 'emptyDataAfterSearch',
      desc: '',
      args: [],
    );
  }

  /// `Вы не прошли ни одного теста`
  String get youArenotPastTest {
    return Intl.message(
      'Вы не прошли ни одного теста',
      name: 'youArenotPastTest',
      desc: '',
      args: [],
    );
  }

  /// `Перейти к тестам`
  String get goToTask {
    return Intl.message(
      'Перейти к тестам',
      name: 'goToTask',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите удалить аккаунт?\n Это действие необратимо и приведет к удалению всех ваших данных`
  String get youReallyWantRemoveAccountWorry {
    return Intl.message(
      'Вы действительно хотите удалить аккаунт?\n Это действие необратимо и приведет к удалению всех ваших данных',
      name: 'youReallyWantRemoveAccountWorry',
      desc: '',
      args: [],
    );
  }

  /// `и подписки`
  String get andSubscribe {
    return Intl.message('и подписки', name: 'andSubscribe', desc: '', args: []);
  }

  /// `Напоминания о занятиях`
  String get notificationTypeDailyStudyReminder {
    return Intl.message(
      'Напоминания о занятиях',
      name: 'notificationTypeDailyStudyReminder',
      desc: '',
      args: [],
    );
  }

  /// `Напоминания пройти тест`
  String get notificationTypeNewQuizAvailable {
    return Intl.message(
      'Напоминания пройти тест',
      name: 'notificationTypeNewQuizAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Новый университет`
  String get notificationTypeNewUniversityAdded {
    return Intl.message(
      'Новый университет',
      name: 'notificationTypeNewUniversityAdded',
      desc: '',
      args: [],
    );
  }

  /// `Открыт прием в университет`
  String get notificationTypeUniversityAdmissionOpen {
    return Intl.message(
      'Открыт прием в университет',
      name: 'notificationTypeUniversityAdmissionOpen',
      desc: '',
      args: [],
    );
  }

  /// `Обновлена информация об университете`
  String get notificationTypeUniversityInfoUpdated {
    return Intl.message(
      'Обновлена информация об университете',
      name: 'notificationTypeUniversityInfoUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Истечение подписки`
  String get notificationTypeSubscriptionExpiring {
    return Intl.message(
      'Истечение подписки',
      name: 'notificationTypeSubscriptionExpiring',
      desc: '',
      args: [],
    );
  }

  /// `Место в рейтинге`
  String get notificationTypeLeaderboardTopAchievement {
    return Intl.message(
      'Место в рейтинге',
      name: 'notificationTypeLeaderboardTopAchievement',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестно`
  String get notificationTypeUnknown {
    return Intl.message(
      'Неизвестно',
      name: 'notificationTypeUnknown',
      desc: '',
      args: [],
    );
  }

  /// `История чатов`
  String get historyChats {
    return Intl.message(
      'История чатов',
      name: 'historyChats',
      desc: '',
      args: [],
    );
  }

  /// `Видео уроки отсутствуют`
  String get noVideos {
    return Intl.message(
      'Видео уроки отсутствуют',
      name: 'noVideos',
      desc: '',
      args: [],
    );
  }

  /// `Время`
  String get time {
    return Intl.message('Время', name: 'time', desc: '', args: []);
  }

  /// `Кол-во заданий`
  String get countOfTasks {
    return Intl.message(
      'Кол-во заданий',
      name: 'countOfTasks',
      desc: '',
      args: [],
    );
  }

  /// `А КОЛОНКАСЫ`
  String get aColumn {
    return Intl.message('А КОЛОНКАСЫ', name: 'aColumn', desc: '', args: []);
  }

  /// `Б КОЛОНКАСЫ`
  String get bColumn {
    return Intl.message('Б КОЛОНКАСЫ', name: 'bColumn', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
