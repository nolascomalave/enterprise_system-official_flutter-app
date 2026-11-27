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
  String get dashboardSubtitle => 'Acme Corporation overview';

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
  String get codeLabel => 'Code';

  @override
  String get verify => 'Verify';

  @override
  String get backToLogin => 'Back to sign in';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get close => 'Close';

  @override
  String get search => 'Search';

  @override
  String get required => 'Required';

  @override
  String get actions => 'Actions';

  @override
  String noResults(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String get underConstruction => 'Section under construction';

  @override
  String get searchMenu => 'Search…';

  @override
  String get menuOffline => 'Menu offline';

  @override
  String get expandMenu => 'Expand menu';

  @override
  String get collapseMenu => 'Collapse menu';

  @override
  String get askAi => 'Ask AI';

  @override
  String get askAiSoon => 'Ask AI — coming soon';

  @override
  String get navHome => 'Home';

  @override
  String get navParty => 'Party';

  @override
  String get navTeam => 'Team';

  @override
  String get navAreas => 'Areas';

  @override
  String get navMenu => 'Menu';

  @override
  String get partiesTitle => 'Parties';

  @override
  String get partiesSubtitle => 'People and organizations of Acme Corporation';

  @override
  String get partiesSearch => 'Search parties…';

  @override
  String get newParty => 'New Party';

  @override
  String get mergeParties => 'Merge';

  @override
  String get colName => 'NAME';

  @override
  String get colType => 'TYPE';

  @override
  String get colProfile => 'PROFILE';

  @override
  String get colStatus => 'STATUS';

  @override
  String get statusActive => 'Active';

  @override
  String get statusInactive => 'Inactive';

  @override
  String get statusMerged => 'Merged';

  @override
  String get partiesEmpty => 'No parties yet';

  @override
  String get partiesError => 'Could not load parties';

  @override
  String get mergeTitle => 'Merge Parties (Golden Record)';

  @override
  String get mergeInstruction =>
      'Select the two Parties to merge. The first will be the main record (Target) and the second will be absorbed (Source).';

  @override
  String get mergeTarget => 'Party Target (kept)';

  @override
  String get mergeSource => 'Party Source (merged)';

  @override
  String get mergeWarning =>
      'This action is irreversible from the UI. The Source record will be marked as MERGED.';

  @override
  String get partyCreated => 'Party created successfully';

  @override
  String get partyUpdated => 'Party updated successfully';

  @override
  String get partyDetailTitle => 'Party Detail';

  @override
  String get editParty => 'Edit';

  @override
  String get tabProfile => 'Profile';

  @override
  String get tabContacts => 'Contacts';

  @override
  String get tabAddresses => 'Addresses';

  @override
  String get tabNames => 'Names';

  @override
  String get primary => 'Primary';

  @override
  String get nationalities => 'Nationalities';

  @override
  String get documents => 'Documents';

  @override
  String get noContacts => 'No contacts registered';

  @override
  String get noAddresses => 'No addresses registered';

  @override
  String get noNames => 'No historical names';

  @override
  String get editPartyTitle => 'Edit Party';

  @override
  String get displayName => 'Display name';

  @override
  String get typeNotEditable => 'Type (read-only)';

  @override
  String get firstName => 'First name';

  @override
  String get middleName => 'Middle name';

  @override
  String get lastName => 'Last name';

  @override
  String get secondLastName => 'Second last name';

  @override
  String get birthDate => 'Date of birth';

  @override
  String get legalName => 'Legal name';

  @override
  String get tradeName => 'Trade name';

  @override
  String get taxId => 'Tax ID';

  @override
  String get partyTypeIndividual => 'Person';

  @override
  String get partyTypeOrganization => 'Organization';

  @override
  String get partyType => 'Type';

  @override
  String get statusLabel => 'Status';

  @override
  String get createdAt => 'Created';

  @override
  String get idLabel => 'ID';

  @override
  String get employeesTitle => 'Employees';

  @override
  String get employeesSubtitle => 'Acme Corporation team';

  @override
  String get employeesSearch => 'Search employees…';

  @override
  String get newEmployee => 'New Employee';

  @override
  String get colEmployee => 'EMPLOYEE';

  @override
  String get colCode => 'CODE';

  @override
  String get colJob => 'JOB TITLE';

  @override
  String get colDepartment => 'DEPARTMENT';

  @override
  String get statusOnLeave => 'On leave';

  @override
  String get statusTerminated => 'Terminated';

  @override
  String get employeesEmpty => 'No employees yet';

  @override
  String get employeesEmptyHint => 'Create the first one with \"New Employee\"';

  @override
  String get employeesError => 'Could not load employees';

  @override
  String get selectPerson => 'Select a person';

  @override
  String get selectJob => 'Select a job title';

  @override
  String get selectDepartment => 'Select a department';

  @override
  String get employeeCode => 'Employee code';

  @override
  String get jobTitle => 'Job title';

  @override
  String get departmentLabel => 'Department';

  @override
  String get hireDate => 'Hire date';

  @override
  String get employeeCreated => 'Employee created successfully';

  @override
  String get catalogsError => 'Could not load catalogs';

  @override
  String get departmentsTitle => 'Departments';

  @override
  String get departmentsSubtitle => 'Acme Corporation org structure';

  @override
  String get hierarchy => 'Hierarchy';

  @override
  String get corporateGroups => 'Corporate groups';

  @override
  String get newDepartment => 'New Department';

  @override
  String get newGroup => 'New Group';

  @override
  String get departmentsError => 'Could not load departments';

  @override
  String get groupsError => 'Could not load corporate groups';

  @override
  String get departmentsEmpty => 'No departments yet';

  @override
  String get groupsEmpty => 'No corporate groups yet';

  @override
  String get createFirstDepartment =>
      'Create the first one with \"New Department\"';

  @override
  String get createFirstGroup => 'Create the first one with \"New Group\"';

  @override
  String get assignDepartment => 'Assign department';

  @override
  String get noAssignments => 'No departments assigned in this session';

  @override
  String get newSubDepartment => 'New sub-department';

  @override
  String get unitType => 'Unit type';

  @override
  String get parentDepartmentOptional => 'Parent department (optional)';

  @override
  String get managerOptional => 'Manager (optional)';

  @override
  String get noParent => '— No parent (root) —';

  @override
  String get noManager => '— No manager —';

  @override
  String get newGroupTitle => 'New Corporate Group';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get nameLabel => 'Name';

  @override
  String get departmentCreated => 'Department created successfully';

  @override
  String get groupCreated => 'Corporate group created';

  @override
  String get assignedToGroup => 'Department assigned to group';

  @override
  String get relationshipsTitle => 'Corporate Relationships';

  @override
  String get relationshipsSubtitle =>
      'Holding-subsidiary structure of your tenants';

  @override
  String get newRelationship => 'New Relationship';

  @override
  String get colHolding => 'HOLDING';

  @override
  String get colSubsidiary => 'SUBSIDIARY';

  @override
  String get colDate => 'DATE';

  @override
  String get relationshipsEmpty => 'No corporate relationships yet';

  @override
  String get relationshipsEmptyHint =>
      'Start the first one with \"New Relationship\"';

  @override
  String get relationshipsError => 'Could not load relationships';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusApproved => 'Approved';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get statusRevoked => 'Revoked';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get statusUnknown => 'Unknown';

  @override
  String get emitToken => 'Emit token';

  @override
  String get consumeToken => 'Consume token';

  @override
  String get rejectAction => 'Reject';

  @override
  String get revokeAction => 'Revoke';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get newRelationshipHint =>
      'Enter the holding tenant identifier to start the relationship.';

  @override
  String get holdingTenantId => 'Holding Tenant ID';

  @override
  String get initiateAction => 'Start';

  @override
  String get relationshipStarted => 'Relationship started';

  @override
  String get tokenTitle => 'Invitation token';

  @override
  String get tokenWarning =>
      'Share this token with the subsidiary so it can consume the relationship. It may expire.';

  @override
  String get copyToken => 'Copy token';

  @override
  String get tokenCopied => 'Token copied';

  @override
  String expiresAt(String date) {
    return 'Expires: $date';
  }

  @override
  String get consumeTokenHint =>
      'Enter the invitation token received from the holding.';

  @override
  String get consumeAction => 'Consume';

  @override
  String get relationshipApproved => 'Relationship approved';

  @override
  String get rejectTitle => 'Reject relationship';

  @override
  String get revokeTitle => 'Revoke relationship';

  @override
  String get cancelTitle => 'Cancel relationship';

  @override
  String get reasonOptional => 'Reason (optional)';

  @override
  String get reasonHint => 'Describe the reason';

  @override
  String get irreversibleUI => 'This action cannot be undone from the UI.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSubtitle => 'Security and account access';

  @override
  String get appearance => 'Appearance';

  @override
  String get appearanceDesc => 'Theme and language are saved to your account.';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageEnglish => 'English';

  @override
  String get securityTitle => 'Two-Factor Authentication (2FA)';

  @override
  String get securitySubtitle => 'Add a second factor to protect your account.';

  @override
  String get method => 'Method';

  @override
  String get activeBadge => 'Active';

  @override
  String get disableHint => 'Disable with the switch';

  @override
  String get configureTotp => 'Configure TOTP';

  @override
  String get configureEmailOtp => 'Configure EMAIL_OTP';

  @override
  String get prefsNote =>
      '2FA state is kept for this session (the backend does not expose GET preferences).';

  @override
  String get clientApps => 'Client Applications';

  @override
  String get clientAppsDesc => 'OAuth2 (M2M) integrations for your tenant.';

  @override
  String get createApp => 'Create Application';

  @override
  String get appsEmpty =>
      'No client applications yet. Create the first one to integrate a service.';

  @override
  String get appsError => 'Could not load applications';

  @override
  String get appActive => 'Active';

  @override
  String get appInactive => 'Inactive';

  @override
  String get appName => 'Name';

  @override
  String get scopes => 'Scopes (comma separated)';

  @override
  String get appCreated => 'Application created';

  @override
  String get secretOnce => 'Only shown once';

  @override
  String get secretWarning =>
      'Copy the client secret now. For security, you will not be able to see it again.';

  @override
  String get copySecret => 'Copy secret';

  @override
  String get secretCopied => 'Client secret copied';

  @override
  String get createAction => 'Create';

  @override
  String get greeting => 'Good morning, Ana';

  @override
  String get totalParties => 'Total Parties';

  @override
  String get employeesKpi => 'Employees';

  @override
  String get departmentsKpi => 'Departments';

  @override
  String get orgCaption => 'in the organization';

  @override
  String get activeCaption => 'active';

  @override
  String get unitsCaption => 'organizational units';

  @override
  String get recentRecords => 'Recent records';

  @override
  String get colRecord => 'RECORD';

  @override
  String get noRecent => 'No recent records';

  @override
  String get dashboardError => 'Could not load the dashboard summary';

  @override
  String get unitDivision => 'Division';

  @override
  String get unitBranch => 'Branch';

  @override
  String get unitOffice => 'Office';

  @override
  String get unitDepartment => 'Department';

  @override
  String departmentsCount(int count) {
    return '$count departments';
  }

  @override
  String get mergeSuccess => 'Parties merged successfully';

  @override
  String get back => 'Back';

  @override
  String assignToGroup(String group) {
    return 'Assign to \"$group\"';
  }

  @override
  String get totpConfigTitle => 'Set up authenticator app';

  @override
  String get totpScan =>
      'Scan the QR code with Google Authenticator, 1Password or similar.';

  @override
  String get totpManual => 'Can\'t scan? Enter this secret manually:';

  @override
  String get twoFactorActivated => '2FA enabled';

  @override
  String get backupWarning =>
      'Store these 8 backup codes somewhere safe. They will not be shown again.';

  @override
  String get backupAck => 'I have saved my backup codes';

  @override
  String get disableMfaTitle => 'Disable 2FA';

  @override
  String get disableMfaDesc =>
      'We sent a security code to your primary contact. Enter it to confirm deactivation.';

  @override
  String get enableEmailTitle => 'Enable email codes';

  @override
  String get enableEmailDesc =>
      'We sent a security code to your email. Enter it to enable EMAIL_OTP.';

  @override
  String get confirmAction => 'Confirm';

  @override
  String get mfaDisabled => '2FA disabled';

  @override
  String get mfaEmailEnabled => '2FA enabled (email codes)';

  @override
  String get partyPersonLabel => 'Party (person)';

  @override
  String get noPartiesToMerge =>
      'You need at least two active parties to merge';

  @override
  String get partyNameHint => 'Party name';

  @override
  String get exampleOrg => 'e.g. Acme Corporation';

  @override
  String get exampleFirstName => 'John';

  @override
  String get exampleLastName => 'Smith';

  @override
  String get exampleSecondLastName => 'Johnson';

  @override
  String get exampleLegalName => 'Acme Corporation Inc.';

  @override
  String get exampleTaxId => 'B12345678';

  @override
  String get exampleTradeName => 'Acme';

  @override
  String get holdingTenantIdHint => 'Holding UUID';

  @override
  String get tokenFieldHint => 'Invitation token';

  @override
  String get invalidCode => 'Invalid code.';

  @override
  String get couldNotSendCode => 'Could not send the code.';

  @override
  String get couldNotIssueToken => 'Could not issue the token.';

  @override
  String get couldNotReject => 'Could not reject.';

  @override
  String get couldNotRevoke => 'Could not revoke.';

  @override
  String get couldNotCancel => 'Could not cancel.';

  @override
  String get couldNotAssignDepartment => 'Could not assign the department.';

  @override
  String get deptNameHint => 'Technology';

  @override
  String get deptCodeHint => 'TECH';

  @override
  String get groupNameHint => 'Corporate';

  @override
  String get groupDescHint => 'Grouping of units';

  @override
  String get appNameHint => 'Integration portal';

  @override
  String get emailHint => 'name@company.com';

  @override
  String sectionComingSoon(String route) {
    return 'Section \"$route\" coming soon';
  }

  @override
  String get authTagline => 'Built to operate at the level of your ambition.';

  @override
  String get sessionExpired => 'Verification expired. Please sign in again.';

  @override
  String get couldNotCreateDepartment => 'Could not create the department.';

  @override
  String get couldNotCreateGroup => 'Could not create the group.';

  @override
  String get couldNotConsumeToken => 'Could not consume the token.';

  @override
  String get uptime => 'Uptime';

  @override
  String get partyDetailError => 'Could not load the party';

  @override
  String get couldNotUpdateParty => 'Could not update the party.';

  @override
  String get couldNotCreateParty =>
      'Could not create the party. Please try again.';

  @override
  String get couldNotCreateApp => 'Could not create the application.';

  @override
  String get couldNotCreateEmployee =>
      'Could not create the employee. Please try again.';

  @override
  String get loginFailed => 'Could not sign in. Please try again.';

  @override
  String get verifyFailed => 'Could not verify the code. Please try again.';

  @override
  String get nameRequired => 'Name is required.';

  @override
  String get scopesRequired => 'Add at least one scope.';

  @override
  String get authTaglineBody =>
      'Enterprise data depth with an experience that feels inevitable.';

  @override
  String get holdingIdRequired => 'Enter the Holding Tenant ID.';

  @override
  String get tokenRequired => 'Enter the token.';

  @override
  String get selectBothParties => 'Select both parties.';

  @override
  String get distinctParties => 'Target and Source must be different.';

  @override
  String get couldNotMergeParties => 'Could not merge the parties.';

  @override
  String get totpCodeRequired => 'Enter the 6-digit code.';

  @override
  String get emailCodeRequired => 'Enter the code you received.';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmpty => 'No notifications';

  @override
  String get notificationsEmptyHint => 'You\'re all caught up.';

  @override
  String get notificationsError => 'Could not load notifications';

  @override
  String get notificationMarkReadError =>
      'Could not mark the notification as read.';

  @override
  String notificationsUnreadCount(int count) {
    return '$count unread';
  }

  @override
  String get notificationJustNow => 'Just now';

  @override
  String notificationMinutesAgo(int count) {
    return '$count min ago';
  }

  @override
  String notificationHoursAgo(int count) {
    return '$count h ago';
  }

  @override
  String notificationDaysAgo(int count) {
    return '$count d ago';
  }

  @override
  String get logout => 'Log out';

  @override
  String get logoutConfirmTitle => 'Log out?';

  @override
  String get logoutConfirmMessage => 'Are you sure you want to log out?';

  @override
  String get logoutAction => 'Log out';

  @override
  String get logoutError => 'Could not log out. Please try again.';

  @override
  String get employeeDetailTitle => 'Employee Detail';

  @override
  String get tabEmployment => 'Employment';

  @override
  String get tabAssignments => 'Assignment history';

  @override
  String get tabContactsEmployee => 'Contacts';

  @override
  String get managerLabel => 'Manager';

  @override
  String get notAvailable => 'Not available';

  @override
  String get employeeDetailError => 'Could not load the employee';

  @override
  String get assignmentsUnavailable =>
      'The backend does not expose assignment history yet.';

  @override
  String get employeeNotFound => 'Employee not found';

  @override
  String get departmentDetailTitle => 'Department Detail';

  @override
  String get tabGeneral => 'General';

  @override
  String get tabSubdepartments => 'Sub-departments';

  @override
  String get tabEmployees => 'Employees';

  @override
  String get departmentNotFound => 'Department not found';

  @override
  String get departmentDetailError => 'Could not load the department';

  @override
  String get noSubdepartments => 'No sub-departments';

  @override
  String get noDepartmentEmployees => 'No employees assigned';

  @override
  String get noCorporateGroup => 'Not assigned to a corporate group';
}
