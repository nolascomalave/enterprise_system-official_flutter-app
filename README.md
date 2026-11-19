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
- Siguiente iteración: migración completa de textos a ARB (es/en) o pantallas de detalle.
