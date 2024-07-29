/// Generated file. Do not edit.
///
/// Original: assets/translations
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 128 (64 per locale)
///
/// Built on 2024-07-28 at 13:02 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ar(languageCode: 'ar', build: _TranslationsAr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of tr).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = tr.someKey.anotherKey;
/// String b = tr['someKey.anotherKey']; // Only for edge cases!
Translations get tr => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final tr = Translations.of(context); // Get tr variable.
/// String a = tr.someKey.anotherKey; // Use tr variable.
/// String b = tr['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.tr.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get tr => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final tr = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get notifications => 'Notifications';
	String get noNotifications => 'No notifications';
	String get attendance => 'Attendance';
	String get pleaseComeBackLater => 'Please come back later .';
	String get youHaveNoNotificationsYet => 'You have no notifications yet.';
	String get summary => 'Summary';
	String get confirm => 'Confirm';
	String get home => 'Home';
	String get searchCountry => 'Search country';
	String get checkInAndGetStartedOnYourSuccessfulDay => 'Check in and get started on your successful day';
	String get office => 'Office';
	String get checkIn => 'Check In';
	String get serverURL => 'Server URL';
	String get scanQR => 'Scan QR';
	String get login => 'Login';
	String get scanQRCodeFromYourControlPanelToGetTheServerLink => 'Scan QR code from your control panel to get the server link';
	String get password => 'Password';
	String get search => 'Search';
	String get yourCity => 'Your City';
	String get email => 'Email';
	String get yourName => 'Your Name';
	String get newPass => 'New Password';
	String get repassword => 'Re-Password';
	String get phoneNumber => 'Phone Number';
	String get enterYourInformationToOpenYourAccount => 'Enter your information to open your account';
	String get close => 'Close';
	String get noInternet => 'No internet connection';
	String get errorInServer => 'Error in server';
	String get returnToHome => 'Return to home';
	String get pleaseWaitForProcessing => 'Please wait for processing';
	String get enter_your_phone_number => 'Enter your phone number';
	String get errorInServerDescription => 'There is an error in the server, please try again later.';
	String get checkInternetConnection => 'Please check your internet connection and try again.';
	late final _TranslationsInternetEn internet = _TranslationsInternetEn._(_root);
	late final _TranslationsGlobalsEn globals = _TranslationsGlobalsEn._(_root);
	late final _TranslationsValidationEn validation = _TranslationsValidationEn._(_root);
}

// Path: internet
class _TranslationsInternetEn {
	_TranslationsInternetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get connected => 'You are online now.';
	String get disconnected => 'Your internet connection has been lost.';
	String get weak => 'Your internet connection is unstable';
}

// Path: globals
class _TranslationsGlobalsEn {
	_TranslationsGlobalsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancel';
	String get clear => 'Clear';
	String get delete => 'Delete';
	String get enter => 'Enter ';
	String get gallery => 'Gallery';
	String get next => 'Next';
	String get search => 'Search';
	String get searchHere => 'Search here ';
	String get seeMore => 'See more';
	String get selected => 'Select ';
	String get skip => 'Skip';
	String get tryAgain => 'Try Again';
	String get uploadHere => 'Upload here ';
	String get view_more => 'View more';
}

// Path: validation
class _TranslationsValidationEn {
	_TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get ThePasswordMustContainAtLeastOneLowercaseLetter => 'The password must contain at least one lowercase letter';
	String get ThePasswordMustContainAtLeastOneUppercaseLetter => 'The password must contain at least one uppercase letter';
	String get atLeast2Words => 'at least 2 words';
	String get charactersLong => 'The password must be at least 8 characters long';
	String get emailIsRequired => 'Email is required';
	String get invalidEmailFormat => 'Invalid email format';
	String get invalidField => 'Invalid field';
	String get passwordNotMatch => 'Password Not Match';
	String get phoneIsRequired => 'Phone is required';
	String get pleaseCompleteAllFields => 'Please complete all fields';
	String get youForgetThisField => 'You forget this field !';
	String get youForgetEmail => 'You forget email';
	String get linkIsRequired => 'Link is required';
	String get invalidLinkFormat => 'Invalid link format';
}

// Path: <root>
class _TranslationsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsAr _root = this; // ignore: unused_field

	// Translations
	@override String get notifications => 'الاشعارات';
	@override String get noNotifications => 'لا توجد اشعارات';
	@override String get youHaveNoNotificationsYet => 'ليس لديك اي اشعارات بعد';
	@override String get attendance => 'حضور';
	@override String get summary => 'ملخص';
	@override String get confirm => 'تأكيد';
	@override String get home => 'المنزل';
	@override String get close => 'اغلاق';
	@override String get office => 'المكتب';
	@override String get checkIn => 'تسجيل الدخول';
	@override String get checkInAndGetStartedOnYourSuccessfulDay => 'سجل الدخول وابدأ يومك الناجح';
	@override String get login => 'تسجيل الدخول';
	@override String get enterYourInformationToOpenYourAccount => 'أدخل معلوماتك لفتح حسابك';
	@override String get noInternet => 'لا يوجد اتصال بالإنترنت';
	@override String get phoneNumber => 'رقم الهاتف';
	@override String get searchCountry => 'ابحث عن البلد';
	@override String get yourCity => 'مدينتك';
	@override String get yourName => 'اسمك';
	@override String get newPass => 'كلمة السر الجديدة';
	@override String get repassword => 'اعد كلمة السر';
	@override String get serverURL => 'عنوان URL للخادم';
	@override String get scanQR => 'مسح الكود';
	@override String get search => 'بحث';
	@override String get scanQRCodeFromYourControlPanelToGetTheServerLink => 'قم بمسح رمز الاستجابه السريع من لوحه التحكم للحصول على رابط الخادم';
	@override String get checkInternetConnection => 'تحقق من اتصالك بالإنترنت';
	@override String get errorInServer => 'خطأ في الخادم';
	@override String get password => 'كلمه السر';
	@override String get email => 'البريد الإلكتروني';
	@override String get errorInServerDescription => 'حدث خطأ في الخادم، يرجى المحاولة مرة أخرى';
	@override String get returnToHome => 'العودة للصفحة الرئيسية';
	@override String get enter_your_phone_number => 'ادخل رقم هاتفك';
	@override String get pleaseWaitForProcessing => 'يرجى الانتظار لحين الانتهاء من المعالجة';
	@override String get pleaseComeBackLater => 'يرجى العودة لاحقا';
	@override late final _TranslationsInternetAr internet = _TranslationsInternetAr._(_root);
	@override late final _TranslationsGlobalsAr globals = _TranslationsGlobalsAr._(_root);
	@override late final _TranslationsValidationAr validation = _TranslationsValidationAr._(_root);
}

// Path: internet
class _TranslationsInternetAr implements _TranslationsInternetEn {
	_TranslationsInternetAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get connected => 'تم اعادة الاتصال';
	@override String get disconnected => 'تم فقد اتصالك بالإنترنت.';
	@override String get weak => 'اتصالك بالإنترنت غير مستقر.';
}

// Path: globals
class _TranslationsGlobalsAr implements _TranslationsGlobalsEn {
	_TranslationsGlobalsAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'إلغاء';
	@override String get clear => 'حذف';
	@override String get delete => 'حذف';
	@override String get enter => ' ادخل';
	@override String get gallery => ' معرض الصور';
	@override String get next => 'التالي';
	@override String get search => 'أبحث';
	@override String get searchHere => ' ابحث هنا';
	@override String get seeMore => 'شاهد المزيد';
	@override String get selected => ' حدد';
	@override String get skip => 'تخطي';
	@override String get tryAgain => 'حاول مرة اخرى';
	@override String get uploadHere => ' ارفع هنا';
	@override String get view_more => 'عرض المزيد';
}

// Path: validation
class _TranslationsValidationAr implements _TranslationsValidationEn {
	_TranslationsValidationAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get ThePasswordMustContainAtLeastOneLowercaseLetter => 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
	@override String get ThePasswordMustContainAtLeastOneUppercaseLetter => 'يجب أن تحتوي كلمة المرور على حرف واحد كبير على الأقل';
	@override String get atLeast2Words => 'كلمتين على الأقل';
	@override String get charactersLong => 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';
	@override String get emailIsRequired => 'البريد الإلكتروني مطلوب';
	@override String get invalidEmailFormat => 'تنسيق البريد الإلكتروني غير صالح';
	@override String get invalidField => 'حقل غير صالح';
	@override String get passwordNotMatch => 'كلمه السر غير متطابقه ';
	@override String get phoneIsRequired => 'رقم الهاتف مطلوب';
	@override String get pleaseCompleteAllFields => 'برجاء اكمال جميع الحقول';
	@override String get youForgetThisField => '!نسيت هذا الحقل';
	@override String get youForgetEmail => '!نسيت البريد الإلكتروني';
	@override String get linkIsRequired => 'الرابط مطلوب';
	@override String get invalidLinkFormat => 'تنسيق الرابط غير صالح';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'notifications': return 'Notifications';
			case 'noNotifications': return 'No notifications';
			case 'attendance': return 'Attendance';
			case 'pleaseComeBackLater': return 'Please come back later .';
			case 'youHaveNoNotificationsYet': return 'You have no notifications yet.';
			case 'summary': return 'Summary';
			case 'confirm': return 'Confirm';
			case 'home': return 'Home';
			case 'searchCountry': return 'Search country';
			case 'checkInAndGetStartedOnYourSuccessfulDay': return 'Check in and get started on your successful day';
			case 'office': return 'Office';
			case 'checkIn': return 'Check In';
			case 'serverURL': return 'Server URL';
			case 'scanQR': return 'Scan QR';
			case 'login': return 'Login';
			case 'scanQRCodeFromYourControlPanelToGetTheServerLink': return 'Scan QR code from your control panel to get the server link';
			case 'password': return 'Password';
			case 'search': return 'Search';
			case 'yourCity': return 'Your City';
			case 'email': return 'Email';
			case 'yourName': return 'Your Name';
			case 'newPass': return 'New Password';
			case 'repassword': return 'Re-Password';
			case 'phoneNumber': return 'Phone Number';
			case 'enterYourInformationToOpenYourAccount': return 'Enter your information to open your account';
			case 'close': return 'Close';
			case 'noInternet': return 'No internet connection';
			case 'errorInServer': return 'Error in server';
			case 'returnToHome': return 'Return to home';
			case 'pleaseWaitForProcessing': return 'Please wait for processing';
			case 'enter_your_phone_number': return 'Enter your phone number';
			case 'errorInServerDescription': return 'There is an error in the server, please try again later.';
			case 'checkInternetConnection': return 'Please check your internet connection and try again.';
			case 'internet.connected': return 'You are online now.';
			case 'internet.disconnected': return 'Your internet connection has been lost.';
			case 'internet.weak': return 'Your internet connection is unstable';
			case 'globals.cancel': return 'Cancel';
			case 'globals.clear': return 'Clear';
			case 'globals.delete': return 'Delete';
			case 'globals.enter': return 'Enter ';
			case 'globals.gallery': return 'Gallery';
			case 'globals.next': return 'Next';
			case 'globals.search': return 'Search';
			case 'globals.searchHere': return 'Search here ';
			case 'globals.seeMore': return 'See more';
			case 'globals.selected': return 'Select ';
			case 'globals.skip': return 'Skip';
			case 'globals.tryAgain': return 'Try Again';
			case 'globals.uploadHere': return 'Upload here ';
			case 'globals.view_more': return 'View more';
			case 'validation.ThePasswordMustContainAtLeastOneLowercaseLetter': return 'The password must contain at least one lowercase letter';
			case 'validation.ThePasswordMustContainAtLeastOneUppercaseLetter': return 'The password must contain at least one uppercase letter';
			case 'validation.atLeast2Words': return 'at least 2 words';
			case 'validation.charactersLong': return 'The password must be at least 8 characters long';
			case 'validation.emailIsRequired': return 'Email is required';
			case 'validation.invalidEmailFormat': return 'Invalid email format';
			case 'validation.invalidField': return 'Invalid field';
			case 'validation.passwordNotMatch': return 'Password Not Match';
			case 'validation.phoneIsRequired': return 'Phone is required';
			case 'validation.pleaseCompleteAllFields': return 'Please complete all fields';
			case 'validation.youForgetThisField': return 'You forget this field !';
			case 'validation.youForgetEmail': return 'You forget email';
			case 'validation.linkIsRequired': return 'Link is required';
			case 'validation.invalidLinkFormat': return 'Invalid link format';
			default: return null;
		}
	}
}

extension on _TranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'notifications': return 'الاشعارات';
			case 'noNotifications': return 'لا توجد اشعارات';
			case 'youHaveNoNotificationsYet': return 'ليس لديك اي اشعارات بعد';
			case 'attendance': return 'حضور';
			case 'summary': return 'ملخص';
			case 'confirm': return 'تأكيد';
			case 'home': return 'المنزل';
			case 'close': return 'اغلاق';
			case 'office': return 'المكتب';
			case 'checkIn': return 'تسجيل الدخول';
			case 'checkInAndGetStartedOnYourSuccessfulDay': return 'سجل الدخول وابدأ يومك الناجح';
			case 'login': return 'تسجيل الدخول';
			case 'enterYourInformationToOpenYourAccount': return 'أدخل معلوماتك لفتح حسابك';
			case 'noInternet': return 'لا يوجد اتصال بالإنترنت';
			case 'phoneNumber': return 'رقم الهاتف';
			case 'searchCountry': return 'ابحث عن البلد';
			case 'yourCity': return 'مدينتك';
			case 'yourName': return 'اسمك';
			case 'newPass': return 'كلمة السر الجديدة';
			case 'repassword': return 'اعد كلمة السر';
			case 'serverURL': return 'عنوان URL للخادم';
			case 'scanQR': return 'مسح الكود';
			case 'search': return 'بحث';
			case 'scanQRCodeFromYourControlPanelToGetTheServerLink': return 'قم بمسح رمز الاستجابه السريع من لوحه التحكم للحصول على رابط الخادم';
			case 'checkInternetConnection': return 'تحقق من اتصالك بالإنترنت';
			case 'errorInServer': return 'خطأ في الخادم';
			case 'password': return 'كلمه السر';
			case 'email': return 'البريد الإلكتروني';
			case 'errorInServerDescription': return 'حدث خطأ في الخادم، يرجى المحاولة مرة أخرى';
			case 'returnToHome': return 'العودة للصفحة الرئيسية';
			case 'enter_your_phone_number': return 'ادخل رقم هاتفك';
			case 'pleaseWaitForProcessing': return 'يرجى الانتظار لحين الانتهاء من المعالجة';
			case 'pleaseComeBackLater': return 'يرجى العودة لاحقا';
			case 'internet.connected': return 'تم اعادة الاتصال';
			case 'internet.disconnected': return 'تم فقد اتصالك بالإنترنت.';
			case 'internet.weak': return 'اتصالك بالإنترنت غير مستقر.';
			case 'globals.cancel': return 'إلغاء';
			case 'globals.clear': return 'حذف';
			case 'globals.delete': return 'حذف';
			case 'globals.enter': return ' ادخل';
			case 'globals.gallery': return ' معرض الصور';
			case 'globals.next': return 'التالي';
			case 'globals.search': return 'أبحث';
			case 'globals.searchHere': return ' ابحث هنا';
			case 'globals.seeMore': return 'شاهد المزيد';
			case 'globals.selected': return ' حدد';
			case 'globals.skip': return 'تخطي';
			case 'globals.tryAgain': return 'حاول مرة اخرى';
			case 'globals.uploadHere': return ' ارفع هنا';
			case 'globals.view_more': return 'عرض المزيد';
			case 'validation.ThePasswordMustContainAtLeastOneLowercaseLetter': return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
			case 'validation.ThePasswordMustContainAtLeastOneUppercaseLetter': return 'يجب أن تحتوي كلمة المرور على حرف واحد كبير على الأقل';
			case 'validation.atLeast2Words': return 'كلمتين على الأقل';
			case 'validation.charactersLong': return 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';
			case 'validation.emailIsRequired': return 'البريد الإلكتروني مطلوب';
			case 'validation.invalidEmailFormat': return 'تنسيق البريد الإلكتروني غير صالح';
			case 'validation.invalidField': return 'حقل غير صالح';
			case 'validation.passwordNotMatch': return 'كلمه السر غير متطابقه ';
			case 'validation.phoneIsRequired': return 'رقم الهاتف مطلوب';
			case 'validation.pleaseCompleteAllFields': return 'برجاء اكمال جميع الحقول';
			case 'validation.youForgetThisField': return '!نسيت هذا الحقل';
			case 'validation.youForgetEmail': return '!نسيت البريد الإلكتروني';
			case 'validation.linkIsRequired': return 'الرابط مطلوب';
			case 'validation.invalidLinkFormat': return 'تنسيق الرابط غير صالح';
			default: return null;
		}
	}
}
