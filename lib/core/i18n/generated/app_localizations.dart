import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Enterprise App'**
  String get appTitle;

  /// Login screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginTitle;

  /// Login screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Sign in to access your workspace'**
  String get loginSubtitle;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Tenant selector label
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get organizationLabel;

  /// Primary login button
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// Password recovery link
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPassword;

  /// Onboarding link
  ///
  /// In en, this message translates to:
  /// **'Register new company'**
  String get registerCompany;

  /// Dashboard screen title
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// Dashboard screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Acme Corporation overview'**
  String get dashboardSubtitle;

  /// Placeholder note
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @tenantLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get tenantLabel;

  /// No description provided for @tenantHint.
  ///
  /// In en, this message translates to:
  /// **'Organization UUID'**
  String get tenantHint;

  /// No description provided for @brandHeadline.
  ///
  /// In en, this message translates to:
  /// **'Built to operate at the level of your ambition.'**
  String get brandHeadline;

  /// No description provided for @brandSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enterprise-grade data depth with an experience that feels inevitable.'**
  String get brandSubtitle;

  /// No description provided for @statParties.
  ///
  /// In en, this message translates to:
  /// **'Parties'**
  String get statParties;

  /// No description provided for @statUptime.
  ///
  /// In en, this message translates to:
  /// **'Uptime'**
  String get statUptime;

  /// No description provided for @twoFactorTitle.
  ///
  /// In en, this message translates to:
  /// **'Two-factor verification'**
  String get twoFactorTitle;

  /// No description provided for @twoFactorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code from your authenticator app'**
  String get twoFactorSubtitle;

  /// No description provided for @codeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get codeLabel;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to sign in'**
  String get backToLogin;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results for \"{query}\"'**
  String noResults(String query);

  /// No description provided for @underConstruction.
  ///
  /// In en, this message translates to:
  /// **'Section under construction'**
  String get underConstruction;

  /// No description provided for @searchMenu.
  ///
  /// In en, this message translates to:
  /// **'Search…'**
  String get searchMenu;

  /// No description provided for @menuOffline.
  ///
  /// In en, this message translates to:
  /// **'Menu offline'**
  String get menuOffline;

  /// No description provided for @expandMenu.
  ///
  /// In en, this message translates to:
  /// **'Expand menu'**
  String get expandMenu;

  /// No description provided for @collapseMenu.
  ///
  /// In en, this message translates to:
  /// **'Collapse menu'**
  String get collapseMenu;

  /// No description provided for @askAi.
  ///
  /// In en, this message translates to:
  /// **'Ask AI'**
  String get askAi;

  /// No description provided for @askAiSoon.
  ///
  /// In en, this message translates to:
  /// **'Ask AI — coming soon'**
  String get askAiSoon;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navParty.
  ///
  /// In en, this message translates to:
  /// **'Party'**
  String get navParty;

  /// No description provided for @navTeam.
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get navTeam;

  /// No description provided for @navAreas.
  ///
  /// In en, this message translates to:
  /// **'Areas'**
  String get navAreas;

  /// No description provided for @navMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get navMenu;

  /// No description provided for @partiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Parties'**
  String get partiesTitle;

  /// No description provided for @partiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'People and organizations of Acme Corporation'**
  String get partiesSubtitle;

  /// No description provided for @partiesSearch.
  ///
  /// In en, this message translates to:
  /// **'Search parties…'**
  String get partiesSearch;

  /// No description provided for @newParty.
  ///
  /// In en, this message translates to:
  /// **'New Party'**
  String get newParty;

  /// No description provided for @mergeParties.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get mergeParties;

  /// No description provided for @colName.
  ///
  /// In en, this message translates to:
  /// **'NAME'**
  String get colName;

  /// No description provided for @colType.
  ///
  /// In en, this message translates to:
  /// **'TYPE'**
  String get colType;

  /// No description provided for @colProfile.
  ///
  /// In en, this message translates to:
  /// **'PROFILE'**
  String get colProfile;

  /// No description provided for @colStatus.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get colStatus;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @statusInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get statusInactive;

  /// No description provided for @statusMerged.
  ///
  /// In en, this message translates to:
  /// **'Merged'**
  String get statusMerged;

  /// No description provided for @partiesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No parties yet'**
  String get partiesEmpty;

  /// No description provided for @partiesError.
  ///
  /// In en, this message translates to:
  /// **'Could not load parties'**
  String get partiesError;

  /// No description provided for @mergeTitle.
  ///
  /// In en, this message translates to:
  /// **'Merge Parties (Golden Record)'**
  String get mergeTitle;

  /// No description provided for @mergeInstruction.
  ///
  /// In en, this message translates to:
  /// **'Select the two Parties to merge. The first will be the main record (Target) and the second will be absorbed (Source).'**
  String get mergeInstruction;

  /// No description provided for @mergeTarget.
  ///
  /// In en, this message translates to:
  /// **'Party Target (kept)'**
  String get mergeTarget;

  /// No description provided for @mergeSource.
  ///
  /// In en, this message translates to:
  /// **'Party Source (merged)'**
  String get mergeSource;

  /// No description provided for @mergeWarning.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible from the UI. The Source record will be marked as MERGED.'**
  String get mergeWarning;

  /// No description provided for @partyCreated.
  ///
  /// In en, this message translates to:
  /// **'Party created successfully'**
  String get partyCreated;

  /// No description provided for @partyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Party updated successfully'**
  String get partyUpdated;

  /// No description provided for @partyDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Party Detail'**
  String get partyDetailTitle;

  /// No description provided for @editParty.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editParty;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @tabContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get tabContacts;

  /// No description provided for @tabAddresses.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get tabAddresses;

  /// No description provided for @tabNames.
  ///
  /// In en, this message translates to:
  /// **'Names'**
  String get tabNames;

  /// No description provided for @primary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get primary;

  /// No description provided for @nationalities.
  ///
  /// In en, this message translates to:
  /// **'Nationalities'**
  String get nationalities;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @noContacts.
  ///
  /// In en, this message translates to:
  /// **'No contacts registered'**
  String get noContacts;

  /// No description provided for @noAddresses.
  ///
  /// In en, this message translates to:
  /// **'No addresses registered'**
  String get noAddresses;

  /// No description provided for @noNames.
  ///
  /// In en, this message translates to:
  /// **'No historical names'**
  String get noNames;

  /// No description provided for @editPartyTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Party'**
  String get editPartyTitle;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get displayName;

  /// No description provided for @typeNotEditable.
  ///
  /// In en, this message translates to:
  /// **'Type (read-only)'**
  String get typeNotEditable;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @middleName.
  ///
  /// In en, this message translates to:
  /// **'Middle name'**
  String get middleName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @secondLastName.
  ///
  /// In en, this message translates to:
  /// **'Second last name'**
  String get secondLastName;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get birthDate;

  /// No description provided for @legalName.
  ///
  /// In en, this message translates to:
  /// **'Legal name'**
  String get legalName;

  /// No description provided for @tradeName.
  ///
  /// In en, this message translates to:
  /// **'Trade name'**
  String get tradeName;

  /// No description provided for @taxId.
  ///
  /// In en, this message translates to:
  /// **'Tax ID'**
  String get taxId;

  /// No description provided for @partyTypeIndividual.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get partyTypeIndividual;

  /// No description provided for @partyTypeOrganization.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get partyTypeOrganization;

  /// No description provided for @partyType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get partyType;

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusLabel;

  /// No description provided for @createdAt.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get createdAt;

  /// No description provided for @idLabel.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get idLabel;

  /// No description provided for @employeesTitle.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employeesTitle;

  /// No description provided for @employeesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Acme Corporation team'**
  String get employeesSubtitle;

  /// No description provided for @employeesSearch.
  ///
  /// In en, this message translates to:
  /// **'Search employees…'**
  String get employeesSearch;

  /// No description provided for @newEmployee.
  ///
  /// In en, this message translates to:
  /// **'New Employee'**
  String get newEmployee;

  /// No description provided for @colEmployee.
  ///
  /// In en, this message translates to:
  /// **'EMPLOYEE'**
  String get colEmployee;

  /// No description provided for @colCode.
  ///
  /// In en, this message translates to:
  /// **'CODE'**
  String get colCode;

  /// No description provided for @colJob.
  ///
  /// In en, this message translates to:
  /// **'JOB TITLE'**
  String get colJob;

  /// No description provided for @colDepartment.
  ///
  /// In en, this message translates to:
  /// **'DEPARTMENT'**
  String get colDepartment;

  /// No description provided for @statusOnLeave.
  ///
  /// In en, this message translates to:
  /// **'On leave'**
  String get statusOnLeave;

  /// No description provided for @statusTerminated.
  ///
  /// In en, this message translates to:
  /// **'Terminated'**
  String get statusTerminated;

  /// No description provided for @employeesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No employees yet'**
  String get employeesEmpty;

  /// No description provided for @employeesEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Create the first one with \"New Employee\"'**
  String get employeesEmptyHint;

  /// No description provided for @employeesError.
  ///
  /// In en, this message translates to:
  /// **'Could not load employees'**
  String get employeesError;

  /// No description provided for @selectPerson.
  ///
  /// In en, this message translates to:
  /// **'Select a person'**
  String get selectPerson;

  /// No description provided for @selectJob.
  ///
  /// In en, this message translates to:
  /// **'Select a job title'**
  String get selectJob;

  /// No description provided for @selectDepartment.
  ///
  /// In en, this message translates to:
  /// **'Select a department'**
  String get selectDepartment;

  /// No description provided for @employeeCode.
  ///
  /// In en, this message translates to:
  /// **'Employee code'**
  String get employeeCode;

  /// No description provided for @jobTitle.
  ///
  /// In en, this message translates to:
  /// **'Job title'**
  String get jobTitle;

  /// No description provided for @departmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get departmentLabel;

  /// No description provided for @hireDate.
  ///
  /// In en, this message translates to:
  /// **'Hire date'**
  String get hireDate;

  /// No description provided for @employeeCreated.
  ///
  /// In en, this message translates to:
  /// **'Employee created successfully'**
  String get employeeCreated;

  /// No description provided for @catalogsError.
  ///
  /// In en, this message translates to:
  /// **'Could not load catalogs'**
  String get catalogsError;

  /// No description provided for @departmentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Departments'**
  String get departmentsTitle;

  /// No description provided for @departmentsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Acme Corporation org structure'**
  String get departmentsSubtitle;

  /// No description provided for @hierarchy.
  ///
  /// In en, this message translates to:
  /// **'Hierarchy'**
  String get hierarchy;

  /// No description provided for @corporateGroups.
  ///
  /// In en, this message translates to:
  /// **'Corporate groups'**
  String get corporateGroups;

  /// No description provided for @newDepartment.
  ///
  /// In en, this message translates to:
  /// **'New Department'**
  String get newDepartment;

  /// No description provided for @newGroup.
  ///
  /// In en, this message translates to:
  /// **'New Group'**
  String get newGroup;

  /// No description provided for @departmentsError.
  ///
  /// In en, this message translates to:
  /// **'Could not load departments'**
  String get departmentsError;

  /// No description provided for @groupsError.
  ///
  /// In en, this message translates to:
  /// **'Could not load corporate groups'**
  String get groupsError;

  /// No description provided for @departmentsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No departments yet'**
  String get departmentsEmpty;

  /// No description provided for @groupsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No corporate groups yet'**
  String get groupsEmpty;

  /// No description provided for @createFirstDepartment.
  ///
  /// In en, this message translates to:
  /// **'Create the first one with \"New Department\"'**
  String get createFirstDepartment;

  /// No description provided for @createFirstGroup.
  ///
  /// In en, this message translates to:
  /// **'Create the first one with \"New Group\"'**
  String get createFirstGroup;

  /// No description provided for @assignDepartment.
  ///
  /// In en, this message translates to:
  /// **'Assign department'**
  String get assignDepartment;

  /// No description provided for @noAssignments.
  ///
  /// In en, this message translates to:
  /// **'No departments assigned in this session'**
  String get noAssignments;

  /// No description provided for @newSubDepartment.
  ///
  /// In en, this message translates to:
  /// **'New sub-department'**
  String get newSubDepartment;

  /// No description provided for @unitType.
  ///
  /// In en, this message translates to:
  /// **'Unit type'**
  String get unitType;

  /// No description provided for @parentDepartmentOptional.
  ///
  /// In en, this message translates to:
  /// **'Parent department (optional)'**
  String get parentDepartmentOptional;

  /// No description provided for @managerOptional.
  ///
  /// In en, this message translates to:
  /// **'Manager (optional)'**
  String get managerOptional;

  /// No description provided for @noParent.
  ///
  /// In en, this message translates to:
  /// **'— No parent (root) —'**
  String get noParent;

  /// No description provided for @noManager.
  ///
  /// In en, this message translates to:
  /// **'— No manager —'**
  String get noManager;

  /// No description provided for @newGroupTitle.
  ///
  /// In en, this message translates to:
  /// **'New Corporate Group'**
  String get newGroupTitle;

  /// No description provided for @descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get descriptionOptional;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @departmentCreated.
  ///
  /// In en, this message translates to:
  /// **'Department created successfully'**
  String get departmentCreated;

  /// No description provided for @groupCreated.
  ///
  /// In en, this message translates to:
  /// **'Corporate group created'**
  String get groupCreated;

  /// No description provided for @assignedToGroup.
  ///
  /// In en, this message translates to:
  /// **'Department assigned to group'**
  String get assignedToGroup;

  /// No description provided for @relationshipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Corporate Relationships'**
  String get relationshipsTitle;

  /// No description provided for @relationshipsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Holding-subsidiary structure of your tenants'**
  String get relationshipsSubtitle;

  /// No description provided for @newRelationship.
  ///
  /// In en, this message translates to:
  /// **'New Relationship'**
  String get newRelationship;

  /// No description provided for @colHolding.
  ///
  /// In en, this message translates to:
  /// **'HOLDING'**
  String get colHolding;

  /// No description provided for @colSubsidiary.
  ///
  /// In en, this message translates to:
  /// **'SUBSIDIARY'**
  String get colSubsidiary;

  /// No description provided for @colDate.
  ///
  /// In en, this message translates to:
  /// **'DATE'**
  String get colDate;

  /// No description provided for @relationshipsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No corporate relationships yet'**
  String get relationshipsEmpty;

  /// No description provided for @relationshipsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Start the first one with \"New Relationship\"'**
  String get relationshipsEmptyHint;

  /// No description provided for @relationshipsError.
  ///
  /// In en, this message translates to:
  /// **'Could not load relationships'**
  String get relationshipsError;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get statusApproved;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @statusRevoked.
  ///
  /// In en, this message translates to:
  /// **'Revoked'**
  String get statusRevoked;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @statusUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get statusUnknown;

  /// No description provided for @emitToken.
  ///
  /// In en, this message translates to:
  /// **'Emit token'**
  String get emitToken;

  /// No description provided for @consumeToken.
  ///
  /// In en, this message translates to:
  /// **'Consume token'**
  String get consumeToken;

  /// No description provided for @rejectAction.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get rejectAction;

  /// No description provided for @revokeAction.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get revokeAction;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @newRelationshipHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the holding tenant identifier to start the relationship.'**
  String get newRelationshipHint;

  /// No description provided for @holdingTenantId.
  ///
  /// In en, this message translates to:
  /// **'Holding Tenant ID'**
  String get holdingTenantId;

  /// No description provided for @initiateAction.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get initiateAction;

  /// No description provided for @relationshipStarted.
  ///
  /// In en, this message translates to:
  /// **'Relationship started'**
  String get relationshipStarted;

  /// No description provided for @tokenTitle.
  ///
  /// In en, this message translates to:
  /// **'Invitation token'**
  String get tokenTitle;

  /// No description provided for @tokenWarning.
  ///
  /// In en, this message translates to:
  /// **'Share this token with the subsidiary so it can consume the relationship. It may expire.'**
  String get tokenWarning;

  /// No description provided for @copyToken.
  ///
  /// In en, this message translates to:
  /// **'Copy token'**
  String get copyToken;

  /// No description provided for @tokenCopied.
  ///
  /// In en, this message translates to:
  /// **'Token copied'**
  String get tokenCopied;

  /// No description provided for @expiresAt.
  ///
  /// In en, this message translates to:
  /// **'Expires: {date}'**
  String expiresAt(String date);

  /// No description provided for @consumeTokenHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the invitation token received from the holding.'**
  String get consumeTokenHint;

  /// No description provided for @consumeAction.
  ///
  /// In en, this message translates to:
  /// **'Consume'**
  String get consumeAction;

  /// No description provided for @relationshipApproved.
  ///
  /// In en, this message translates to:
  /// **'Relationship approved'**
  String get relationshipApproved;

  /// No description provided for @rejectTitle.
  ///
  /// In en, this message translates to:
  /// **'Reject relationship'**
  String get rejectTitle;

  /// No description provided for @revokeTitle.
  ///
  /// In en, this message translates to:
  /// **'Revoke relationship'**
  String get revokeTitle;

  /// No description provided for @cancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel relationship'**
  String get cancelTitle;

  /// No description provided for @reasonOptional.
  ///
  /// In en, this message translates to:
  /// **'Reason (optional)'**
  String get reasonOptional;

  /// No description provided for @reasonHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the reason'**
  String get reasonHint;

  /// No description provided for @irreversibleUI.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone from the UI.'**
  String get irreversibleUI;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Security and account access'**
  String get settingsSubtitle;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @appearanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Theme and language are saved to your account.'**
  String get appearanceDesc;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @securityTitle.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication (2FA)'**
  String get securityTitle;

  /// No description provided for @securitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add a second factor to protect your account.'**
  String get securitySubtitle;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get method;

  /// No description provided for @activeBadge.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeBadge;

  /// No description provided for @disableHint.
  ///
  /// In en, this message translates to:
  /// **'Disable with the switch'**
  String get disableHint;

  /// No description provided for @configureTotp.
  ///
  /// In en, this message translates to:
  /// **'Configure TOTP'**
  String get configureTotp;

  /// No description provided for @configureEmailOtp.
  ///
  /// In en, this message translates to:
  /// **'Configure EMAIL_OTP'**
  String get configureEmailOtp;

  /// No description provided for @prefsNote.
  ///
  /// In en, this message translates to:
  /// **'2FA state is kept for this session (the backend does not expose GET preferences).'**
  String get prefsNote;

  /// No description provided for @clientApps.
  ///
  /// In en, this message translates to:
  /// **'Client Applications'**
  String get clientApps;

  /// No description provided for @clientAppsDesc.
  ///
  /// In en, this message translates to:
  /// **'OAuth2 (M2M) integrations for your tenant.'**
  String get clientAppsDesc;

  /// No description provided for @createApp.
  ///
  /// In en, this message translates to:
  /// **'Create Application'**
  String get createApp;

  /// No description provided for @appsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No client applications yet. Create the first one to integrate a service.'**
  String get appsEmpty;

  /// No description provided for @appsError.
  ///
  /// In en, this message translates to:
  /// **'Could not load applications'**
  String get appsError;

  /// No description provided for @appActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get appActive;

  /// No description provided for @appInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get appInactive;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get appName;

  /// No description provided for @scopes.
  ///
  /// In en, this message translates to:
  /// **'Scopes (comma separated)'**
  String get scopes;

  /// No description provided for @appCreated.
  ///
  /// In en, this message translates to:
  /// **'Application created'**
  String get appCreated;

  /// No description provided for @secretOnce.
  ///
  /// In en, this message translates to:
  /// **'Only shown once'**
  String get secretOnce;

  /// No description provided for @secretWarning.
  ///
  /// In en, this message translates to:
  /// **'Copy the client secret now. For security, you will not be able to see it again.'**
  String get secretWarning;

  /// No description provided for @copySecret.
  ///
  /// In en, this message translates to:
  /// **'Copy secret'**
  String get copySecret;

  /// No description provided for @secretCopied.
  ///
  /// In en, this message translates to:
  /// **'Client secret copied'**
  String get secretCopied;

  /// No description provided for @createAction.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createAction;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Good morning, Ana'**
  String get greeting;

  /// No description provided for @totalParties.
  ///
  /// In en, this message translates to:
  /// **'Total Parties'**
  String get totalParties;

  /// No description provided for @employeesKpi.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employeesKpi;

  /// No description provided for @departmentsKpi.
  ///
  /// In en, this message translates to:
  /// **'Departments'**
  String get departmentsKpi;

  /// No description provided for @orgCaption.
  ///
  /// In en, this message translates to:
  /// **'in the organization'**
  String get orgCaption;

  /// No description provided for @activeCaption.
  ///
  /// In en, this message translates to:
  /// **'active'**
  String get activeCaption;

  /// No description provided for @unitsCaption.
  ///
  /// In en, this message translates to:
  /// **'organizational units'**
  String get unitsCaption;

  /// No description provided for @recentRecords.
  ///
  /// In en, this message translates to:
  /// **'Recent records'**
  String get recentRecords;

  /// No description provided for @colRecord.
  ///
  /// In en, this message translates to:
  /// **'RECORD'**
  String get colRecord;

  /// No description provided for @noRecent.
  ///
  /// In en, this message translates to:
  /// **'No recent records'**
  String get noRecent;

  /// No description provided for @dashboardError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the dashboard summary'**
  String get dashboardError;

  /// No description provided for @unitDivision.
  ///
  /// In en, this message translates to:
  /// **'Division'**
  String get unitDivision;

  /// No description provided for @unitBranch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get unitBranch;

  /// No description provided for @unitOffice.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get unitOffice;

  /// No description provided for @unitDepartment.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get unitDepartment;

  /// No description provided for @departmentsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} departments'**
  String departmentsCount(int count);

  /// No description provided for @mergeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Parties merged successfully'**
  String get mergeSuccess;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @assignToGroup.
  ///
  /// In en, this message translates to:
  /// **'Assign to \"{group}\"'**
  String assignToGroup(String group);

  /// No description provided for @totpConfigTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up authenticator app'**
  String get totpConfigTitle;

  /// No description provided for @totpScan.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR code with Google Authenticator, 1Password or similar.'**
  String get totpScan;

  /// No description provided for @totpManual.
  ///
  /// In en, this message translates to:
  /// **'Can\'t scan? Enter this secret manually:'**
  String get totpManual;

  /// No description provided for @twoFactorActivated.
  ///
  /// In en, this message translates to:
  /// **'2FA enabled'**
  String get twoFactorActivated;

  /// No description provided for @backupWarning.
  ///
  /// In en, this message translates to:
  /// **'Store these 8 backup codes somewhere safe. They will not be shown again.'**
  String get backupWarning;

  /// No description provided for @backupAck.
  ///
  /// In en, this message translates to:
  /// **'I have saved my backup codes'**
  String get backupAck;

  /// No description provided for @disableMfaTitle.
  ///
  /// In en, this message translates to:
  /// **'Disable 2FA'**
  String get disableMfaTitle;

  /// No description provided for @disableMfaDesc.
  ///
  /// In en, this message translates to:
  /// **'We sent a security code to your primary contact. Enter it to confirm deactivation.'**
  String get disableMfaDesc;

  /// No description provided for @enableEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable email codes'**
  String get enableEmailTitle;

  /// No description provided for @enableEmailDesc.
  ///
  /// In en, this message translates to:
  /// **'We sent a security code to your email. Enter it to enable EMAIL_OTP.'**
  String get enableEmailDesc;

  /// No description provided for @confirmAction.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmAction;

  /// No description provided for @mfaDisabled.
  ///
  /// In en, this message translates to:
  /// **'2FA disabled'**
  String get mfaDisabled;

  /// No description provided for @mfaEmailEnabled.
  ///
  /// In en, this message translates to:
  /// **'2FA enabled (email codes)'**
  String get mfaEmailEnabled;

  /// No description provided for @partyPersonLabel.
  ///
  /// In en, this message translates to:
  /// **'Party (person)'**
  String get partyPersonLabel;

  /// No description provided for @noPartiesToMerge.
  ///
  /// In en, this message translates to:
  /// **'You need at least two active parties to merge'**
  String get noPartiesToMerge;

  /// No description provided for @partyNameHint.
  ///
  /// In en, this message translates to:
  /// **'Party name'**
  String get partyNameHint;

  /// No description provided for @exampleOrg.
  ///
  /// In en, this message translates to:
  /// **'e.g. Acme Corporation'**
  String get exampleOrg;

  /// No description provided for @exampleFirstName.
  ///
  /// In en, this message translates to:
  /// **'John'**
  String get exampleFirstName;

  /// No description provided for @exampleLastName.
  ///
  /// In en, this message translates to:
  /// **'Smith'**
  String get exampleLastName;

  /// No description provided for @exampleSecondLastName.
  ///
  /// In en, this message translates to:
  /// **'Johnson'**
  String get exampleSecondLastName;

  /// No description provided for @exampleLegalName.
  ///
  /// In en, this message translates to:
  /// **'Acme Corporation Inc.'**
  String get exampleLegalName;

  /// No description provided for @exampleTaxId.
  ///
  /// In en, this message translates to:
  /// **'B12345678'**
  String get exampleTaxId;

  /// No description provided for @exampleTradeName.
  ///
  /// In en, this message translates to:
  /// **'Acme'**
  String get exampleTradeName;

  /// No description provided for @holdingTenantIdHint.
  ///
  /// In en, this message translates to:
  /// **'Holding UUID'**
  String get holdingTenantIdHint;

  /// No description provided for @tokenFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Invitation token'**
  String get tokenFieldHint;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code.'**
  String get invalidCode;

  /// No description provided for @couldNotSendCode.
  ///
  /// In en, this message translates to:
  /// **'Could not send the code.'**
  String get couldNotSendCode;

  /// No description provided for @couldNotIssueToken.
  ///
  /// In en, this message translates to:
  /// **'Could not issue the token.'**
  String get couldNotIssueToken;

  /// No description provided for @couldNotReject.
  ///
  /// In en, this message translates to:
  /// **'Could not reject.'**
  String get couldNotReject;

  /// No description provided for @couldNotRevoke.
  ///
  /// In en, this message translates to:
  /// **'Could not revoke.'**
  String get couldNotRevoke;

  /// No description provided for @couldNotCancel.
  ///
  /// In en, this message translates to:
  /// **'Could not cancel.'**
  String get couldNotCancel;

  /// No description provided for @couldNotAssignDepartment.
  ///
  /// In en, this message translates to:
  /// **'Could not assign the department.'**
  String get couldNotAssignDepartment;

  /// No description provided for @deptNameHint.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get deptNameHint;

  /// No description provided for @deptCodeHint.
  ///
  /// In en, this message translates to:
  /// **'TECH'**
  String get deptCodeHint;

  /// No description provided for @groupNameHint.
  ///
  /// In en, this message translates to:
  /// **'Corporate'**
  String get groupNameHint;

  /// No description provided for @groupDescHint.
  ///
  /// In en, this message translates to:
  /// **'Grouping of units'**
  String get groupDescHint;

  /// No description provided for @appNameHint.
  ///
  /// In en, this message translates to:
  /// **'Integration portal'**
  String get appNameHint;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'name@company.com'**
  String get emailHint;

  /// No description provided for @sectionComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Section \"{route}\" coming soon'**
  String sectionComingSoon(String route);

  /// No description provided for @authTagline.
  ///
  /// In en, this message translates to:
  /// **'Built to operate at the level of your ambition.'**
  String get authTagline;

  /// No description provided for @sessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Verification expired. Please sign in again.'**
  String get sessionExpired;

  /// No description provided for @couldNotCreateDepartment.
  ///
  /// In en, this message translates to:
  /// **'Could not create the department.'**
  String get couldNotCreateDepartment;

  /// No description provided for @couldNotCreateGroup.
  ///
  /// In en, this message translates to:
  /// **'Could not create the group.'**
  String get couldNotCreateGroup;

  /// No description provided for @couldNotConsumeToken.
  ///
  /// In en, this message translates to:
  /// **'Could not consume the token.'**
  String get couldNotConsumeToken;

  /// No description provided for @uptime.
  ///
  /// In en, this message translates to:
  /// **'Uptime'**
  String get uptime;

  /// No description provided for @partyDetailError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the party'**
  String get partyDetailError;

  /// No description provided for @couldNotUpdateParty.
  ///
  /// In en, this message translates to:
  /// **'Could not update the party.'**
  String get couldNotUpdateParty;

  /// No description provided for @couldNotCreateParty.
  ///
  /// In en, this message translates to:
  /// **'Could not create the party. Please try again.'**
  String get couldNotCreateParty;

  /// No description provided for @couldNotCreateApp.
  ///
  /// In en, this message translates to:
  /// **'Could not create the application.'**
  String get couldNotCreateApp;

  /// No description provided for @couldNotCreateEmployee.
  ///
  /// In en, this message translates to:
  /// **'Could not create the employee. Please try again.'**
  String get couldNotCreateEmployee;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not sign in. Please try again.'**
  String get loginFailed;

  /// No description provided for @verifyFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not verify the code. Please try again.'**
  String get verifyFailed;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required.'**
  String get nameRequired;

  /// No description provided for @scopesRequired.
  ///
  /// In en, this message translates to:
  /// **'Add at least one scope.'**
  String get scopesRequired;

  /// No description provided for @authTaglineBody.
  ///
  /// In en, this message translates to:
  /// **'Enterprise data depth with an experience that feels inevitable.'**
  String get authTaglineBody;

  /// No description provided for @holdingIdRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter the Holding Tenant ID.'**
  String get holdingIdRequired;

  /// No description provided for @tokenRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter the token.'**
  String get tokenRequired;

  /// No description provided for @selectBothParties.
  ///
  /// In en, this message translates to:
  /// **'Select both parties.'**
  String get selectBothParties;

  /// No description provided for @distinctParties.
  ///
  /// In en, this message translates to:
  /// **'Target and Source must be different.'**
  String get distinctParties;

  /// No description provided for @couldNotMergeParties.
  ///
  /// In en, this message translates to:
  /// **'Could not merge the parties.'**
  String get couldNotMergeParties;

  /// No description provided for @totpCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code.'**
  String get totpCodeRequired;

  /// No description provided for @emailCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter the code you received.'**
  String get emailCodeRequired;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get notificationsEmpty;

  /// No description provided for @notificationsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up.'**
  String get notificationsEmptyHint;

  /// No description provided for @notificationsError.
  ///
  /// In en, this message translates to:
  /// **'Could not load notifications'**
  String get notificationsError;

  /// No description provided for @notificationMarkReadError.
  ///
  /// In en, this message translates to:
  /// **'Could not mark the notification as read.'**
  String get notificationMarkReadError;

  /// No description provided for @notificationsUnreadCount.
  ///
  /// In en, this message translates to:
  /// **'{count} unread'**
  String notificationsUnreadCount(int count);

  /// No description provided for @notificationJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get notificationJustNow;

  /// No description provided for @notificationMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} min ago'**
  String notificationMinutesAgo(int count);

  /// No description provided for @notificationHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} h ago'**
  String notificationHoursAgo(int count);

  /// No description provided for @notificationDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} d ago'**
  String notificationDaysAgo(int count);

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Log out?'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmMessage;

  /// No description provided for @logoutAction.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logoutAction;

  /// No description provided for @logoutError.
  ///
  /// In en, this message translates to:
  /// **'Could not log out. Please try again.'**
  String get logoutError;

  /// No description provided for @employeeDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Employee Detail'**
  String get employeeDetailTitle;

  /// No description provided for @tabEmployment.
  ///
  /// In en, this message translates to:
  /// **'Employment'**
  String get tabEmployment;

  /// No description provided for @tabAssignments.
  ///
  /// In en, this message translates to:
  /// **'Assignment history'**
  String get tabAssignments;

  /// No description provided for @tabContactsEmployee.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get tabContactsEmployee;

  /// No description provided for @managerLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get managerLabel;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get notAvailable;

  /// No description provided for @employeeDetailError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the employee'**
  String get employeeDetailError;

  /// No description provided for @assignmentsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The backend does not expose assignment history yet.'**
  String get assignmentsUnavailable;

  /// No description provided for @employeeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Employee not found'**
  String get employeeNotFound;

  /// No description provided for @departmentDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Department Detail'**
  String get departmentDetailTitle;

  /// No description provided for @tabGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get tabGeneral;

  /// No description provided for @tabSubdepartments.
  ///
  /// In en, this message translates to:
  /// **'Sub-departments'**
  String get tabSubdepartments;

  /// No description provided for @tabEmployees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get tabEmployees;

  /// No description provided for @departmentNotFound.
  ///
  /// In en, this message translates to:
  /// **'Department not found'**
  String get departmentNotFound;

  /// No description provided for @departmentDetailError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the department'**
  String get departmentDetailError;

  /// No description provided for @noSubdepartments.
  ///
  /// In en, this message translates to:
  /// **'No sub-departments'**
  String get noSubdepartments;

  /// No description provided for @noDepartmentEmployees.
  ///
  /// In en, this message translates to:
  /// **'No employees assigned'**
  String get noDepartmentEmployees;

  /// No description provided for @noCorporateGroup.
  ///
  /// In en, this message translates to:
  /// **'Not assigned to a corporate group'**
  String get noCorporateGroup;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
