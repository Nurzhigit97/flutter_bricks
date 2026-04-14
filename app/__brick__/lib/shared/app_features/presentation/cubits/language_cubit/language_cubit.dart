import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{packageName}}/core/services/storage/local_storage.dart';
import 'package:{{packageName}}/core/utils/constants/app_const/app_const.dart';

class LanguageCubit extends Cubit<Locale> {
  final LocalStorage prefsService;
  LanguageCubit(this.prefsService) : super(const Locale('ru')) {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final langCode = prefsService.getString(AppConst.language);
    emit(Locale(langCode ?? 'ru'));
  }

  Future<void> changeLanguage(
    String languageCode, {
    Function? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      await prefsService.setString(AppConst.language, languageCode);
      emit(Locale(languageCode));
      onSuccess?.call();
    } catch (e) {
      onError?.call(e.toString());
    }
  }
}
