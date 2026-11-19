// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Enterprise App';

  @override
  String get loginTitle => 'Welcome back';

  @override
  String get loginSubtitle => 'Sign in to access your workspace';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get organizationLabel => 'Organization';

  @override
  String get signIn => 'Sign in';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get registerCompany => 'Register new company';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardSubtitle => 'General overview of Acme Corporation';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get tenantLabel => 'Organization';

  @override
  String get tenantHint => 'Organization UUID';

  @override
  String get brandHeadline => 'Built to operate at the level of your ambition.';

  @override
  String get brandSubtitle =>
      'Enterprise-grade data depth with an experience that feels inevitable.';

  @override
  String get statParties => 'Parties';

  @override
  String get statUptime => 'Uptime';

  @override
  String get twoFactorTitle => 'Two-factor verification';

  @override
  String get twoFactorSubtitle =>
      'Enter the 6-digit code from your authenticator app';

  @override
  String get codeLabel => 'Verification code';

  @override
  String get verify => 'Verify';

  @override
  String get backToLogin => 'Back to sign in';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';
}
