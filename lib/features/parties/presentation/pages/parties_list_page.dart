import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/party.dart';
import '../providers/parties_notifier.dart';
import '../widgets/create_party_form.dart';
import '../widgets/merge_parties_dialog.dart';

/// Lista de Parties — Data Grid V5 Premium.
class PartiesListPage extends ConsumerStatefulWidget {
  const PartiesListPage({super.key});

  @override
  ConsumerState<PartiesListPage> createState() => _PartiesListPageState();
}

class _PartiesListPageState extends ConsumerState<PartiesListPage> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Party> _filter(List<Party> parties) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return parties;
    return parties.where((party) {
      return party.displayName.toLowerCase().contains(q) ||
          party.profileDetail.toLowerCase().contains(q) ||
          _partyTypeLabel(context, party.partyType).toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final partiesAsync = ref.watch(partiesProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(
                  searchController: _searchController,
                  onSearch: (value) => setState(() => _query = value),
                  onCreate: () => showCreatePartyDialog(context, ref),
                  onMerge: () => showMergePartiesDialog(
                    context,
                    ref,
                    partiesAsync.value ?? const <Party>[],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: partiesAsync.when(
                    loading: () => const Center(
                      child: SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    error: (error, _) => _ErrorState(
                      onRetry: () => ref.invalidate(partiesProvider),
                    ),
                    data: (parties) {
                      final filtered = _filter(parties);
                      return Container(
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: theme.colorScheme.outline),
                          boxShadow: isDark
                              ? AppShadows.premiumDark
                              : AppShadows.premiumLight,
                        ),
                        child: filtered.isEmpty
                            ? _EmptyState(query: _query)
                            : LayoutBuilder(
                                builder: (context, constraints) {
                                  if (constraints.maxWidth >= 720) {
                                    return _PartiesTable(parties: filtered);
                                  }
                                  return _PartiesList(parties: filtered);
                                },
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.searchController,
    required this.onSearch,
    required this.onCreate,
    required this.onMerge,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onSearch;
  final VoidCallback onCreate;
  final VoidCallback onMerge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 720;

        final title = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.partiesTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              context.l10n.partiesSubtitle,
              style: TextStyle(
                fontSize: 13,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ],
        );

        final search = TextField(
          controller: searchController,
          onChanged: onSearch,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            isDense: true,
            hintText: context.l10n.partiesSearch,
            hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF71717A)),
            prefixIcon: const Icon(
              Icons.search_rounded,
              size: 17,
              color: Color(0xFF71717A),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 38),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        );

        final mergeButton = OutlinedButton.icon(
          onPressed: onMerge,
          icon: const Icon(Icons.merge_type_rounded, size: 16),
          label: Text(context.l10n.mergeParties),
          style: OutlinedButton.styleFrom(minimumSize: const Size(0, 42)),
        );

        final createButton = ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: Ink(
              height: 42,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.indigo, AppColors.violet],
                ),
              ),
              child: InkWell(
                onTap: onCreate,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add_rounded,
                        size: 17,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        context.l10n.newParty,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        if (!isWide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              title,
              const SizedBox(height: 16),
              search,
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [mergeButton, createButton],
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: title),
            SizedBox(width: 220, child: search),
            const SizedBox(width: 12),
            mergeButton,
            const SizedBox(width: 8),
            createButton,
          ],
        );
      },
    );
  }
}

String _partyTypeLabel(BuildContext context, PartyType type) =>
    type == PartyType.organization
    ? context.l10n.partyTypeOrganization
    : context.l10n.partyTypeIndividual;

class _PartiesTable extends StatelessWidget {
  const _PartiesTable({required this.parties});

  final List<Party> parties;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    Widget headerCell(String label, int flex) => Expanded(
      flex: flex,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: secondary,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: secondary.withValues(alpha: 0.03),
          child: Row(
            children: [
              headerCell(context.l10n.colName, 5),
              headerCell(context.l10n.colType, 3),
              headerCell(context.l10n.colProfile, 4),
              headerCell(context.l10n.colStatus, 3),
            ],
          ),
        ),
        Divider(height: 1, color: theme.colorScheme.outline),
        Expanded(
          child: ListView.separated(
            itemCount: parties.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
            ),
            itemBuilder: (context, index) {
              final party = parties[index];
              return _HoverRow(
                onTap: () => context.push('/parties/${party.id}'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            _PartyAvatar(party: party),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                party.displayName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          _partyTypeLabel(context, party.partyType),
                          style: TextStyle(fontSize: 12.5, color: secondary),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          party.profileDetail,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.5, color: secondary),
                        ),
                      ),
                      Expanded(flex: 3, child: _StatusBadge(party: party)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PartiesList extends StatelessWidget {
  const _PartiesList({required this.parties});

  final List<Party> parties;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return ListView.separated(
      itemCount: parties.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: theme.colorScheme.outline.withValues(alpha: 0.5),
      ),
      itemBuilder: (context, index) {
        final party = parties[index];
        return InkWell(
          onTap: () => context.push('/parties/${party.id}'),
          hoverColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.02)
              : Colors.black.withValues(alpha: 0.02),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _PartyAvatar(party: party, size: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        party.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${_partyTypeLabel(context, party.partyType)} · ${party.profileDetail}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: secondary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _StatusBadge(party: party),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HoverRow extends StatelessWidget {
  const _HoverRow({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      hoverColor: isDark
          ? Colors.white.withValues(alpha: 0.02)
          : Colors.black.withValues(alpha: 0.02),
      child: child,
    );
  }
}

class _PartyAvatar extends StatelessWidget {
  const _PartyAvatar({required this.party, this.size = 32});

  final Party party;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isOrganization = party.partyType == PartyType.organization;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: isOrganization
              ? const [Color(0xFF6366F1), Color(0xFF9333EA)]
              : const [Color(0xFF0EA5E9), Color(0xFF6366F1)],
        ),
      ),
      child: Text(
        party.initials,
        style: TextStyle(
          fontSize: size * 0.34,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.party});

  final Party party;

  @override
  Widget build(BuildContext context) {
    final merged = party.isMerged;
    final active = party.isActive;
    final color = merged
        ? const Color(0xFF71717A)
        : active
        ? AppColors.success
        : AppColors.danger;
    final label = merged
        ? context.l10n.statusMerged
        : (active ? context.l10n.statusActive : context.l10n.statusInactive);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({this.query});

  final String? query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondary = theme.textTheme.bodySmall?.color;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.groups_2_outlined, size: 36, color: secondary),
          const SizedBox(height: 10),
          Text(
            (query ?? '').isEmpty
                ? context.l10n.partiesEmpty
                : context.l10n.noResults(query!),
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.l10n.partiesError),
          const SizedBox(height: 8),
          TextButton(onPressed: onRetry, child: Text(context.l10n.retry)),
        ],
      ),
    );
  }
}
