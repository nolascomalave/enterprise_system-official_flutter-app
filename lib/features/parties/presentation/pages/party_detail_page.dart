import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../domain/entities/party_detail.dart';
import '../providers/party_detail_notifier.dart';

/// Detalle de una Party (perfil, contactos, direcciones y nombres).
class PartyDetailPage extends ConsumerWidget {
  const PartyDetailPage({super.key, required this.partyId});

  final String partyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(partyDetailProvider(partyId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Volver',
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/parties');
            }
          },
          icon: const Icon(Icons.arrow_back_rounded, size: 20),
        ),
        title: const Text('Detalle de Party'),
        actions: [
          IconButton(
            tooltip: 'Editar',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Edición próximamente')),
            ),
            icon: const Icon(Icons.edit_outlined, size: 19),
          ),
        ],
      ),
      body: detailAsync.when(
        loading: () => const _DetailSkeleton(),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'No se pudo cargar la party',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.invalidate(partyDetailProvider(partyId)),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (detail) => DefaultTabController(
          length: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DetailHeader(detail: detail),
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: const [
                  Tab(text: 'Perfil'),
                  Tab(text: 'Contactos'),
                  Tab(text: 'Direcciones'),
                  Tab(text: 'Nombres'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _ProfileTab(detail: detail),
                    _ContactsTab(contacts: detail.contacts),
                    _AddressesTab(addresses: detail.addresses),
                    _NamesTab(names: detail.names),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.detail});

  final PartyDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final statusColor =
        detail.isActive ? AppColors.success : AppColors.danger;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: detail.isOrganization
                    ? const [AppColors.indigo, AppColors.purple]
                    : const [Color(0xFF0EA5E9), AppColors.indigo],
              ),
            ),
            child: Text(
              detail.initials,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.6,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      detail.typeLabel,
                      style: TextStyle(fontSize: 12.5, color: secondary),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: statusColor.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        detail.isActive ? 'Activo' : 'Inactivo',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${detail.id}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: secondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab({required this.detail});

  final PartyDetail detail;

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String)>[
      if (detail.person != null) ...[
        if (detail.person!.firstName != null) ('Nombre', detail.person!.firstName!),
        if (detail.person!.middleName != null) ('Segundo nombre', detail.person!.middleName!),
        if (detail.person!.lastName != null) ('Apellido', detail.person!.lastName!),
        if (detail.person!.secondLastName != null)
          ('Segundo apellido', detail.person!.secondLastName!),
        if (detail.person!.birthDate != null)
          ('Fecha de nacimiento', detail.person!.birthDate!),
      ],
      if (detail.organization != null) ...[
        if (detail.organization!.legalName != null)
          ('Razón social', detail.organization!.legalName!),
        if (detail.organization!.tradeName != null)
          ('Nombre comercial', detail.organization!.tradeName!),
        if (detail.organization!.taxId != null) ('Tax ID', detail.organization!.taxId!),
      ],
      ('Tipo', detail.partyType),
      ('Estado', detail.recordStatus),
      if (detail.createdAt != null) ('Creado', detail.createdAt!.substring(0, 10)),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
      children: [
        _InfoCard(
          children: [
            for (var i = 0; i < rows.length; i++) ...[
              _InfoRow(label: rows[i].$1, value: rows[i].$2),
              if (i < rows.length - 1) const SizedBox(height: 12),
            ],
          ],
        ),
        if (detail.nationalities.isNotEmpty) ...[
          const SizedBox(height: 16),
          _InfoCard(
            children: [
              Text('Nacionalidades', style: _sectionStyle(context)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final nationality in detail.nationalities)
                    Chip(label: Text(nationality), visualDensity: VisualDensity.compact),
                ],
              ),
            ],
          ),
        ],
        if (detail.documents.isNotEmpty) ...[
          const SizedBox(height: 16),
          _InfoCard(
            children: [
              Text('Documentos', style: _sectionStyle(context)),
              const SizedBox(height: 10),
              for (var i = 0; i < detail.documents.length; i++) ...[
                _InfoRow(
                  label: detail.documents[i].type,
                  value: detail.documents[i].value,
                ),
                if (i < detail.documents.length - 1) const SizedBox(height: 10),
              ],
            ],
          ),
        ],
      ],
    );
  }

  TextStyle? _sectionStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600);
}

class _ContactsTab extends StatelessWidget {
  const _ContactsTab({required this.contacts});

  final List<PartyContact> contacts;

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) {
      return const _EmptyTab(
        icon: Icons.alternate_email_rounded,
        message: 'Sin contactos registrados',
      );
    }
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
      itemCount: contacts.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: _rowDecoration(context),
          child: Row(
            children: [
              Icon(
                contact.isPhone
                    ? Icons.phone_outlined
                    : contact.isEmail
                        ? Icons.mail_outline_rounded
                        : Icons.contact_mail_outlined,
                size: 18,
                color: AppColors.indigo,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      contact.type,
                      style: TextStyle(fontSize: 11, color: secondary),
                    ),
                  ],
                ),
              ),
              if (contact.isPrimary)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.indigo.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    'Principal',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.indigo,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _AddressesTab extends StatelessWidget {
  const _AddressesTab({required this.addresses});

  final List<PartyAddress> addresses;

  @override
  Widget build(BuildContext context) {
    if (addresses.isEmpty) {
      return const _EmptyTab(
        icon: Icons.location_on_outlined,
        message: 'Sin direcciones registradas',
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
      itemCount: addresses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final address = addresses[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: _rowDecoration(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined, size: 18, color: AppColors.indigo),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.indigo.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        address.type.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          color: AppColors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(address.text, style: const TextStyle(fontSize: 13, height: 1.4)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NamesTab extends StatelessWidget {
  const _NamesTab({required this.names});

  final List<PartyNameEntry> names;

  @override
  Widget build(BuildContext context) {
    if (names.isEmpty) {
      return const _EmptyTab(
        icon: Icons.history_rounded,
        message: 'Sin nombres históricos',
      );
    }
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
      itemCount: names.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final entry = names[index];
        final validity = [entry.validFrom, entry.validTo]
            .whereType<String>()
            .where((value) => value.isNotEmpty)
            .join(' → ');
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: _rowDecoration(context),
          child: Row(
            children: [
              const Icon(Icons.badge_outlined, size: 18, color: AppColors.indigo),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.name,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    if (validity.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        validity,
                        style: TextStyle(fontSize: 11, color: secondary),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

BoxDecoration _rowDecoration(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  return BoxDecoration(
    color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: theme.colorScheme.outline),
  );
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _rowDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: TextStyle(fontSize: 12.5, color: secondary),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class _EmptyTab extends StatelessWidget {
  const _EmptyTab({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: theme.textTheme.bodySmall?.color),
          const SizedBox(height: 10),
          Text(message, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Row(
          children: [
            SkeletonBox(width: 64, height: 64, borderRadius: 32),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonBox(width: 180, height: 18),
                  SizedBox(height: 8),
                  SkeletonBox(width: 100, height: 12),
                  SizedBox(height: 8),
                  SkeletonBox(width: 140, height: 10),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        SkeletonBox(height: 36, borderRadius: 10),
        SizedBox(height: 24),
        SkeletonBox(height: 220, borderRadius: 12),
      ],
    );
  }
}
