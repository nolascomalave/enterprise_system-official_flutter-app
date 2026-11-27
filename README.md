# enterprise_system-official_flutter-app

App empresarial Flutter con el Design System **V5 Premium** (Zinc + Indigo, dark-mode first).

## Stack

- **Estado:** Riverpod (`flutter_riverpod`, `riverpod_annotation`)
- **HTTP:** Dio + `dio_cookie_manager` / `cookie_jar` (cookies de refresh persistentes)
- **Navegación:** GoRouter con protección de rutas por sesión
- **Modelos:** Freezed + json_annotation / json_serializable
- **Tipografía:** Google Fonts — Inter
- **Sesión:** flutter_secure_storage (access token) + cookies HttpOnly (refresh)
- **i18n:** ARB (`en` / `es`) vía `flutter gen-l10n`
- **Utilidades:** intl, path_provider

## Estructura

```
lib/
├── app.dart                  # MaterialApp.router (temas + i18n)
├── main.dart                 # ProviderScope
├── core/
│   ├── theme/                # Colores, sombras y ThemeData V5
│   ├── network/              # Dio, interceptores JWT/refresh, errores
│   ├── router/               # GoRouter + rutas protegidas
│   └── i18n/                 # ARB + clases generadas
└── features/
    ├── auth/{data,domain,presentation}
    └── dashboard/{data,domain,presentation}
```

## Backend

Por defecto: `http://localhost:8080/api/v1`

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.1.10:8080/api/v1 \
            --dart-define=APP_CLIENT_ID=<uuid-del-client-application>
```

El menú lateral se carga desde `GET /rbac/my-menu?app_client_id=...`; si el
backend no responde, se usa un menú de respaldo (modo demo) y se indica
"Menú offline" con opción de reintentar.

## Comandos

```bash
flutter pub get
flutter gen-l10n          # regenera lib/core/i18n/generated
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter build web
```

## Estado actual

- Core configurado: temas Light/Dark V5, cliente Dio con interceptores (Bearer + refresh con cookies), router protegido y localización es/en.
- **Feature Auth completa (V5):**
  - Data: DTOs Freezed, `AuthRepositoryImpl` (`/auth/login`, `/auth/2fa/verify`) con persistencia del token.
  - Domain: `AuthSession`, `AuthResult` (union success/requires2FA), `LoginUseCase`, `VerifyTwoFactorUseCase`.
  - Presentation: `LoginNotifier` (initial/loading/success/requiresTwoFactor/error), `LoginPage` split-screen V5 y `TwoFactorPage` (código de 6 dígitos).
  - Rutas: `/login`, `/login/2fa`, `/dashboard` (protegidas por sesión).
  - Tests: repositorio (Dio mockeado) y notifier (transiciones de estado).
- **App Shell + Dashboard (V5):**
  - `StatefulShellRoute.indexedStack` con ramas `/dashboard`, `/parties`, `/employees`, `/departments`, `/settings` (estado por pestaña preservado).
  - Core RBAC: `MenuRepository` (`/rbac/my-menu`), `MenuNotifier`, fallback offline y buscador.
  - `AppSidebar` 260/72px con transición, ítems recursivos (`SidebarMenuItem`), popover colapsado y estado activo V5.
  - Móvil: bottom nav flotante + bottom sheet con menú completo; breakpoint 768px.
  - Dashboard: KPIs bento (mock), data grid con badges/avatares y FAB "Ask AI".
  - Tests: parseo del árbol RBAC, widget del menú recursivo y breakpoint responsive.
- **Feature Parties (V5):**
  - Data: DTOs Freezed (`PartyDto`, `PersonProfileDto`, `OrganizationProfileDto`, `CreatePartyRequestDto`) con snake_case.
  - `PartyRepositoryImpl`: `GET /parties` y `POST /parties`; casos de uso `GetPartiesUseCase` / `CreatePartyUseCase`.
  - `PartiesNotifier`: lista AsyncValue + creación con refresco automático.
  - UI: `PartiesListPage` (data grid V5 con buscador en memoria, badges y avatares) y modal `CreatePartyForm` con formulario dinámico INDIVIDUAL/ORGANIZATION.
  - Tests: repositorio (Dio mockeado), notifier (loading/data y creación+refresh) y formulario (campos dinámicos y payload).
- **Feature Empleados (V5):**
  - Data: `EmployeeDto`, `CreateEmployeeRequestDto`, `JobDto`, `DepartmentDto` (Freezed, snake_case).
  - `EmployeeRepositoryImpl` (`GET/POST /employees`) + `OrgStructureRepositoryImpl` (`GET /jobs`, `GET /departments`).
  - `EmployeesNotifier` (lista + creación con refresco) y providers de catálogos (`jobsProvider`, `departmentsProvider`, `individualPartiesProvider`).
  - UI: `EmployeesListPage` (JOIN en frontend party/job/department, badges ACTIVE/ON_LEAVE/TERMINATED, buscador) y modal `CreateEmployeeForm` con dropdowns + DatePicker nativo.
  - Tests: payload de creación y catálogos (Dio mockeado); widget test de dropdowns, fecha y envío.
- **Feature Departamentos + Grupos Corporativos (V5):**
  - Data: `DepartmentDto`, `CreateDepartmentRequestDto`, `CorporateGroupDto`, `CreateCorporateGroupRequestDto`, `AssignDepartmentToGroupRequestDto`.
  - `DepartmentRepositoryImpl`: `GET/POST /departments`, `GET/POST /corporate-groups`, `POST /departments/{id}/groups`.
  - `DepartmentsNotifier` (lista plana) + `departmentTreeProvider` (árbol en memoria con `buildDepartmentTree`) y `CorporateGroupsNotifier`.
  - UI: pestañas Jerarquía / Grupos (SegmentedButton); árbol con `ExpansionTile` V5, badges de unidad (División/Sucursal/Oficina/Departamento) y botón "+" por nodo; grupos expandibles con departamentos asignados y acción de asignación.
  - Formularios: departamento (unit_type, parent opcional, manager desde empleados), grupo y asignación.
  - Nota: el Swagger solo expone `POST /corporate-groups`; si `GET` no está disponible se muestran los grupos creados en la sesión.
  - Tests: parseo/creación de departamentos y grupos, asignación, y widget test del árbol anidado.
- **Feature Seguridad / MFA (V5, `/settings`):**
  - Dependencia `qr_flutter` para el QR de TOTP.
  - Data: `UpdateMfaPreferencesRequest`, `TotpSetupResponse`, `VerifyTotpRequest`, `TotpVerifyResponse` (backup codes) y `RequestSecurityCodeRequest`; `SettingsRepositoryImpl` para `PUT /auth/mfa-preferences`, `POST /auth/totp/setup`, `POST /auth/totp/verify` y `POST /auth/request-otp`.
  - `SecuritySettingsNotifier`: estado local (el backend no expone GET de preferencias), setup/verify TOTP, step-up OTP y desactivación.
  - UI: tarjeta de Seguridad con Switch 2FA, selector TOTP / EMAIL_OTP, botón Configurar; modal TOTP con QR + secret + verificación + 8 backup codes con confirmación; modal step-up para desactivar (DISABLE_MFA) y activar EMAIL_OTP (ENABLE_MFA).
  - Tests: repositorio (payloads y parseo), QR y backup codes en widget test, y flujo de desactivación con OTP.
- **Feature Preferencias de usuario (`/users/me/preferences`):**
  - DTO `UserPreferencesDto` (`preferences: Map<String,dynamic>`) y `PreferencesRepositoryImpl` con header `X-App-Client-ID` para `GET/PUT`.
  - `PreferencesNotifier`: carga tras el login (el shell invalida al montarse), merge optimista + rollback, `setTheme` y `setLocale`.
  - `app.dart` aplica `themeMode` y `locale` desde las preferencias → reconstrucción global instantánea.
  - Settings: nueva tarjeta **Apariencia** (tema Claro/Oscuro/Sistema + idioma Español/Inglés) persistida en backend.
  - Tests: repositorio (header/payload/204) y notifier (carga, setTheme, setLocale, rollback).
  - Nota: las cadenas que usan ARB (login/dashboard) se traducen; el resto de la UI aún tiene textos en español.
- **Dashboard real (`GET /dashboard/summary`):**
  - DTO `DashboardSummaryDto` (`total_parties`, `total_employees`, `total_departments`, `recent_parties`) y entidad `DashboardSummary`/`RecentParty`.
  - `DashboardRepositoryImpl` (sin filtros de tenant; RLS en backend) + `GetDashboardSummaryUseCase` + `DashboardNotifier` (AsyncNotifier).
  - UI: KPIs y "Últimos registros" con datos reales; **skeletons animados** (`SkeletonBox`) en carga; estado de error con "Reintentar".
  - Tests: notifier (loading→data) y widget (3 KPIs, recent parties, skeleton y error).
- **Aplicaciones Cliente (Settings):**
  - DTO `ClientApplicationDto` (id, name, client_id, scopes, is_active, client_secret) y `CreateClientApplicationRequestDto`.
  - `ClientAppsRepositoryImpl` (`GET/POST /client-applications`, solo endpoints de tenant) + `ClientAppsNotifier` con creación y refresco.
  - Settings: sección "Aplicaciones Cliente" con lista (nombre, client_id, scopes y badge Activa/Inactiva), skeletons de carga, error con reintento y modal de creación (name + scopes separados por comas).
  - El `client_secret` se muestra **una única vez** en un recuadro ámbar con aviso y botón de copiar; al cerrar se refresca la lista.
  - Tests: notifier (carga + creación con refresh) y widget del modal (secret visible y scopes parseados).
- **Detalle de Party (`/parties/:id`):**
  - DTO `PartyDetailDto` (perfiles) + parseo tolerante de colecciones (`contacts`, `addresses`, `names`, `nationalities`, `documents`) en el repositorio → entidades `PartyDetail`, `PersonInfo`, `OrganizationInfo`, `PartyContact`, `PartyAddress`, `PartyNameEntry`, `PartyDocument`.
  - `getPartyById` en `PartiesRepository` + `GetPartyDetailUseCase` + `PartyDetailNotifier` family.
  - UI: header con avatar grande, tipo y badge de estado; tabs **Perfil / Contactos / Direcciones / Nombres** (badge "Principal", tags de tipo de dirección, vigencias), skeletons de carga, error con reintento y botón Editar ("Próximamente").
  - Navegación: filas de la lista (desktop y móvil) abren el detalle con `context.push`.
  - Tests: notifier (loading→data por ID) y widget (perfil, contactos con Principal, direcciones y nombres históricos).
- **Relaciones Corporativas (holding-filial, `/corporate-relationships`):**
  - DTOs `TenantRelationshipDto`, `InitiateRelationshipRequestDto`, `EmitInviteTokenResponseDto`, `ConsumeInviteTokenRequestDto`; entidades `CorporateRelationship`/`InviteToken` con estados PENDING/APPROVED/REJECTED/REVOKED/CANCELLED y rol derivado del `tenant_id` local.
  - `RelationshipsRepositoryImpl`: listar, iniciar, emit-token, consume-token, reject, revoke y cancel (rutas asumidas del backend; documentadas en el código).
  - `RelationshipsNotifier`: lista + acciones con refresco de estado.
  - UI: data grid V5 con holding/filial/estado/fecha + motivos; badges por estado y acciones contextuales por rol (holding: emitir token/cancelar/revocar; filial: consumir token/rechazar).
  - Modales: nueva relación (Holding Tenant ID), token con copiar, consumo de token y motivo para rechazar/revocar.
  - Tests: notifier (PENDING→APPROVED al consumir) y modal de consumo (envío/errores).
  - `graphify-out/` añadido al `.gitignore`.
- **Golden Record — Merge de Parties (`POST /parties/merge`):**
  - DTOs `MergePartiesRequestDto` (source/target) y `MergePartiesResponseDto` (source_id, target_id, compressed_party_ids, merged_at) + entidad `MergePartiesResult`.
  - `mergeParties()` en el repositorio y `MergePartiesUseCase`; `MergePartiesNotifier` que invalida/refresca la lista de parties.
  - UI: botón "Fusionar" en la lista → modal con dropdowns Target/Source (excluye fusionadas), aviso ámbar de irreversibilidad y confirmación gradiente.
  - Feedback: badge gris **"Fusionado"** cuando `record_status == MERGED` o `canonical_party_id` presente; esas parties no se ofrecen para nuevas fusiones.
  - Tests: notifier (merge + refresco y marcado MERGED) y widget (IDs correctos, exclusión de fusionadas).
- **Edición de Party (`PUT /parties/{id}`):**
  - DTO `UpdatePartyRequestDto` (`display_name`, `party_type`, perfiles anidados) + `UpdatePartyParams`; `updateParty()` en repositorio y `UpdatePartyUseCase`.
  - `UpdatePartyNotifier` invalida `partyDetailProvider(id)` y `partiesProvider` y espera el refresco del detalle.
  - UI: el botón "Editar" del detalle abre `EditPartyDialog` pre-poblado; `party_type` de solo lectura; campos de persona u organización; SnackBar "Party actualizada correctamente".
  - Tests: notifier (update + refresco de detalle/lista) y widget (pre-poblado y payload de organización/persona).
  - Nota: el permiso backend requerido es `party:write` (singular).
- **i18n completo (es/en):**
  - `l10n.yaml` genera `AppLocalizations` en `lib/core/i18n/generated/`; ARB en `lib/core/i18n/l10n/app_{es,en}.arb`.
  - Todas las pantallas y modales (Parties, Employees, Departments, Corporate Relationships, Settings, Login, Dashboard, shell) usan `context.l10n`; sin textos hardcodeados en la UI.
  - `appLocalizationsDelegates` propio con los delegates de `material_ui`/`cupertino_ui` (compatibilidad Flutter 3.50); el locale se aplica globalmente desde las preferencias del usuario.
  - Tests: cambio de locale es→en en la lista de Parties y paridad de claves entre ambos ARB.
- **Notificaciones en tiempo real (SSE + Outbox):**
  - DTOs `NotificationDto`/`NotificationListEnvelopeDto`; entidades `Notification`/`NotificationPage`; `NotificationsRepositoryImpl` con `GET /notifications`, `PUT /notifications/{id}/read` y stream SSE.
  - `NotificationsNotifier` (autoDispose): carga inicial, acumula eventos SSE, cuenta no leídas, marca leídas de forma optimista y reconecta con backoff 1s→2s→4s→8s→16s→30s. Se cancela al desmontar el shell (logout).
  - Cliente SSE propio sobre `package:http` (streaming real en web y nativo, con `Authorization: Bearer` y cierre de conexión).
  - UI: `AppTopBar` global con campana + badge rojo; panel `MenuAnchor` en desktop y bottom sheet en móvil; título, fecha relativa, punto azul de no leída, empty/error/skeleton y navegación por `resource_type` (`tenant_relationship` → `/corporate-relationships`).
  - Tests: repositorio (GET paginado, PUT, SSE acumulado/deduplicado), notifier (altas, contador y lectura optimista) y widget (badge, lista y empty state).
- **Cierre de sesión (`POST /auth/logout`):**
  - `AuthRepository.logout()` revoca la sesión en el backend (cookie HttpOnly) y **siempre** limpia `access_token` y `tenant_id`, aunque el servidor falle.
  - `LogoutNotifier` (keepAlive) gestiona loading/error e invalida cachés de sesión: notificaciones (SSE), preferencias, Parties y detalle, menú, dashboard, empleados, departamentos/grupos, relaciones, client apps y seguridad.
  - UI: botón `Icons.logout_rounded` en `AppTopBar` con diálogo de confirmación V5; al confirmar navega a `/login`, el `AppShell` se desmonta y el SSE se cierra vía `ref.onDispose`.
  - Tests: repositorio (POST + limpieza aun con fallo), notifier (loading/data + invalidación de Parties) y widget (confirmar/cancelar y navegación).
- **Detalle de Empleado (`/employees/:id`):**
  - Ruta anidada en la rama de Empleados; filas de la tabla y de la lista móvil navegan al detalle.
  - `EmployeeRepository.getEmployeeById()` llama directamente a `GET /employees/{id}` y mapea el 404 a `EmployeeNotFoundException`; `GetEmployeeByIdUseCase` y `EmployeeDetailNotifier` family.
  - UI V5: header con avatar degradado, nombre de la Party, código y badge de estado; tabs de Información laboral (cargo, departamento, fecha, manager), Historial de asignaciones (estado informativo: el backend aún no lo expone) y Contactos de la Party asociada.
  - Tests: repositorio (filtrado y no encontrado), notifier, widget del detalle con catálogos/contactos y navegación desde la lista.
- **Detalle de Departamento (`/departments/:id`):**
  - `GET /departments/{id}` y `GET /departments/{id}/groups`: `DepartmentDetailNotifier` carga departamento y grupos reales en paralelo; el 404 se mapea a `DepartmentNotFoundException`.
  - Ruta anidada; el nombre en el árbol de Departamentos navega al detalle y los sub-departamentos permiten navegación recursiva.
  - UI V5: header con icono degradado, nombre, código y badge de unit_type; tabs General (manager, fecha de creación, grupos corporativos), Sub-departamentos y Empleados (con navegación a `/employees/:id`), con skeletons y empty states.
  - DTO de departamento ahora mapea `unit_type`, `parent_department_id`, `manager_party_id` y `created_at`.
  - Tests: repositorio (detalle, 404, grupos), notifier, página (tres tabs, grupos reales, hijos, empleados y navegación), árbol→detalle y mapeo del DTO.
- Siguiente iteración: nuevas features o ajustes contra el backend real.
