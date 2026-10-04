// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get homepage => 'الصفحة الرئيسية';

  @override
  String get somethingWentWrong => 'حدث خطأ اثناء البحث';

  @override
  String get errorText =>
      'يبدو أن هذه الصفحة قد تم نقلها أو أنها غير متوفرة في الوقت الحالي، يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get loading => 'جارى التحميل ...';
}
