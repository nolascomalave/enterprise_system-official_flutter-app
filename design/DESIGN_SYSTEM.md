# Design System — Enterprise Flutter App

> **Fuente:** generado con la skill `ui-ux-pro-max` (estilos `Minimalism & Swiss Style` + `Swiss Modernism 2.0`, paleta SaaS, guías UX móviles).
> **Versión:** 1.0 · **Fecha:** 2026-11-13 · **Estado:** Activo — referencia para todas las pantallas.

---

## 1. Principios

1. **Confianza corporativa, sin frialdad:** estilo SaaS moderno (referencias: Linear, Stripe) — limpio, con aire, pero con radios suaves y acentos amigables.
2. **Mobile first:** todo se diseña a 375px primero; desktop es una ampliación, no lo contrario.
3. **Accesibilidad AAA por defecto:** contraste ≥ 4.5:1 (texto), ≥ 7:1 donde sea crítico; foco visible; nunca usar solo el color para comunicar estado.
4. **Jerarquía clara:** un solo color de acento por pantalla; el color se reserva para acción y estado.

## 2. Estilo visual

| Atributo | Valor |
|---|---|
| Nombre | **Modern Corporate SaaS** (base: Minimalism & Swiss / Swiss Modernism 2.0) |
| Palabras clave | Limpio, espacioso, funcional, alto contraste, tipográfico, grid |
| Radios | Botones e inputs `10px`; tarjetas `14px`; modales `16px`; pills `999px` |
| Sombras | Sutiles, solo elevación: `0 1px 3px rgba(15,23,42,0.08)`, `0 8px 24px rgba(15,23,42,0.10)` |
| Animación | 150–200ms `ease-out`; hover solo color/opacidad (nunca escala que desplace layout); respetar `prefers-reduced-motion` |
| Grid | Base **8px**; contenedor móvil `100% − 24px` de margen; desktop máx. `400px` (auth) / `1200px` (dashboard) |
| Iconografía | SVG lineales 24×24 (Heroicons/Lucide), stroke 1.5–2px. **Prohibido usar emoji como icono** |

## 3. Paleta de colores

### 3.1 Marca (confianza — azules/índigos)

| Token | Hex | Uso |
|---|---|---|
| `primary-900` | `#312E81` | Titulares sobre fondos primarios |
| `primary-700` | `#4338CA` | Hover / pressed del primario |
| `primary-600` | `#4F46E5` | **Color primario**: botones, enlaces, foco |
| `primary-500` | `#6366F1` | Elementos interactivos secundarios |
| `primary-100` | `#E0E7FF` | Fondos de badges, selección |
| `primary-50` | `#EEF2FF` | Fondos sutiles de marca |

### 3.2 Neutros (slate)

| Token | Hex | Uso |
|---|---|---|
| `text-primary` | `#0F172A` | Texto principal (slate-900) |
| `text-secondary` | `#475569` | Texto secundario / labels (slate-600, mínimo permitido en light) |
| `text-muted` | `#94A3B8` | Solo placeholders y metadatos, nunca cuerpo |
| `border` | `#E2E8F0` | Bordes de inputs y tarjetas |
| `surface` | `#FFFFFF` | Tarjetas, inputs |
| `background` | `#F8FAFC` | Fondo de pantalla (slate-50) |

### 3.3 Estados

| Estado | Base | Hover/Strong | Fondo suave | Texto en suave | Icono |
|---|---|---|---|---|---|
| Éxito | `#16A34A` | `#15803D` | `#DCFCE7` | `#14532D` | check-circle |
| Peligro | `#DC2626` | `#B91C1C` | `#FEE2E2` | `#7F1D1D` | x-circle / alert |
| Advertencia | `#D97706` | `#B45309` | `#FEF3C7` | `#78350F` | alert-triangle |
| Información | `#0284C7` | `#0369A1` | `#E0F2FE` | `#0C4A6E` | info |

> Regla: cada estado combina **color + icono + texto** (nunca color solo).

## 4. Tipografía

**Familia:** `Inter` (Google Fonts) → fallback nativo: `-apple-system, "SF Pro", Roboto, sans-serif`.
**Mood:** profesional, legible, accesible (Inter está diseñada para pantallas de alta densidad).

| Rol | Peso | Tamaño/Línea (mobile → desktop) | Ejemplo de uso |
|---|---|---|---|
| **Display** | 700 | 32/38 → 40/48 | Títulos de bienvenida |
| **H1** | 700 | 28/34 → 32/40 | Título de pantalla |
| **H2** | 600 | 22/28 → 24/32 | Secciones |
| **H3** | 600 | 18/24 → 18/26 | Tarjetas, subsecciones |
| **Body** | 400 | 15/22 (mismo en desktop) | Contenido, inputs |
| **Body-strong** | 500 | 15/22 | Labels de campos |
| **Caption** | 400 | 12/16 | Ayuda, metadatos, legal |
| **Button** | 600 | 15/1 | Texto de botones (mayúsculas solo en pills) |

Reglas: líneas de cuerpo ≤ 70 caracteres; tracking `-0.01em` en títulos ≥ 22px; nunca gris `#94A3B8` para texto de lectura.

## 5. Mobile first — táctil y formularios

| Regla | Valor |
|---|---|
| Área táctil mínima | **48×48px** (objetivo del proyecto; supercede el mínimo WCAG de 44px) |
| Separación entre táctiles | ≥ **8px** (recomendado 12px en flujos críticos) |
| Altura de botón primario | **52px** (secundario/terciario: 44–48px) |
| Altura de input | **52px**, radio 10px, fuente 15–16px (evita zoom en iOS) |
| Espaciado vertical entre campos | **20px** |
| Padding de tarjetas | **20px** móvil / **32px** desktop |
| Feedback táctil | pressed: `primary-700` + opacidad 0.92; siempre `cursor: pointer` en web |
| Teclado | `inputmode` correcto (email → `email`, código → `numeric`); `autocomplete` activado |
| Errores en formularios | Mensaje bajo el campo (12–13px, `danger`), icono + aria-describedby |

## 6. Componentes base (tokens)

```css
/* Resumen de tokens (Tailwind-ready) */
--radius-btn: 10px;  --radius-card: 14px;  --radius-input: 10px;
--shadow-1: 0 1px 3px rgba(15,23,42,.08);
--shadow-2: 0 8px 24px rgba(15,23,42,.10);
--tap-min: 48px;  --btn-h: 52px;  --input-h: 52px;  --space-unit: 8px;
```

### Botones
- **Primario:** fondo `primary-600`, texto blanco, h-52, radio 10, sombra `shadow-1`; hover `primary-700`.
- **Secundario (outline):** fondo blanco, borde `border`, texto `text-primary`; hover fondo `primary-50`.
- **Ghost/enlace:** texto `primary-600`, peso 600, h-48.

### Inputs
- Label 13px/600 `text-secondary` encima del campo; placeholder `text-muted`.
- Borde `#E2E8F0`; focus: borde `primary-600` + anillo `3px rgba(79,70,229,0.35)`.
- Icono de acción (ojo, calendar) alineado a la derecha con área táctil 48px.

### Alertas
- Radio 10px, fondo suave del estado, borde izquierdo 4px del estado, icono 20px + texto 13px del color fuerte.

## 7. Mapeo a Flutter (referencia)

```dart
// ThemeData resumen
colorScheme: ColorScheme.light(
  primary: Color(0xFF4F46E5),      // primary-600
  secondary: Color(0xFF6366F1),    // primary-500
  surface: Colors.white,
  error: Color(0xFFDC2626),
),
scaffoldBackgroundColor: Color(0xFFF8FAFC),
textTheme: TextTheme(...)        // Inter, jerarquía de la sección 4
visualDensity: VisualDensity.standard,
materialTapTargetSize: MaterialTapTargetSize.padded, // targets ≥ 48px
```

## 8. Checklist pre-entrega (de la skill)

- [ ] Sin emojis como iconos (solo SVG Heroicons/Lucide)
- [ ] `cursor-pointer` en todos los elementos clicables
- [ ] Hover con transición 150–300ms, sin desplazamiento de layout
- [ ] Contraste de texto ≥ 4.5:1 en modo claro
- [ ] Estados de foco visibles para navegación por teclado
- [ ] `prefers-reduced-motion` respetado
- [ ] Responsive verificado a 375 / 768 / 1024 / 1440px
- [ ] Targets táctiles ≥ 48×48px con separación ≥ 8px
