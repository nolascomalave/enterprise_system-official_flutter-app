// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Enterprise App';

  @override
  String get loginTitle => 'Bienvenido de nuevo';

  @override
  String get loginSubtitle =>
      'Inicia sesión para acceder a tu espacio de trabajo';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get organizationLabel => 'Organización';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get registerCompany => 'Registrar nueva empresa';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardSubtitle => 'Resumen general de Acme Corporation';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get tenantLabel => 'Organización';

  @override
  String get tenantHint => 'UUID de la organización';

  @override
  String get brandHeadline => 'Diseñado para operar al nivel de tu ambición.';

  @override
  String get brandSubtitle =>
      'Profundidad de datos empresarial con una experiencia que se siente inevitable.';

  @override
  String get statParties => 'Parties';

  @override
  String get statUptime => 'Uptime';

  @override
  String get twoFactorTitle => 'Verificación en dos pasos';

  @override
  String get twoFactorSubtitle =>
      'Introduce el código de 6 dígitos de tu app autenticadora';

  @override
  String get codeLabel => 'Código';

  @override
  String get verify => 'Verificar';

  @override
  String get backToLogin => 'Volver al inicio de sesión';

  @override
  String get errorGeneric => 'Algo ha salido mal. Inténtalo de nuevo.';

  @override
  String get retry => 'Reintentar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get close => 'Cerrar';

  @override
  String get search => 'Buscar';

  @override
  String get required => 'Requerido';

  @override
  String get actions => 'Acciones';

  @override
  String noResults(String query) {
    return 'Sin resultados para \"$query\"';
  }

  @override
  String get underConstruction => 'Sección en construcción';

  @override
  String get searchMenu => 'Buscar…';

  @override
  String get menuOffline => 'Menú offline';

  @override
  String get expandMenu => 'Expandir menú';

  @override
  String get collapseMenu => 'Colapsar menú';

  @override
  String get askAi => 'Ask AI';

  @override
  String get askAiSoon => 'Ask AI — próximamente';

  @override
  String get navHome => 'Inicio';

  @override
  String get navParty => 'Party';

  @override
  String get navTeam => 'Equipo';

  @override
  String get navAreas => 'Áreas';

  @override
  String get navMenu => 'Menú';

  @override
  String get partiesTitle => 'Partes';

  @override
  String get partiesSubtitle => 'Personas y organizaciones de Acme Corporation';

  @override
  String get partiesSearch => 'Buscar parties…';

  @override
  String get newParty => 'Nueva Party';

  @override
  String get mergeParties => 'Fusionar';

  @override
  String get colName => 'NOMBRE';

  @override
  String get colType => 'TIPO';

  @override
  String get colProfile => 'PERFIL';

  @override
  String get colStatus => 'ESTADO';

  @override
  String get statusActive => 'Activo';

  @override
  String get statusInactive => 'Inactivo';

  @override
  String get statusMerged => 'Fusionado';

  @override
  String get partiesEmpty => 'Aún no hay parties';

  @override
  String get partiesError => 'No se pudieron cargar las parties';

  @override
  String get mergeTitle => 'Fusionar Parties (Golden Record)';

  @override
  String get mergeInstruction =>
      'Selecciona las dos Parties que deseas fusionar. La primera será el registro principal (Target) y la segunda será absorbida (Source).';

  @override
  String get mergeTarget => 'Party Target (se mantiene)';

  @override
  String get mergeSource => 'Party Source (se fusiona)';

  @override
  String get mergeWarning =>
      'Esta acción es irreversible desde la UI. El registro Source quedará marcado como MERGED.';

  @override
  String get partyCreated => 'Party creada correctamente';

  @override
  String get partyUpdated => 'Party actualizada correctamente';

  @override
  String get partyDetailTitle => 'Detalle de Party';

  @override
  String get editParty => 'Editar';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get tabContacts => 'Contactos';

  @override
  String get tabAddresses => 'Direcciones';

  @override
  String get tabNames => 'Nombres';

  @override
  String get primary => 'Principal';

  @override
  String get nationalities => 'Nacionalidades';

  @override
  String get documents => 'Documentos';

  @override
  String get noContacts => 'Sin contactos registrados';

  @override
  String get noAddresses => 'Sin direcciones registradas';

  @override
  String get noNames => 'Sin nombres históricos';

  @override
  String get editPartyTitle => 'Editar Party';

  @override
  String get displayName => 'Nombre visible';

  @override
  String get typeNotEditable => 'Tipo (no editable)';

  @override
  String get firstName => 'Nombre';

  @override
  String get middleName => 'Segundo nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get secondLastName => 'Segundo apellido';

  @override
  String get birthDate => 'Fecha de nacimiento';

  @override
  String get legalName => 'Razón social';

  @override
  String get tradeName => 'Nombre comercial';

  @override
  String get taxId => 'Tax ID';

  @override
  String get partyTypeIndividual => 'Persona';

  @override
  String get partyTypeOrganization => 'Organización';

  @override
  String get partyType => 'Tipo';

  @override
  String get statusLabel => 'Estado';

  @override
  String get createdAt => 'Creado';

  @override
  String get idLabel => 'ID';

  @override
  String get employeesTitle => 'Empleados';

  @override
  String get employeesSubtitle => 'Equipo de Acme Corporation';

  @override
  String get employeesSearch => 'Buscar empleados…';

  @override
  String get newEmployee => 'Nuevo Empleado';

  @override
  String get colEmployee => 'EMPLEADO';

  @override
  String get colCode => 'CÓDIGO';

  @override
  String get colJob => 'CARGO';

  @override
  String get colDepartment => 'DEPARTAMENTO';

  @override
  String get statusOnLeave => 'Permiso';

  @override
  String get statusTerminated => 'Terminado';

  @override
  String get employeesEmpty => 'Aún no hay empleados';

  @override
  String get employeesEmptyHint => 'Crea el primero con \"Nuevo Empleado\"';

  @override
  String get employeesError => 'No se pudieron cargar los empleados';

  @override
  String get selectPerson => 'Selecciona una persona';

  @override
  String get selectJob => 'Selecciona un puesto';

  @override
  String get selectDepartment => 'Selecciona un departamento';

  @override
  String get employeeCode => 'Código de empleado';

  @override
  String get jobTitle => 'Puesto';

  @override
  String get departmentLabel => 'Departamento';

  @override
  String get hireDate => 'Fecha de contratación';

  @override
  String get employeeCreated => 'Empleado creado correctamente';

  @override
  String get catalogsError => 'No se pudieron cargar los catálogos';

  @override
  String get departmentsTitle => 'Departamentos';

  @override
  String get departmentsSubtitle =>
      'Estructura organizativa de Acme Corporation';

  @override
  String get hierarchy => 'Jerarquía';

  @override
  String get corporateGroups => 'Grupos corporativos';

  @override
  String get newDepartment => 'Nuevo Departamento';

  @override
  String get newGroup => 'Nuevo Grupo';

  @override
  String get departmentsError => 'No se pudieron cargar los departamentos';

  @override
  String get groupsError => 'No se pudieron cargar los grupos corporativos';

  @override
  String get departmentsEmpty => 'Aún no hay departamentos';

  @override
  String get groupsEmpty => 'Aún no hay grupos corporativos';

  @override
  String get createFirstDepartment =>
      'Crea el primero con \"Nuevo Departamento\"';

  @override
  String get createFirstGroup => 'Crea el primero con \"Nuevo Grupo\"';

  @override
  String get assignDepartment => 'Asignar departamento';

  @override
  String get noAssignments => 'Sin departamentos asignados en esta sesión';

  @override
  String get newSubDepartment => 'Nuevo sub-departmento';

  @override
  String get unitType => 'Tipo de unidad';

  @override
  String get parentDepartmentOptional => 'Departamento padre (opcional)';

  @override
  String get managerOptional => 'Manager (opcional)';

  @override
  String get noParent => '— Sin padre (raíz) —';

  @override
  String get noManager => '— Sin manager —';

  @override
  String get newGroupTitle => 'Nuevo Grupo Corporativo';

  @override
  String get descriptionOptional => 'Descripción (opcional)';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get departmentCreated => 'Departamento creado correctamente';

  @override
  String get groupCreated => 'Grupo corporativo creado';

  @override
  String get assignedToGroup => 'Departamento asignado al grupo';

  @override
  String get relationshipsTitle => 'Relaciones Corporativas';

  @override
  String get relationshipsSubtitle =>
      'Estructura holding-filial de tus tenants';

  @override
  String get newRelationship => 'Nueva Relación';

  @override
  String get colHolding => 'HOLDING';

  @override
  String get colSubsidiary => 'FILIAL';

  @override
  String get colDate => 'FECHA';

  @override
  String get relationshipsEmpty => 'Aún no hay relaciones corporativas';

  @override
  String get relationshipsEmptyHint =>
      'Inicia la primera con \"Nueva Relación\"';

  @override
  String get relationshipsError => 'No se pudieron cargar las relaciones';

  @override
  String get statusPending => 'Pendiente';

  @override
  String get statusApproved => 'Aprobada';

  @override
  String get statusRejected => 'Rechazada';

  @override
  String get statusRevoked => 'Revocada';

  @override
  String get statusCancelled => 'Cancelada';

  @override
  String get statusUnknown => 'Desconocida';

  @override
  String get emitToken => 'Emitir token';

  @override
  String get consumeToken => 'Consumir token';

  @override
  String get rejectAction => 'Rechazar';

  @override
  String get revokeAction => 'Revocar';

  @override
  String get cancelAction => 'Cancelar';

  @override
  String get newRelationshipHint =>
      'Introduce el identificador del tenant holding para iniciar la relación.';

  @override
  String get holdingTenantId => 'Holding Tenant ID';

  @override
  String get initiateAction => 'Iniciar';

  @override
  String get relationshipStarted => 'Relación iniciada';

  @override
  String get tokenTitle => 'Token de invitación';

  @override
  String get tokenWarning =>
      'Comparte este token con la filial para que consuma la relación. Puede caducar.';

  @override
  String get copyToken => 'Copiar token';

  @override
  String get tokenCopied => 'Token copiado';

  @override
  String expiresAt(String date) {
    return 'Caduca: $date';
  }

  @override
  String get consumeTokenHint =>
      'Introduce el token de invitación recibido del holding.';

  @override
  String get consumeAction => 'Consumir';

  @override
  String get relationshipApproved => 'Relación aprobada';

  @override
  String get rejectTitle => 'Rechazar relación';

  @override
  String get revokeTitle => 'Revocar relación';

  @override
  String get cancelTitle => 'Cancelar relación';

  @override
  String get reasonOptional => 'Motivo (opcional)';

  @override
  String get reasonHint => 'Describe el motivo';

  @override
  String get irreversibleUI =>
      'Esta acción no se puede deshacer desde la interfaz.';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsSubtitle => 'Seguridad y acceso de tu cuenta';

  @override
  String get appearance => 'Apariencia';

  @override
  String get appearanceDesc => 'Tema e idioma se guardan en tu cuenta.';

  @override
  String get theme => 'Tema';

  @override
  String get language => 'Idioma';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get securityTitle => 'Autenticación de Dos Factores (2FA)';

  @override
  String get securitySubtitle =>
      'Añade un segundo factor para proteger tu cuenta.';

  @override
  String get method => 'Método';

  @override
  String get activeBadge => 'Activo';

  @override
  String get disableHint => 'Desactiva con el switch';

  @override
  String get configureTotp => 'Configurar TOTP';

  @override
  String get configureEmailOtp => 'Configurar EMAIL_OTP';

  @override
  String get prefsNote =>
      'El estado de 2FA se conserva durante la sesión (el backend no expone un GET de preferencias).';

  @override
  String get clientApps => 'Aplicaciones Cliente';

  @override
  String get clientAppsDesc => 'Integraciones OAuth2 (M2M) de tu tenant.';

  @override
  String get createApp => 'Crear Aplicación';

  @override
  String get appsEmpty =>
      'Aún no hay aplicaciones cliente. Crea la primera para integrar un servicio.';

  @override
  String get appsError => 'No se pudieron cargar las aplicaciones';

  @override
  String get appActive => 'Activa';

  @override
  String get appInactive => 'Inactiva';

  @override
  String get appName => 'Nombre';

  @override
  String get scopes => 'Scopes (separados por comas)';

  @override
  String get appCreated => 'Aplicación creada';

  @override
  String get secretOnce => 'Solo se mostrará una vez';

  @override
  String get secretWarning =>
      'Copia el client secret ahora. Por seguridad, no podrás volver a verlo.';

  @override
  String get copySecret => 'Copiar secreto';

  @override
  String get secretCopied => 'Client secret copiado';

  @override
  String get createAction => 'Crear';

  @override
  String get greeting => 'Buenos días, Ana';

  @override
  String get totalParties => 'Total Parties';

  @override
  String get employeesKpi => 'Empleados';

  @override
  String get departmentsKpi => 'Departamentos';

  @override
  String get orgCaption => 'en la organización';

  @override
  String get activeCaption => 'activos';

  @override
  String get unitsCaption => 'unidades organizativas';

  @override
  String get recentRecords => 'Últimos registros';

  @override
  String get colRecord => 'REGISTRO';

  @override
  String get noRecent => 'Sin registros recientes';

  @override
  String get dashboardError => 'No se pudo cargar el resumen del dashboard';

  @override
  String get unitDivision => 'División';

  @override
  String get unitBranch => 'Sucursal';

  @override
  String get unitOffice => 'Oficina';

  @override
  String get unitDepartment => 'Departamento';

  @override
  String departmentsCount(int count) {
    return '$count departamentos';
  }

  @override
  String get mergeSuccess => 'Parties fusionadas correctamente';

  @override
  String get back => 'Volver';

  @override
  String assignToGroup(String group) {
    return 'Asignar a \"$group\"';
  }

  @override
  String get totpConfigTitle => 'Configurar app autenticadora';

  @override
  String get totpScan =>
      'Escanea el código QR con Google Authenticator, 1Password o similar.';

  @override
  String get totpManual =>
      '¿No puedes escanear? Introduce este secreto manualmente:';

  @override
  String get twoFactorActivated => '2FA activado';

  @override
  String get backupWarning =>
      'Guarda estos 8 códigos de respaldo en un lugar seguro. No volverán a mostrarse.';

  @override
  String get backupAck => 'He guardado mis códigos de respaldo';

  @override
  String get disableMfaTitle => 'Desactivar 2FA';

  @override
  String get disableMfaDesc =>
      'Hemos enviado un código de seguridad a tu contacto principal. Introdúcelo para confirmar la desactivación.';

  @override
  String get enableEmailTitle => 'Activar código por correo';

  @override
  String get enableEmailDesc =>
      'Hemos enviado un código de seguridad a tu correo. Introdúcelo para activar EMAIL_OTP.';

  @override
  String get confirmAction => 'Confirmar';

  @override
  String get mfaDisabled => '2FA desactivado';

  @override
  String get mfaEmailEnabled => '2FA activado (código al correo)';

  @override
  String get partyPersonLabel => 'Party (persona)';

  @override
  String get noPartiesToMerge =>
      'Necesitas al menos dos parties activas para fusionar';

  @override
  String get partyNameHint => 'Nombre de la party';

  @override
  String get exampleOrg => 'Ej. Acme Corporation';

  @override
  String get exampleFirstName => 'Juan';

  @override
  String get exampleLastName => 'Pérez';

  @override
  String get exampleSecondLastName => 'García';

  @override
  String get exampleLegalName => 'Acme Corporation S.A.';

  @override
  String get exampleTaxId => 'B12345678';

  @override
  String get exampleTradeName => 'Acme';

  @override
  String get holdingTenantIdHint => 'UUID del holding';

  @override
  String get tokenFieldHint => 'Token de invitación';

  @override
  String get invalidCode => 'Código inválido.';

  @override
  String get couldNotSendCode => 'No se pudo enviar el código.';

  @override
  String get couldNotIssueToken => 'No se pudo emitir el token.';

  @override
  String get couldNotReject => 'No se pudo rechazar.';

  @override
  String get couldNotRevoke => 'No se pudo revocar.';

  @override
  String get couldNotCancel => 'No se pudo cancelar.';

  @override
  String get couldNotAssignDepartment => 'No se pudo asignar el departamento.';

  @override
  String get deptNameHint => 'Tecnología';

  @override
  String get deptCodeHint => 'TECH';

  @override
  String get groupNameHint => 'Corporativo';

  @override
  String get groupDescHint => 'Agrupación de unidades';

  @override
  String get appNameHint => 'Portal de integración';

  @override
  String get emailHint => 'nombre@empresa.com';

  @override
  String sectionComingSoon(String route) {
    return 'Sección \"$route\" próximamente';
  }

  @override
  String get authTagline => 'Diseñado para operar al nivel de tu ambición.';

  @override
  String get sessionExpired =>
      'La verificación expiró. Vuelve a iniciar sesión.';

  @override
  String get couldNotCreateDepartment => 'No se pudo crear el departamento.';

  @override
  String get couldNotCreateGroup => 'No se pudo crear el grupo.';

  @override
  String get couldNotConsumeToken => 'No se pudo consumir el token.';

  @override
  String get uptime => 'Disponibilidad';

  @override
  String get partyDetailError => 'No se pudo cargar la party';

  @override
  String get couldNotUpdateParty => 'No se pudo actualizar la party.';

  @override
  String get couldNotCreateParty =>
      'No se pudo crear la party. Inténtalo de nuevo.';

  @override
  String get couldNotCreateApp => 'No se pudo crear la aplicación.';

  @override
  String get couldNotCreateEmployee =>
      'No se pudo crear el empleado. Inténtalo de nuevo.';

  @override
  String get loginFailed => 'No se pudo iniciar sesión. Inténtalo de nuevo.';

  @override
  String get verifyFailed =>
      'No se pudo verificar el código. Inténtalo de nuevo.';

  @override
  String get nameRequired => 'El nombre es obligatorio.';

  @override
  String get scopesRequired => 'Añade al menos un scope.';

  @override
  String get authTaglineBody =>
      'Profundidad de datos empresarial con una experiencia que se siente inevitable.';

  @override
  String get holdingIdRequired => 'Introduce el Holding Tenant ID.';

  @override
  String get tokenRequired => 'Introduce el token.';

  @override
  String get selectBothParties => 'Selecciona las dos parties.';

  @override
  String get distinctParties => 'Target y Source deben ser distintas.';

  @override
  String get couldNotMergeParties => 'No se pudieron fusionar las parties.';

  @override
  String get totpCodeRequired => 'Introduce el código de 6 dígitos.';

  @override
  String get emailCodeRequired => 'Introduce el código recibido.';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get notificationsEmpty => 'No tienes notificaciones';

  @override
  String get notificationsEmptyHint => 'Estás al día.';

  @override
  String get notificationsError => 'No se pudieron cargar las notificaciones';

  @override
  String get notificationMarkReadError =>
      'No se pudo marcar la notificación como leída.';

  @override
  String notificationsUnreadCount(int count) {
    return '$count sin leer';
  }

  @override
  String get notificationJustNow => 'Ahora';

  @override
  String notificationMinutesAgo(int count) {
    return 'Hace $count min';
  }

  @override
  String notificationHoursAgo(int count) {
    return 'Hace $count h';
  }

  @override
  String notificationDaysAgo(int count) {
    return 'Hace $count d';
  }

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get logoutConfirmTitle => '¿Cerrar sesión?';

  @override
  String get logoutConfirmMessage =>
      '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get logoutAction => 'Cerrar sesión';

  @override
  String get logoutError => 'No se pudo cerrar sesión. Inténtalo de nuevo.';

  @override
  String get employeeDetailTitle => 'Detalle de Empleado';

  @override
  String get tabEmployment => 'Información laboral';

  @override
  String get tabAssignments => 'Historial de asignaciones';

  @override
  String get tabContactsEmployee => 'Contactos';

  @override
  String get managerLabel => 'Manager';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get employeeDetailError => 'No se pudo cargar el empleado';

  @override
  String get assignmentsUnavailable =>
      'El backend aún no expone el historial de asignaciones.';

  @override
  String get employeeNotFound => 'Empleado no encontrado';

  @override
  String get departmentDetailTitle => 'Detalle de Departamento';

  @override
  String get tabGeneral => 'General';

  @override
  String get tabSubdepartments => 'Sub-departamentos';

  @override
  String get tabEmployees => 'Empleados';

  @override
  String get departmentNotFound => 'Departamento no encontrado';

  @override
  String get departmentDetailError => 'No se pudo cargar el departamento';

  @override
  String get noSubdepartments => 'Sin sub-departamentos';

  @override
  String get noDepartmentEmployees => 'Sin empleados asignados';

  @override
  String get noCorporateGroup => 'Sin grupo corporativo';
}
