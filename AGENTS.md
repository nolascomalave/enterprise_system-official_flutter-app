# Directrices del Proyecto: Enterprise App (Flutter)

## 1. Contexto del Proyecto
- **Propósito**: Portal de clientes (Tenants) para el backend `enterprise-system` (Go).
- **Regla de Oro**: Esta app es EXCLUSIVAMENTE para usuarios de un Tenant. NUNCA generes código para endpoints de plataforma (`/platform/*`, `/client-applications/first-party`).
- **Aislamiento**: Toda la información ya está filtrada por RLS en el backend. No intentes filtrar por `tenant_id` manualmente en el frontend; confía en el JWT.

## 2. Arquitectura
- **Patrón**: Feature-First + Clean Architecture simplificada.
- **Estructura por Feature**:
  - `data/`: DTOs (Freezed + JSON), Repositorios (Dio).
  - `domain/`: Entidades, Casos de Uso, Interfaces de Repositorio.
  - `presentation/`: Pantallas, Widgets, Notifiers (Riverpod).
- **Gestión de Estado**: Riverpod (`flutter_riverpod` + `riverpod_annotation`). Usa `AsyncNotifier` para estados asíncronos.
- **Generación de Código**: Usa `freezed` para DTOs/Estados y `build_runner` para generar código.

## 3. UI/UX: Diseño "Premium V5"
- **Filosofía**: Serio, empresarial, alta tecnología. Inspirado en Linear, Vercel y Stripe.
- **Paleta de Colores (Dark Mode por defecto)**:
  - Fondo Global: `#09090B` (Zinc 950).
  - Tarjetas/Superficies: `#121212` o `#18181B`.
  - Bordes: `border-white/5` o `border-white/10`.
  - Acento: `#6366F1` (Indigo) con gradientes a `#8B5CF6` (Violet).
  - Texto Principal: `#FAFAFA`, Secundario: `#A1A1AA`.
- **Paleta (Light Mode)**:
  - Fondo: `#FAFAFA`, Tarjetas: `#FFFFFF`, Bordes: `border-black/5`.
- **Tipografía**: Usa `GoogleFonts.inter`. Los títulos deben tener `tracking-tight`.
- **Componentes**:
  - Sombras: Usa `.shadow-premium` (definida en `AppShadows`). Evita los bordes duros.
  - Inputs: `bg-zinc-900/50 border border-white/10 rounded-xl focus:ring-indigo-500`.
  - Botones: `rounded-xl`, gradientes suaves.
  - Estados de Carga: Usa **Skeletons animados** (shimmer), NUNCA `CircularProgressIndicator` genéricos.

## 4. Navegación y Responsividad
- **Router**: Usa `go_router` con `StatefulShellRoute.indexedStack` para preservar el estado de las pestañas.
- **Breakpoints**:
  - **Desktop (> 768px)**: Sidebar colapsable a la izquierda.
  - **Mobile (<= 768px)**: Bottom Navigation Bar flotante tipo píldora + Drawer.
- **Menú Dinámico**: El sidebar/bottom-nav se renderiza basándose en la respuesta de `GET /rbac/my-menu`. Es un árbol recursivo.

## 5. Red y Seguridad
- **Cliente HTTP**: `dio`.
- **Interceptores**:
  - `AuthInterceptor`: Añade `Authorization: Bearer <token>` y `Accept-Language`.
  - `TokenRefreshInterceptor`: Maneja el 401 y refresca el token silenciosamente usando la cookie HttpOnly.
- **Persistencia Segura**: Los tokens se guardan en `flutter_secure_storage`.
- **Preferencias**: El tema y el idioma se obtienen de `GET /users/me/preferences` y se aplican globalmente usando Riverpod.

## 6. Buenas Prácticas y Antipatrones
- ❌ **NUNCA** uses `setState` para manejar lógica de negocio compleja. Usa Notifiers.
- ❌ **NUNCA** expongas los DTOs (respuestas JSON) directamente a la UI. Mapea a Entidades del Dominio.
- ❌ **NUNCA** uses colores hardcodeados en los widgets (ej. `Colors.blue`). Usa los tokens de `Theme.of(context)`.
- ✅ **SIEMPRE** escribe tests unitarios para los Casos de Uso y Repositorios.
- ✅ **SIEMPRE** maneja los estados `loading`, `data` y `error` en la UI.

## 7. Comandos de Utilidad
- Generar código: `dart run build_runner build --delete-conflicting-outputs`
- Ejecutar app con variables: `flutter run -d chrome --dart-define=API_BASE_URL=http://localhost:8080/api/v1 --dart-define=APP_CLIENT_ID=<uuid>`
- Correr tests: `flutter test`